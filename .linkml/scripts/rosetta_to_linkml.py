#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = ["pyyaml"]
# ///
"""Write the LinkML schema from the CDM's Rosetta model in this repository.

The CDM declares its data model in Rosetta, under rosetta-source/src/main/rosetta/.
This script reads every `type`, `choice`, `enum` and `typeAlias` there and writes one
LinkML module per Rosetta namespace, plus the umbrella common_domain_model.yaml that
imports them all. It reads nothing else but the FpML code lists a code-list type
alias names, under rosetta-source/src/main/resources/codelist/json/.

What each Rosetta construct becomes is stated once, in docs/about.md, and each
function below says which construct it reads. A condition the translator cannot
state in LinkML is named in the class's `comments`, with its Rosetta text, so
nothing Rosetta states is dropped without a trace.

Usage::

    python scripts/rosetta_to_linkml.py          # write the modules
    python scripts/rosetta_to_linkml.py --check  # exit 1 when a module differs
    python scripts/rosetta_to_linkml.py --report # print what was and was not stated
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from urllib.parse import quote

import yaml

ROOT = Path(__file__).resolve().parent.parent
TREE = ROOT.parent
ROSETTA_DIR = TREE / "rosetta-source" / "src" / "main" / "rosetta"
CODELIST_DIR = (
    TREE / "rosetta-source" / "src" / "main" / "resources" / "codelist" / "json"
)
SCHEMA_DIR = ROOT / "src" / "common_domain_model" / "schema"
PINS = ROOT / "upstream" / "pin.yaml"

SCHEMA_NAME = "common_domain_model"
KEYS_MODULE = "common_domain_model_keys"

# Attribute names the CDM uses that LOKF's schema also defines as slots, under
# other IRIs. A host imports the schema's `lokf adapt` copy beside lokf.yaml, and
# the JSON-LD context gives each key one IRI, so a CDM key named like a LOKF one
# would project a concept's own description, name or version under the CDM's
# IRI. `lokf adapt` renames a clashing slot in the copy, keeping its IRI, but not
# a class's attribute, so these names are top-level slots in KEYS_MODULE, and each
# class gives its own description and range in slot_usage. tests/test_schema_rules.py
# holds the list to .lokf/lokf.yaml.
LOKF_KEYS = (
    "additionalType",
    "description",
    "documentation",
    "email",
    "endDate",
    "name",
    "publisher",
    "source",
    "startDate",
    "timestamp",
    "unit",
    "url",
    "version",
)
SCHEMA_ID = "https://w3id.org/lmodel/common-domain-model"
PREFIX = "common_domain_model"

# Rosetta's built-in types, and the LinkML type each one becomes.
BASIC_TYPES = {
    "string": "string",
    "int": "integer",
    "number": "decimal",
    "boolean": "boolean",
    "date": "date",
    "time": "time",
    "zonedDateTime": "datetime",
    "dateTime": "datetime",
    # Rune's `calculation` names a calculation and becomes a string in Java and JSON.
    "calculation": "string",
}

# ---------------------------------------------------------------------------
# Lexing
# ---------------------------------------------------------------------------

TOKEN_RE = re.compile(
    r"""
    (?P<doc><"(?:.|\n)*?">)
  | (?P<str>"(?:\\.|[^"\\])*")
  | (?P<num>\d+(?:\.\d+)?)
  | (?P<id>\^?[A-Za-z_][A-Za-z0-9_]*(?:-[a-z]+)*)
  | (?P<op>->>|->|\.\.|<>|<=|>=|[^\s\w"])
    """,
    re.VERBOSE,
)

HYPHENATED = {
    "one-of",
    "only-element",
    "to-string",
    "to-number",
    "to-int",
    "to-enum",
    "to-date",
    "to-time",
    "to-zoned-date-time",
    "to-date-time",
    "post-condition",
}


@dataclass
class Tok:
    kind: str
    text: str
    line: int
    col: int
    first: bool  # the first token on its line


def strip_comments(text: str) -> str:
    """Blank out // and /* */ comments, leaving docs and strings alone."""
    out = []
    i, n = 0, len(text)
    while i < n:
        if text.startswith('<"', i):
            j = text.find('">', i + 2)
            j = n if j < 0 else j + 2
            out.append(text[i:j])
            i = j
        elif text[i] == '"':
            j = i + 1
            while j < n and text[j] != '"':
                j += 2 if text[j] == "\\" else 1
            out.append(text[i : j + 1])
            i = j + 1
        elif text.startswith("//", i):
            j = text.find("\n", i)
            j = n if j < 0 else j
            i = j
        elif text.startswith("/*", i):
            j = text.find("*/", i + 2)
            j = n if j < 0 else j + 2
            out.append(re.sub(r"[^\n]", " ", text[i:j]))
            i = j
        else:
            out.append(text[i])
            i += 1
    return "".join(out)


def tokenize(text: str) -> list[Tok]:
    text = strip_comments(text)
    toks: list[Tok] = []
    line_starts = [0] + [m.end() for m in re.finditer(r"\n", text)]
    pos = 0
    last_line = -1
    import bisect

    while pos < len(text):
        if text[pos].isspace():
            pos += 1
            continue
        m = TOKEN_RE.match(text, pos)
        if not m:
            raise SyntaxError(f"cannot read {text[pos : pos + 30]!r}")
        kind = m.lastgroup
        tok = m.group(0)
        if kind == "id" and "-" in tok and tok not in HYPHENATED:
            # A hyphen after an identifier is subtraction, not part of the name.
            tok = tok.split("-", 1)[0]
        line = bisect.bisect_right(line_starts, pos) - 1
        col = pos - line_starts[line]
        toks.append(Tok(kind, tok, line + 1, col, line != last_line))
        last_line = line
        pos += len(tok)
    return toks


def doc_text(tok: Tok) -> str:
    return re.sub(r"\s+", " ", tok.text[2:-2]).strip()


def str_text(tok: Tok) -> str:
    return tok.text[1:-1].replace('\\"', '"')


# ---------------------------------------------------------------------------
# The model Rosetta declares
# ---------------------------------------------------------------------------


@dataclass
class DocRef:
    body: str
    corpus: str
    segments: list[tuple[str, str]] = field(default_factory=list)
    has_provision: bool = False

    def text(self) -> str:
        parts = [self.body, self.corpus] + [f"{k} {v}" for k, v in self.segments]
        return " ".join(p for p in parts if p)

    def scheme_location(self) -> str | None:
        for k, v in self.segments:
            if k == "schemeLocation":
                return v
        return None


@dataclass
class Annots:
    metadata: list[str] = field(default_factory=list)
    doc_refs: list[DocRef] = field(default_factory=list)
    deprecated: bool = False
    root_type: bool = False
    other: list[str] = field(default_factory=list)


@dataclass
class Attr:
    name: str
    type: str
    lower: int
    upper: int | None  # None for *
    doc: str = ""
    override: bool = False
    annots: Annots = field(default_factory=Annots)


@dataclass
class Condition:
    name: str
    doc: str
    toks: list[Tok]

    def source(self) -> str:
        out = []
        for t in self.toks:
            if out and t.text not in (",", ")", "]") and out[-1] not in ("(", "["):
                out.append(" ")
            out.append(t.text)
        s = "".join(out)
        s = re.sub(r" -> ", " -> ", s)
        return s


@dataclass
class TypeDecl:
    kind: str  # type, choice, enum, alias
    name: str
    namespace: str
    doc: str = ""
    extends: str | None = None
    annots: Annots = field(default_factory=Annots)
    attrs: list[Attr] = field(default_factory=list)
    conditions: list[Condition] = field(default_factory=list)
    values: list[dict] = field(default_factory=list)  # enum values
    alias_base: str = ""
    alias_args: dict = field(default_factory=dict)
    alias_params: list[str] = field(default_factory=list)
    file: str = ""
    imports: list[str] = field(default_factory=list)
    lname: str = ""  # the LinkML name: the Rosetta name, qualified only where two namespaces share it


class Parser:
    """Read the declarations of one Rosetta file."""

    TOP = {
        "namespace",
        "version",
        "import",
        "type",
        "choice",
        "enum",
        "typeAlias",
        "func",
        "annotation",
        "metaType",
        "body",
        "corpus",
        "segment",
        "reporting",
        "rule",
        "library",
        "isEvent",
        "isProduct",
        "synonym",
        "report",
        "eligibility",
        "recordType",
        "basicType",
        "external",
        "qualifiedType",
    }

    def __init__(self, path: Path):
        self.path = path
        self.toks = tokenize(path.read_text(encoding="utf-8"))
        self.namespace = ""
        self.imports: list[str] = []
        self.decls: list[TypeDecl] = []

    def blocks(self):
        block: list[Tok] = []
        for t in self.toks:
            if t.col == 0 and t.kind == "id" and t.text in self.TOP and block:
                yield block
                block = []
            block.append(t)
        if block:
            yield block

    def parse(self) -> list[TypeDecl]:
        for b in self.blocks():
            head = b[0].text
            if head == "namespace":
                ns = []
                i = 1
                while i < len(b) and (b[i].kind == "id" or b[i].text == "."):
                    ns.append(b[i].text)
                    i += 1
                self.namespace = "".join(ns)
            elif head == "import":
                self.imports.append(
                    "".join(t.text for t in b[1:] if t.text != "as").split(" ")[0]
                )
            elif head == "type":
                self.decls.append(self.parse_type(b))
            elif head == "choice":
                self.decls.append(self.parse_choice(b))
            elif head == "enum":
                self.decls.append(self.parse_enum(b))
            elif head == "typeAlias":
                self.decls.append(self.parse_alias(b))
        for d in self.decls:
            d.imports = self.imports
        return self.decls

    # -- shared pieces ----------------------------------------------------

    def parse_header(self, b: list[Tok], kind: str) -> tuple[TypeDecl, int]:
        d = TypeDecl(
            kind=kind,
            name=b[1].text.lstrip("^"),
            namespace=self.namespace,
            file=self.path.name,
        )
        i = 2
        if i < len(b) and b[i].text == "(":  # typeAlias parameters
            j = i
            depth = 0
            while True:
                if b[j].text == "(":
                    depth += 1
                elif b[j].text == ")":
                    depth -= 1
                    if depth == 0:
                        break
                j += 1
            d.alias_params = [
                t.text
                for k, t in enumerate(b[i + 1 : j])
                if t.kind == "id" and k % 3 == 0
            ]
            i = j + 1
        if i < len(b) and b[i].text == "extends":
            d.extends, i = self.qualified(b, i + 1)
        if i < len(b) and b[i].text == ":":
            i += 1
        if i < len(b) and b[i].kind == "doc":
            d.doc = doc_text(b[i])
            i += 1
        return d, i

    def qualified(self, b: list[Tok], i: int) -> tuple[str, int]:
        parts = [b[i].text.lstrip("^")]
        i += 1
        while i + 1 < len(b) and b[i].text == "." and b[i + 1].kind == "id":
            parts.append(b[i + 1].text)
            i += 2
        return parts[-1], i

    def annotation(self, b: list[Tok], i: int, annots: Annots) -> int:
        """Read one [...] annotation starting at b[i]."""
        j = i
        depth = 0
        while True:
            if b[j].text == "[":
                depth += 1
            elif b[j].text == "]":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        inner = b[i + 1 : j]
        if not inner:
            return j + 1
        head = inner[0].text
        if head == "metadata" and len(inner) > 1:
            annots.metadata.append(inner[1].text)
        elif head == "docReference":
            ref = DocRef(
                body=inner[1].text if len(inner) > 1 else "",
                corpus=inner[2].text if len(inner) > 2 else "",
            )
            k = 3
            while k < len(inner):
                t = inner[k]
                if t.kind == "id" and t.text == "provision":
                    ref.has_provision = True
                    k += 2
                elif (
                    t.kind == "id" and k + 1 < len(inner) and inner[k + 1].kind == "str"
                ):
                    ref.segments.append((t.text, str_text(inner[k + 1])))
                    k += 2
                else:
                    k += 1
            annots.doc_refs.append(ref)
        elif head == "deprecated":
            annots.deprecated = True
        elif head == "rootType":
            annots.root_type = True
        else:
            annots.other.append(head)
        return j + 1

    def conditions(self, b: list[Tok], i: int, d: TypeDecl) -> int:
        """Read the conditions that close a type, a choice or a type alias."""
        while i < len(b):
            t = b[i]
            if t.text != "condition":
                i += 1
                continue
            i += 1
            name = ""
            if i < len(b) and b[i].kind == "id" and b[i].text != ":":
                name = b[i].text
                i += 1
            doc = ""
            if i < len(b) and b[i].text == ":":
                i += 1
            if i < len(b) and b[i].kind == "doc":
                doc = doc_text(b[i])
                i += 1
            start = i
            while i < len(b) and not (b[i].text == "condition" and b[i].first):
                i += 1
            body = [x for x in b[start:i] if x.kind != "doc"]
            d.conditions.append(Condition(name, doc, body))
        return i

    # -- declarations -----------------------------------------------------

    def parse_type(self, b: list[Tok]) -> TypeDecl:
        d, i = self.parse_header(b, "type")
        target = d.annots
        while i < len(b):
            t = b[i]
            if t.text == "[":
                i = self.annotation(b, i, target)
            elif t.text == "condition" and t.first:
                i = self.conditions(b, i, d)
            elif t.kind == "id":
                i, a = self.attribute(b, i)
                d.attrs.append(a)
                target = a.annots
            else:
                raise SyntaxError(
                    f"{self.path.name}:{t.line}: unexpected {t.text!r} in type {d.name}"
                )
        return d

    def attribute(self, b: list[Tok], i: int) -> tuple[int, Attr]:
        override = False
        if b[i].text == "override":
            override = True
            i += 1
        name = b[i].text.lstrip("^")
        typ, i = self.qualified(b, i + 1)
        if b[i].text == "(" and b[i + 2].text != "..":  # type arguments
            depth = 0
            while True:
                if b[i].text == "(":
                    depth += 1
                elif b[i].text == ")":
                    depth -= 1
                    if depth == 0:
                        break
                i += 1
            i += 1
        assert b[i].text == "(", (self.path.name, b[i].line, name)
        lower = int(b[i + 1].text)
        upper = None if b[i + 3].text == "*" else int(b[i + 3].text)
        i += 5
        doc = ""
        if i < len(b) and b[i].kind == "doc":
            doc = doc_text(b[i])
            i += 1
        return i, Attr(name, typ, lower, upper, doc, override)

    def parse_choice(self, b: list[Tok]) -> TypeDecl:
        d, i = self.parse_header(b, "choice")
        target = d.annots
        while i < len(b):
            t = b[i]
            if t.text == "[":
                i = self.annotation(b, i, target)
            elif t.text == "condition" and t.first:
                i = self.conditions(b, i, d)
            elif t.kind == "id":
                typ, i = self.qualified(b, i)
                doc = ""
                if i < len(b) and b[i].kind == "doc":
                    doc = doc_text(b[i])
                    i += 1
                a = Attr(typ, typ, 0, 1, doc)
                d.attrs.append(a)
                target = a.annots
            else:
                raise SyntaxError(
                    f"{self.path.name}:{t.line}: unexpected {t.text!r} in choice {d.name}"
                )
        return d

    def parse_enum(self, b: list[Tok]) -> TypeDecl:
        d, i = self.parse_header(b, "enum")
        target = d.annots
        while i < len(b):
            t = b[i]
            if t.text == "[":
                i = self.annotation(b, i, target)
            elif t.kind == "id":
                v = {
                    "name": t.text.lstrip("^"),
                    "display": None,
                    "doc": "",
                    "annots": Annots(),
                }
                i += 1
                if i < len(b) and b[i].text == "displayName":
                    v["display"] = str_text(b[i + 1])
                    i += 2
                if i < len(b) and b[i].kind == "doc":
                    v["doc"] = doc_text(b[i])
                    i += 1
                d.values.append(v)
                target = v["annots"]
            else:
                raise SyntaxError(
                    f"{self.path.name}:{t.line}: unexpected {t.text!r} in enum {d.name}"
                )
        return d

    def parse_alias(self, b: list[Tok]) -> TypeDecl:
        d, i = self.parse_header(b, "alias")
        d.alias_base, i = self.qualified(b, i)
        if i < len(b) and b[i].text == "(":
            i += 1
            while b[i].text != ")":
                if b[i].kind == "id" and b[i + 1].text == ":":
                    key = b[i].text
                    i += 2
                    sign = ""
                    if b[i].text == "-":
                        sign = "-"
                        i += 1
                    val = b[i]
                    d.alias_args[key] = (
                        str_text(val) if val.kind == "str" else sign + val.text
                    )
                    i += 1
                else:
                    i += 1
            i += 1
        self.conditions(b, i, d)
        return d


# ---------------------------------------------------------------------------
# Conditions: a small expression parser and the LinkML each shape becomes
# ---------------------------------------------------------------------------


class Unstated(Exception):
    """A condition, or part of one, that LinkML cannot state."""


class Expr:
    def __init__(self, op, *args):
        self.op = op
        self.args = args

    def __repr__(self):
        return f"{self.op}{self.args}"


class ExprParser:
    COMPARE = {"=", "<>", "<", "<=", ">", ">=", "contains", "disjoint"}

    def __init__(self, toks: list[Tok]):
        self.t = toks
        self.i = 0

    def peek(self, k=0):
        j = self.i + k
        return self.t[j].text if j < len(self.t) else None

    def take(self, text=None):
        tok = self.t[self.i]
        if text is not None and tok.text != text:
            raise Unstated(f"expected {text}, found {tok.text}")
        self.i += 1
        return tok

    def parse(self) -> Expr:
        e = self.expr()
        if self.i != len(self.t):
            raise Unstated(f"unread {' '.join(t.text for t in self.t[self.i :])}")
        return e

    def expr(self) -> Expr:
        if self.peek() == "if":
            self.take()
            cond = self.expr_or()
            self.take("then")
            then = self.expr()
            other = None
            if self.peek() == "else":
                self.take()
                other = self.expr()
            return Expr("if", cond, then, other)
        if self.peek() in ("required", "optional") and self.peek(1) == "choice":
            kind = self.take().text
            self.take()
            names = [self.take().text]
            while self.peek() == ",":
                self.take()
                names.append(self.take().text)
            return Expr("choice", kind, names)
        if self.peek() == "one-of":
            self.take()
            return Expr("one-of")
        return self.expr_or()

    def expr_or(self) -> Expr:
        e = self.expr_and()
        while self.peek() == "or":
            self.take()
            e = Expr("or", e, self.expr_and())
        return e

    def expr_and(self) -> Expr:
        e = self.compare()
        while self.peek() == "and":
            self.take()
            e = Expr("and", e, self.compare())
        return e

    def compare(self) -> Expr:
        left = self.postfix()
        if self.peek() in ("all", "any") and self.peek(1) in self.COMPARE:
            raise Unstated("all/any comparison")
        if self.peek() in self.COMPARE:
            op = self.take().text
            right = self.postfix()
            return Expr("cmp", op, left, right)
        return left

    def postfix(self) -> Expr:
        e = self.primary()
        while True:
            p = self.peek()
            if p == "exists":
                self.take()
                e = Expr("exists", e)
            elif p == "is" and self.peek(1) == "absent":
                self.take()
                self.take()
                e = Expr("absent", e)
            elif p in (
                "only",
                "count",
                "single",
                "multiple",
                "distinct",
                "sum",
                "flatten",
                "first",
                "last",
                "only-element",
                "to-string",
                "to-number",
                "to-int",
                "to-enum",
                "extract",
                "filter",
                "reduce",
                "sort",
                "max",
                "min",
                "then",
                "default",
                "contains",
                "disjoint",
            ):
                if p in ("then", "contains", "disjoint"):
                    return e
                raise Unstated(f"operator {p}")
            else:
                return e

    def primary(self) -> Expr:
        tok = self.t[self.i] if self.i < len(self.t) else None
        if tok is None:
            raise Unstated("end of expression")
        if tok.text == "(":
            self.take()
            e = self.expr()
            self.take(")")
            return e
        if tok.text == "-" and self.peek(1) and self.t[self.i + 1].kind == "num":
            self.take()
            n = self.take()
            return Expr("num", "-" + n.text)
        if tok.kind == "num":
            self.take()
            return Expr("num", tok.text)
        if tok.kind == "str":
            self.take()
            return Expr("str", str_text(tok))
        if tok.text in ("True", "False", "empty"):
            self.take()
            return Expr("lit", tok.text)
        if tok.kind == "id":
            self.take()
            if self.peek() == "(":
                raise Unstated(f"function call {tok.text}")
            path = [tok.text]
            while self.peek() == "->":
                self.take()
                nxt = self.take()
                if nxt.kind != "id":
                    raise Unstated("path")
                path.append(nxt.text)
            return Expr("path", path)
        raise Unstated(f"token {tok.text}")


@dataclass
class Model:
    decls: dict[str, TypeDecl]
    resolver: object = None

    def all_attrs(self, d: TypeDecl) -> dict[str, Attr]:
        """A type's attributes, its ancestors' first, with overrides applied."""
        chain = []
        cur = d
        while cur is not None:
            chain.append(cur)
            cur = self.decls.get(cur.extends) if cur.extends else None
        out: dict[str, Attr] = {}
        for c in reversed(chain):
            for a in c.attrs:
                out[a.name] = a
        return out

    def ancestors(self, d: TypeDecl) -> list[TypeDecl]:
        out = []
        cur = self.decls.get(d.extends) if d.extends else None
        while cur is not None:
            out.append(cur)
            cur = self.decls.get(cur.extends) if cur.extends else None
        return out


class Translator:
    """Turn one type's conditions into class expressions and rules."""

    def __init__(self, model: Model, d: TypeDecl, owner: TypeDecl | None = None):
        self.model = model
        self.d = d
        self.attrs = model.all_attrs(d)
        # one-of names the attributes of the type that states it, not a subtype's.
        self.own = model.all_attrs(owner or d)
        self.owner = owner or d

    def slot(self, e: Expr) -> Attr:
        if e.op != "path" or len(e.args[0]) != 1:
            raise Unstated("a path into another type")
        name = e.args[0][0]
        if name not in self.attrs:
            raise Unstated(f"{name} is not an attribute of {self.d.name}")
        return self.attrs[name]

    def enum_value(self, e: Expr, attr: Attr) -> str:
        if e.op == "path" and len(e.args[0]) == 1:
            # Rune lets a value of the attribute's own enumeration stand alone.
            enum = self.model.decls.get(attr.type)
            if enum is None or enum.kind != "enum":
                raise Unstated("not an enumerated value")
            for v in enum_values(self.model, enum):
                if v["name"] == e.args[0][0]:
                    return v["display"] or v["name"]
            raise Unstated("not an enumerated value")
        if e.op != "path" or len(e.args[0]) != 2:
            raise Unstated("not an enumerated value")
        enum_name, value = e.args[0]
        try:
            enum = self.model.decls.get(
                self.model.resolver.resolve(self.owner, enum_name)
            )
        except SystemExit:
            raise Unstated(f"{enum_name} is not an enumeration")
        if enum is None or enum.kind != "enum" or attr.type != enum_name:
            raise Unstated("the value is not of the attribute's enumeration")
        for v in enum_values(self.model, enum):
            if v["name"] == value:
                return v["display"] or v["name"]
        raise Unstated(f"{enum_name} has no value {value}")

    def atom(self, e: Expr) -> dict:
        """One slot condition, as a LinkML anonymous class expression."""
        if e.op == "exists":
            a = self.slot(e.args[0])
            return {"slot_conditions": {a.name: {"value_presence": "PRESENT"}}}
        if e.op == "absent":
            a = self.slot(e.args[0])
            return {"slot_conditions": {a.name: {"value_presence": "ABSENT"}}}
        if e.op == "cmp":
            op, left, right = e.args
            if left.op != "path":
                raise Unstated("comparison of a computed value")
            a = self.slot(left)
            if a.upper is None or a.upper > 1:
                raise Unstated("comparison of a list")
            rng = a.type
            if op == "=":
                if right.op == "path":
                    return {
                        "slot_conditions": {
                            a.name: {"equals_string": self.enum_value(right, a)}
                        }
                    }
                if right.op == "num" and rng in ("int", "number"):
                    n = right.args[0]
                    return {
                        "slot_conditions": {
                            a.name: {
                                "equals_number": int(n) if rng == "int" else float(n)
                            }
                        }
                    }
                if right.op == "str" and rng == "string":
                    return {
                        "slot_conditions": {a.name: {"equals_string": right.args[0]}}
                    }
                raise Unstated("equality with this kind of value")
            if (
                op in ("<", "<=", ">", ">=")
                and right.op == "num"
                and rng in ("int", "number")
            ):
                n = right.args[0]
                if rng == "int":
                    v = int(n)
                    if op == ">":
                        return {"slot_conditions": {a.name: {"minimum_value": v + 1}}}
                    if op == ">=":
                        return {"slot_conditions": {a.name: {"minimum_value": v}}}
                    if op == "<":
                        return {"slot_conditions": {a.name: {"maximum_value": v - 1}}}
                    return {"slot_conditions": {a.name: {"maximum_value": v}}}
                if op == ">=":
                    return {"slot_conditions": {a.name: {"minimum_value": num(n)}}}
                if op == "<=":
                    return {"slot_conditions": {a.name: {"maximum_value": num(n)}}}
                raise Unstated("a strict bound on a decimal")
            raise Unstated(f"comparison {op}")
        if e.op == "and":
            return merge_and(self.atom(e.args[0]), self.atom(e.args[1]))
        if e.op == "or":
            return {
                "any_of": flatten("any_of", self.atom(e.args[0]))
                + flatten("any_of", self.atom(e.args[1]))
            }
        raise Unstated(f"expression {e.op}")

    def translate(self, c: Condition) -> tuple[str, dict]:
        """Return ("class", expression) or ("rule", rule), or raise Unstated."""
        e = ExprParser(c.toks).parse()
        if e.op == "one-of":
            return "class", {"exactly_one_of": [present(n) for n in self.own]}
        if e.op == "choice":
            kind, names = e.args
            for n in names:
                if n not in self.attrs:
                    raise Unstated(f"{n} is not an attribute of {self.d.name}")
            branches = [present(n) for n in names]
            if kind == "optional":
                branches.append({"all_of": [absent(n) for n in names]})
            return "class", {"exactly_one_of": branches}
        if e.op == "if":
            cond, then, other = e.args
            rule = {"preconditions": self.atom(cond), "postconditions": self.atom(then)}
            if other is not None:
                rule["elseconditions"] = self.atom(other)
            return "rule", rule
        return "class", self.atom(e)


def num(text: str):
    f = float(text)
    return int(f) if f.is_integer() else f


def present(name: str) -> dict:
    return {"slot_conditions": {name: {"value_presence": "PRESENT"}}}


def absent(name: str) -> dict:
    return {"slot_conditions": {name: {"value_presence": "ABSENT"}}}


def flatten(key: str, expr: dict) -> list[dict]:
    return expr[key] if list(expr) == [key] else [expr]


def merge_and(a: dict, b: dict) -> dict:
    """Join two expressions that must both hold."""
    if set(a) == {"slot_conditions"} and set(b) == {"slot_conditions"}:
        merged = {k: dict(v) for k, v in a["slot_conditions"].items()}
        for k, v in b["slot_conditions"].items():
            if k in merged and set(merged[k]) & set(v):
                return {"all_of": flatten("all_of", a) + flatten("all_of", b)}
            merged.setdefault(k, {}).update(v)
        return {"slot_conditions": merged}
    return {"all_of": flatten("all_of", a) + flatten("all_of", b)}


# ---------------------------------------------------------------------------
# Writing the LinkML
# ---------------------------------------------------------------------------


def module_name(namespace: str) -> str:
    return namespace.replace(".", "_")


def enum_values(model: Model, d: TypeDecl) -> list[dict]:
    """An enumeration's values, its parents' first: LinkML has no enum inheritance."""
    out = []
    if d.extends and d.extends in model.decls:
        out.extend(enum_values(model, model.decls[d.extends]))
    out.extend(d.values)
    return out


def load_codelist(domain: str) -> dict | None:
    """The FpML code list for a domain, as LoadCodeListImpl finds it.

    LoadCodeListImpl takes the first file named <domain>-<major>-<minor>.json on the
    class path. FINOS's tree holds one file per domain the model names, which a test
    checks, so the choice never arises here.
    """
    files = sorted(CODELIST_DIR.glob(f"{domain}-*.json"))
    files = [
        f for f in files if re.fullmatch(re.escape(domain) + r"-\d+-\d+\.json", f.name)
    ]
    if not files:
        return None
    if len(files) > 1:
        raise SystemExit(
            f"more than one code list for {domain}: {[f.name for f in files]}"
        )
    return json.loads(files[0].read_text(encoding="utf-8"))


def slot_range(model: Model, typ: str) -> str:
    if typ in BASIC_TYPES:
        return BASIC_TYPES[typ]
    if typ not in model.decls:
        raise SystemExit(f"unknown type {typ}")
    return typ


def annotations_for(annots: Annots) -> dict:
    out = {}
    if annots.metadata:
        out["rosetta_metadata"] = " ".join(annots.metadata)
    refs = [r.text() for r in annots.doc_refs]
    if refs:
        out["doc_reference"] = " | ".join(refs)
    return out


def see_also_for(annots: Annots) -> list[str]:
    return [loc for r in annots.doc_refs if (loc := r.scheme_location())]


def attribute_def(model: Model, a: Attr) -> dict:
    out: dict = {}
    if a.doc:
        out["description"] = a.doc
    out["range"] = slot_range(model, a.type)
    if a.lower >= 1:
        out["required"] = True
    multi = a.upper is None or a.upper > 1
    if multi:
        out["multivalued"] = True
        if a.lower > 1:
            out["minimum_cardinality"] = a.lower
        if a.upper is not None:
            out["maximum_cardinality"] = a.upper
    if a.annots.deprecated:
        out["deprecated"] = "Marked [deprecated] in the CDM."
    see = see_also_for(a.annots)
    if see:
        out["see_also"] = see
    ann = annotations_for(a.annots)
    if ann:
        out["annotations"] = ann
    return out


@dataclass
class Report:
    stated: int = 0
    inherited: int = 0
    unstated: list[tuple[str, str, str]] = field(default_factory=list)


def class_def(model: Model, d: TypeDecl, report: Report) -> dict:
    out: dict = {}
    if d.extends:
        out["is_a"] = d.extends
    if d.doc:
        out["description"] = d.doc
    attrs = {}
    usage = {}
    parent_attrs = model.all_attrs(model.decls[d.extends]) if d.extends else {}
    shared = []
    for a in d.attrs:
        if a.override or a.name in parent_attrs:
            usage[a.name] = attribute_def(model, a)
        elif a.name in LOKF_KEYS:
            shared.append(a.name)
            usage[a.name] = attribute_def(model, a)
        else:
            attrs[a.name] = attribute_def(model, a)
    if shared:
        out["slots"] = shared
    if attrs:
        out["attributes"] = attrs
    if usage:
        out["slot_usage"] = usage
    class_exprs: list[dict] = []
    rules: list[dict] = []
    comments: list[str] = []
    # A Rosetta condition binds every subtype too, but a LinkML class expression or
    # rule does not pass down to a subclass in the generated JSON Schema, so each
    # ancestor's conditions are stated again here, read against this type.
    owners = list(reversed(model.ancestors(d))) + [d]
    for owner in owners:
        for c in owner.conditions:
            label = c.name or f"Unnamed condition ({c.source()})"
            inherited = owner is not d
            try:
                where, expr = Translator(model, d, owner).translate(c)
            except (Unstated, IndexError) as exc:
                if not inherited:
                    report.unstated.append((d.name, label, str(exc)))
                    comments.append(
                        f"Rosetta condition {label} is not stated in LinkML: {c.source()}"
                    )
                continue
            desc = f"{label}: {c.doc}" if c.doc else label
            if inherited:
                desc = f"From {owner.name}. {desc}"
                report.inherited += 1
            else:
                report.stated += 1
            if where == "class":
                class_exprs.append({"description": desc, **expr})
            else:
                rules.append({"description": desc, **expr})
    if class_exprs:
        out["all_of"] = class_exprs
    if rules:
        out["rules"] = rules
    if d.kind == "choice":
        out.setdefault("annotations", {})["rosetta_choice"] = "true"
    if d.annots.root_type:
        out.setdefault("annotations", {})["rosetta_root_type"] = "true"
    ann = annotations_for(d.annots)
    if ann:
        out.setdefault("annotations", {}).update(ann)
    see = see_also_for(d.annots)
    if see:
        out["see_also"] = see
    if d.annots.deprecated:
        out["deprecated"] = "Marked [deprecated] in the CDM."
    if comments:
        out["comments"] = comments
    return out


def enum_def(model: Model, d: TypeDecl) -> dict:
    out: dict = {}
    if d.doc:
        out["description"] = d.doc
    pvs = {}
    for v in enum_values(model, d):
        key = v["display"] or v["name"]
        if key in pvs:
            # Two Rosetta values with one display name serialise alike, so they are one
            # value in JSON; the LinkML value names both.
            pvs[key].setdefault("aliases", []).append(v["name"])
            pvs[key].setdefault("comments", []).append(
                f"The CDM gives {v['name']} the same display name as another value of this enumeration."
            )
            continue
        pv: dict = {}
        if v["doc"]:
            pv["description"] = v["doc"]
        if v["display"] and v["display"] != v["name"]:
            pv["aliases"] = [v["name"]]
        if v["annots"].deprecated:
            pv["deprecated"] = "Marked [deprecated] in the CDM."
        ann = annotations_for(v["annots"])
        if ann:
            pv["annotations"] = ann
        see = see_also_for(v["annots"])
        if see:
            pv["see_also"] = see
        pvs[key] = pv
    out["permissible_values"] = pvs
    ann = annotations_for(d.annots)
    if d.extends:
        ann["rosetta_extends"] = d.extends
    if ann:
        out["annotations"] = ann
    see = see_also_for(d.annots)
    if see:
        out["see_also"] = see
    if d.annots.deprecated:
        out["deprecated"] = "Marked [deprecated] in the CDM."
    return out


def alias_def(model: Model, d: TypeDecl, report: Report) -> tuple[str, dict]:
    """A type alias becomes a LinkML type, or an enum when it names an FpML code list."""
    base = d.alias_base
    if base == "FpMLCodingScheme" and "domain" in d.alias_args:
        domain = d.alias_args["domain"]
        cl = load_codelist(domain)
        if cl is None:
            raise SystemExit(f"{d.name}: no code list for {domain}")
        ident = cl["identification"]
        out: dict = {}
        if d.doc:
            out["description"] = d.doc
        out["enum_uri"] = ident["canonicalUri"]
        out["see_also"] = [ident["canonicalVersionUri"]]
        out["permissible_values"] = {
            c["value"]: {
                "meaning": f"{ident['canonicalVersionUri']}#{quote(c['value'], safe='')}"
            }
            for c in cl["codes"]
        }
        out["annotations"] = {
            "fpml_coding_scheme_domain": domain,
            "fpml_coding_scheme_version": ident["version"],
        }
        report.stated += 1
        return "enum", out
    out = {"typeof": slot_range(model, base) if base in BASIC_TYPES else base}
    if base in BASIC_TYPES:
        out["uri"] = f"{PREFIX}:{d.lname}"
    if d.doc:
        out["description"] = d.doc
    for k, v in d.alias_args.items():
        if k == "min":
            out["minimum_value"] = num(v)
        elif k == "max":
            out["maximum_value"] = num(v)
        elif k == "pattern":
            out["pattern"] = v
        else:
            out.setdefault("annotations", {})[f"rosetta_{k}"] = str(v)
    if d.alias_params:
        out.setdefault("annotations", {})["rosetta_parameters"] = ", ".join(
            d.alias_params
        )
    comments = []
    for c in d.conditions:
        comments.append(
            f"Rosetta condition {c.name or '(unnamed)'} is not stated in LinkML: {c.source()}"
        )
        report.unstated.append(
            (d.name, c.name or "(unnamed)", "a condition on a type alias")
        )
    if comments:
        out["comments"] = comments
    return "type", out


def renamed(d: TypeDecl, body: dict) -> dict:
    """Name the Rosetta type a qualified LinkML name stands for."""
    if d.lname != d.name:
        body["aliases"] = [d.name]
        body.setdefault("annotations", {})["rosetta_name"] = f"{d.namespace}.{d.name}"
    return body


def references(model: Model, d: TypeDecl) -> set[str]:
    refs = set()
    if d.extends:
        refs.add(d.extends)
    for a in d.attrs:
        if a.type in model.decls:
            refs.add(a.type)
    if d.kind == "alias" and d.alias_base in model.decls:
        refs.add(d.alias_base)
    return refs


def qualified_name(d: TypeDecl) -> str:
    """The LinkML name of a type whose Rosetta name another namespace also declares.

    LinkML merges a schema's imports into one namespace, so the name takes the last
    part of its Rosetta namespace as a prefix, as in CsaAdditionalTerminationEvent.
    """
    last = d.namespace.rsplit(".", 1)[-1]
    return last[:1].upper() + last[1:] + d.name


class Resolver:
    """Find the declaration a name means, as Rosetta's scoping does."""

    def __init__(self, decls: list[TypeDecl]):
        self.by_ns: dict[tuple[str, str], TypeDecl] = {}
        self.by_name: dict[str, list[TypeDecl]] = defaultdict(list)
        for d in decls:
            key = (d.namespace, d.name)
            if key in self.by_ns:
                raise SystemExit(f"{d.name} is declared twice in {d.namespace}")
            self.by_ns[key] = d
            self.by_name[d.name].append(d)
        for d in decls:
            d.lname = d.name if len(self.by_name[d.name]) == 1 else qualified_name(d)

    def resolve(self, scope: TypeDecl, name: str) -> str:
        """The LinkML name for `name` as written in `scope`'s file; a basic type stays as it is."""
        if (scope.namespace, name) in self.by_ns:
            return self.by_ns[(scope.namespace, name)].lname
        found = []
        for imp in scope.imports:
            if imp.endswith(".*"):
                d = self.by_ns.get((imp[:-2], name))
            else:
                ns, _, last = imp.rpartition(".")
                d = self.by_ns.get((ns, name)) if last == name else None
            if d is not None and d not in found:
                found.append(d)
        if len(found) == 1:
            return found[0].lname
        if not found and len(self.by_name.get(name, [])) == 1:
            return self.by_name[name][0].lname
        if not found and name in BASIC_TYPES:
            return name
        raise SystemExit(
            f"{scope.namespace}.{scope.name}: cannot resolve {name} ({len(found)} candidates)"
        )


def read_model() -> tuple[Model, dict[str, str]]:
    found: list[TypeDecl] = []
    namespace_docs: dict[str, str] = {}
    for path in sorted(ROSETTA_DIR.glob("*.rosetta")):
        p = Parser(path)
        found.extend(p.parse())
        ns_doc = re.search(
            r'^namespace\s+[\w.]+\s*:\s*<"((?:.|\n)*?)">',
            path.read_text(encoding="utf-8"),
            re.M,
        )
        if ns_doc and p.namespace:
            namespace_docs.setdefault(
                p.namespace, re.sub(r"\s+", " ", ns_doc.group(1)).strip()
            )
    resolver = Resolver(found)
    for d in found:
        if d.extends:
            d.extends = resolver.resolve(d, d.extends)
        for a in d.attrs:
            a.type = resolver.resolve(d, a.type)
        if d.kind == "alias" and d.alias_base not in BASIC_TYPES:
            d.alias_base = resolver.resolve(d, d.alias_base)
    model = Model({d.lname: d for d in found})
    model.resolver = resolver
    return model, namespace_docs


def pins() -> dict:
    return yaml.safe_load(PINS.read_text(encoding="utf-8"))


def dump(doc: dict) -> str:
    class Dumper(yaml.SafeDumper):
        def increase_indent(self, flow=False, indentless=False):
            return super().increase_indent(flow, False)

    return "---\n" + yaml.dump(
        doc, Dumper=Dumper, sort_keys=False, allow_unicode=True, width=100
    )


def header(name: str, title: str, description: str, pin: dict) -> dict:
    return {
        "id": f"{SCHEMA_ID}/{name}" if name != SCHEMA_NAME else SCHEMA_ID,
        "name": name,
        "title": title,
        "description": description,
        "version": pin["edition"],
        "source": f"https://github.com/finos/common-domain-model/tree/{pin['tag']}",
        "license": "Apache-2.0",
    }


PREFIXES = {
    PREFIX: f"{SCHEMA_ID}/",
    "linkml": "https://w3id.org/linkml/",
}


def build() -> tuple[dict[str, str], Report]:
    model, ns_docs = read_model()
    pin = pins()
    report = Report()
    by_module: dict[str, dict] = defaultdict(
        lambda: {"classes": {}, "enums": {}, "types": {}}
    )
    owner_module: dict[str, str] = {}
    for d in model.decls.values():
        owner_module[d.lname] = module_name(d.namespace)
    for d in sorted(model.decls.values(), key=lambda x: x.lname):
        mod = by_module[module_name(d.namespace)]
        if d.kind in ("type", "choice"):
            if d.kind == "choice":
                d.conditions.insert(
                    0,
                    Condition(
                        "OneOf",
                        "A choice type holds exactly one of its options.",
                        [Tok("id", "one-of", 0, 0, True)],
                    ),
                )
            mod["classes"][d.lname] = renamed(d, class_def(model, d, report))
        elif d.kind == "enum":
            mod["enums"][d.lname] = renamed(d, enum_def(model, d))
        else:
            kind, body = alias_def(model, d, report)
            mod["enums" if kind == "enum" else "types"][d.lname] = renamed(d, body)
    outputs: dict[str, str] = {}
    for mod_name in sorted(by_module):
        content = by_module[mod_name]
        imports = set()
        for kind in ("classes", "enums", "types"):
            for name in content[kind]:
                for ref in references(model, model.decls[name]):
                    if owner_module[ref] != mod_name:
                        imports.add(owner_module[ref])
        if any(body.get("slots") for body in content["classes"].values()):
            imports.add(KEYS_MODULE)
        namespace = mod_name.replace("_", ".")
        desc = ns_docs.get(namespace) or f"The CDM's {namespace} namespace."
        doc = header(mod_name, f"CDM {namespace}", desc, pin)
        doc["prefixes"] = dict(PREFIXES)
        doc["default_prefix"] = PREFIX
        doc["default_range"] = "string"
        doc["imports"] = ["linkml:types"] + [f"./{m}" for m in sorted(imports)]
        for kind in ("types", "enums", "classes"):
            if content[kind]:
                doc[kind] = content[kind]
        outputs[f"{mod_name}.yaml"] = dump(doc)
    keys = header(
        KEYS_MODULE,
        "CDM keys shared with LOKF",
        "The attribute names the CDM shares with LOKF's schema, as slots, so that the "
        "schema's lokf adapt copy can rename them. Each class that uses one gives its "
        "description and range in slot_usage.",
        pin,
    )
    keys["prefixes"] = dict(PREFIXES)
    keys["default_prefix"] = PREFIX
    keys["default_range"] = "string"
    keys["imports"] = ["linkml:types"]
    keys["slots"] = {
        name: {
            "description": f"The CDM's {name} attribute; each class's slot_usage gives its meaning."
        }
        for name in LOKF_KEYS
    }
    outputs[f"{KEYS_MODULE}.yaml"] = dump(keys)
    umbrella = header(
        SCHEMA_NAME,
        "FINOS Common Domain Model",
        "A LinkML rendering of the FINOS Common Domain Model (CDM): every type, choice, "
        "enumeration and type alias its Rosetta source declares, one module per Rosetta "
        "namespace, with the conditions LinkML can state.",
        pin,
    )
    umbrella["keywords"] = [
        "CDM",
        "Common Domain Model",
        "derivatives",
        "FINOS",
        "financial products",
        "trade lifecycle",
        "Rosetta",
    ]
    umbrella["see_also"] = [
        "https://lmodel.github.io/common-domain-model",
        "https://cdm.finos.org/",
        "https://github.com/finos/common-domain-model",
    ]
    umbrella["annotations"] = {
        "upstream_tag": pin["tag"],
        "upstream_commit": pin["commit"],
        "upstream_license": "Community-Spec-1.0",
    }
    umbrella["comments"] = [
        "Written by scripts/rosetta_to_linkml.py from FINOS's Rosetta files at the tag in "
        "source; edit the script, never the modules. The descriptions are the CDM's own, "
        "carried under the Community Specification License 1.0 with the attribution NOTICE gives."
    ]
    umbrella["prefixes"] = dict(PREFIXES)
    umbrella["default_prefix"] = PREFIX
    umbrella["default_range"] = "string"
    umbrella["imports"] = ["linkml:types"] + [
        f"./{m}" for m in sorted(set(by_module) | {KEYS_MODULE})
    ]
    outputs[f"{SCHEMA_NAME}.yaml"] = dump(umbrella)
    undescribed = sorted(
        name
        for content in by_module.values()
        for kind in ("classes", "enums", "types")
        for name, body in content[kind].items()
        if not body.get("description")
    )
    return outputs, lint_config(undescribed), report


def lint_config(undescribed: list[str]) -> str:
    """The lint configuration, which names the elements the CDM leaves undescribed."""
    lines = [
        "# Written by scripts/rosetta_to_linkml.py; edit the script, not this file.",
        "# linkml-lint reads it from the directory `just lint` runs in.",
        "# The recommended rules apply, fitted to the CDM's own names and words, so",
        "# that the schema keeps the keys CDM documents carry:",
        "# - Attributes keep the CDM's camelCase names (tradeDate, payerReceiver), and",
        "#   enumeration values its spelling (MODFOLLOWING, ACT/360), so the naming",
        "#   rule leaves slots and permissible values out. Three enumerations keep the",
        "#   names the CDM gives them after regulations.",
        "# - A description is the CDM's own words. The CDM describes most attributes",
        "#   but not all, so the recommended rule leaves slots out, and it names the",
        "#   classes, enumerations and types the CDM leaves undescribed below.",
        "extends: recommended",
        "rules:",
        "  standard_naming:",
        "    level: error",
        "    exclude_type:",
        "      - slot_definition",
        "      - permissible_value",
        "    exclude:",
        "      - EU_EMIR_EligibleCollateralEnum",
        "      - UK_EMIR_EligibleCollateralEnum",
        "      - US_CFTC_PR_EligibleCollateralEnum",
        "  recommended:",
        "    level: error",
        "    exclude_type:",
        "      - slot_definition",
        "    exclude:",
    ]
    lines += [f"      - {name}" for name in undescribed]
    return "\n".join(lines) + "\n"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument(
        "--check",
        action="store_true",
        help="exit 1 when a module differs from what Rosetta gives",
    )
    ap.add_argument(
        "--report",
        action="store_true",
        help="print the conditions that were and were not stated",
    )
    args = ap.parse_args()
    modules, lint, report = build()
    outputs = {
        f"src/common_domain_model/schema/{name}": text for name, text in modules.items()
    }
    outputs[".linkmllint.yaml"] = lint
    if args.report:
        print(
            f"conditions stated: {report.stated}, restated on subtypes: {report.inherited}, "
            f"not stated: {len(report.unstated)}"
        )
        reasons = defaultdict(int)
        for _, _, why in report.unstated:
            reasons[re.sub(r"\b[A-Z]\w+|\b\w+ is not an attribute.*", "X", why)] += 1
        for why, n in sorted(reasons.items(), key=lambda x: -x[1]):
            print(f"  {n:4} {why}")
        return 0
    stale = []
    existing = {str(p.relative_to(ROOT)) for p in SCHEMA_DIR.glob("*.yaml")}
    for name, text in outputs.items():
        path = ROOT / name
        if args.check:
            if not path.exists() or path.read_text(encoding="utf-8") != text:
                stale.append(name)
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
    extra = sorted(existing - set(outputs))
    if args.check:
        stale += extra
        if stale:
            print("differs from Rosetta: " + ", ".join(stale), file=sys.stderr)
            return 1
        return 0
    for name in extra:
        (ROOT / name).unlink()
    print(
        f"wrote {len(modules)} modules to {SCHEMA_DIR.relative_to(ROOT)} and .linkmllint.yaml"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
