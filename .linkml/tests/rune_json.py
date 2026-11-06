"""Read a CDM document as Rune serialises it, in the form this schema states.

FINOS's tree holds CDM documents that Rune's JSON serialiser wrote, such as the
trade states its FpML ingest produces. Rune adds keys that carry the CDM's
metadata rather than its data, and writes a choice by the type it holds. This
module undoes both, with the schema's own modules as its only guide, so that the
generated JSON Schema can judge the document:

- `@model`, `@version` and every `@key`, `@key:external` and `@key:scoped` go:
  a key is metadata, which the schema states as an annotation, not a slot.
- An object holding only `@ref`, `@ref:external` or `@ref:scoped` stands for the
  object in the same document whose key matches, so it is replaced by a copy of
  that object. A reference whose target the document does not hold stays as it is.
- `{"@data": value, "@scheme": ...}` is a value with its scheme, so it becomes the
  value.
- `{"@type": "cdm.x.y.T", ...}` where the schema expects a choice becomes the
  option that holds T, nested through any inner choice: an Asset holding a
  Security reads `{"Instrument": {"Security": {...}}}`, as the choice's
  attributes state it.

What it cannot undo, it reports: a `@type` naming a subtype where the schema
expects its parent, and a reference it cannot resolve.
"""

from __future__ import annotations

import copy
from dataclasses import dataclass, field
from pathlib import Path

import yaml

KEY_FIELDS = ("@key", "@key:external", "@key:scoped")
ABSENT = object()
REF_FIELDS = {
    "@ref": "@key",
    "@ref:external": "@key:external",
    "@ref:scoped": "@key:scoped",
}


@dataclass
class ClassInfo:
    name: str
    parent: str | None
    attributes: dict[str, dict]
    usage: dict[str, dict]
    choice: bool


@dataclass
class Findings:
    subtypes: list[str] = field(default_factory=list)
    unresolved: list[str] = field(default_factory=list)


class Schema:
    """The classes, their attributes and ranges, read from the schema's modules."""

    def __init__(self, schema_dir: Path):
        self.classes: dict[str, ClassInfo] = {}
        self.enums: set[str] = set()
        self.by_rosetta_name: dict[str, str] = {}
        for path in sorted(schema_dir.glob("*.yaml")):
            doc = yaml.safe_load(path.read_text(encoding="utf-8"))
            namespace = doc["name"].replace("_", ".")
            for name, c in (doc.get("classes") or {}).items():
                qualified = (c.get("annotations") or {}).get(
                    "rosetta_name"
                ) or f"{namespace}.{name}"
                self.by_rosetta_name[qualified] = name
                self.classes[name] = ClassInfo(
                    name,
                    c.get("is_a"),
                    c.get("attributes") or {},
                    c.get("slot_usage") or {},
                    (c.get("annotations") or {}).get("rosetta_choice") == "true",
                )
            self.enums.update((doc.get("enums") or {}).keys())
        self._attrs: dict[str, dict[str, dict]] = {}

    def attributes(self, name: str) -> dict[str, dict]:
        if name not in self._attrs:
            c = self.classes[name]
            out = dict(self.attributes(c.parent)) if c.parent else {}
            for k, v in c.attributes.items():
                out[k] = v
            for k, v in c.usage.items():
                out[k] = {**out.get(k, {}), **v}
            self._attrs[name] = out
        return self._attrs[name]

    def choice_path(self, choice: str, target: str, seen=()) -> list[str] | None:
        """The option names that lead from a choice to a type it can hold."""
        for opt, a in self.attributes(choice).items():
            rng = a.get("range")
            if rng == target:
                return [opt]
            if rng in self.classes and self.classes[rng].choice and rng not in seen:
                inner = self.choice_path(rng, target, seen + (choice,))
                if inner is not None:
                    return [opt] + inner
        return None


class Normaliser:
    def __init__(self, schema: Schema):
        self.schema = schema

    def keyed(self, doc) -> dict[tuple[str, str], list[dict]]:
        out: dict[tuple[str, str], list[dict]] = {}

        def walk(node):
            if isinstance(node, dict):
                for k in KEY_FIELDS:
                    if k in node:
                        out.setdefault((k, node[k]), []).append(node)
                for v in node.values():
                    walk(v)
            elif isinstance(node, list):
                for v in node:
                    walk(v)

        walk(doc)
        return out

    def normalise(self, doc: dict) -> tuple[str, dict, Findings]:
        """Return the root class, the document in the schema's form, and what was left."""
        root = self.schema.by_rosetta_name[doc["@type"]]
        self.index = self.keyed(doc)
        self.findings = Findings()
        body = {
            k: v for k, v in doc.items() if k not in ("@model", "@type", "@version")
        }
        return root, self.object(body, root, "", 0), self.findings

    def fits(self, target: dict, cls: str | None) -> bool:
        """Whether an object's own keys are all attributes of the class expected."""
        if cls not in self.schema.classes:
            return True
        attrs = self.schema.attributes(cls)
        return all(k.startswith("@") or k in attrs for k in target)

    def resolve(
        self, node: dict, path: str, depth: int, cls: str | None = None
    ) -> dict:
        refs = [k for k in node if k in REF_FIELDS]
        if not refs or any(not k.startswith("@") for k in node):
            return node
        for k in refs:
            # FpML ids can name more than one object once ingested, so a reference
            # takes the first object with its key that the expected class can hold.
            targets = self.index.get((REF_FIELDS[k], node[k]), [])
            fitting = [t for t in targets if self.fits(t, cls)] or targets
            if fitting and depth < 40:
                return copy.deepcopy(fitting[0])
        self.findings.unresolved.append(path)
        return node

    def object(self, node, cls: str, path: str, depth: int):
        if not isinstance(node, dict):
            return node
        node = self.resolve(node, path, depth, cls)
        if "@data" in node:
            # A value with metadata: the value is the object the schema expects here.
            return self.value(node["@data"], cls, path, depth)
        info = self.schema.classes.get(cls)
        if info is None:
            return node
        if "@type" in node:
            actual = self.schema.by_rosetta_name.get(node["@type"], node["@type"])
            rest = {k: v for k, v in node.items() if k != "@type"}
            if actual != cls:
                if info.choice:
                    route = self.schema.choice_path(cls, actual)
                    if route is not None:
                        inner = self.object(
                            rest, actual, path + "/" + "/".join(route), depth + 1
                        )
                        for opt in reversed(route):
                            inner = {opt: inner}
                        return inner
                self.findings.subtypes.append(
                    f"{path}: {actual} where {cls} is expected"
                )
            node = rest
        attrs = self.schema.attributes(cls)
        out = {}
        for k, v in node.items():
            if k in KEY_FIELDS or k in REF_FIELDS:
                continue
            rng = (attrs.get(k) or {}).get("range")
            if isinstance(v, list):
                items = [
                    self.value(x, rng, f"{path}/{k}/{i}", depth)
                    for i, x in enumerate(v)
                ]
                items = [x for x in items if x is not ABSENT]
                if items:
                    out[k] = items
            else:
                x = self.value(v, rng, f"{path}/{k}", depth)
                if x is not ABSENT:
                    out[k] = x
        return out

    def value(self, v, rng, path, depth):
        if isinstance(v, dict):
            if rng in self.schema.classes:
                return self.object(v, rng, path, depth + 1)
            if "@data" in v:
                return v["@data"]
            if v and all(k in REF_FIELDS for k in v):
                # A reference to a value of a basic type, such as a date, names
                # where the value is and not the value, so the value is unknown here.
                self.findings.unresolved.append(path)
                return ABSENT
        return v
