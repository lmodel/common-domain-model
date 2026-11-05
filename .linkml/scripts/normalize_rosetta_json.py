#!/usr/bin/env python3
"""Normalize Rosetta-serialized JSON into LinkML-compatible JSON.

Rosetta's Java code-generator serialises CDM objects with three conventions
that differ from LinkML's expected JSON format:

1. **Enum values** are UPPER_SNAKE_CASE (e.g. ``CREDIT_SUPPORT_AGREEMENT``),
   whereas the LinkML schema preserves the Rosetta DSL's PascalCase names
   (``CreditSupportAgreement``).

2. **FieldWithMeta wrappers** serialise scalars as ``{"value": X}`` objects
   instead of bare values.

3. **Choice / oneOf discriminators** add an extra PascalCase key that wraps
   the actual properties (e.g. ``{"CreditSupportAgreementLegacyElections": {…}}``
   instead of inlining properties directly).

This module builds a lookup table from the LinkML schema and rewrites a
Rosetta JSON tree in-place to LinkML form.

Usage as CLI::

    uv run python scripts/normalize_rosetta_json.py \\
        --schema src/common_domain_model/schema/common_domain_model.yaml \\
        input.json > normalized.json

Usage as library::

    from normalize_rosetta_json import RosettaNormalizer
    norm = RosettaNormalizer("src/common_domain_model/schema/common_domain_model.yaml")
    data = norm.normalize(data)
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

import yaml


class RosettaNormalizer:
    """Rewrites Rosetta-serialised JSON to match LinkML expectations."""

    def __init__(self, schema_path: str | Path) -> None:
        schema_path = Path(schema_path)
        schema_dir = schema_path.parent
        self._classes: dict[str, dict] = {}
        self._enum_values: set[str] = set()  # all PascalCase PV names
        self._upper_to_pv: dict[str, str] = {}  # UPPER_SNAKE -> PascalCase

        # Load root + all imported modules
        with open(schema_path) as f:
            root = yaml.safe_load(f)
        self._load_module(root)
        for imp in root.get("imports", []):
            if imp.startswith("linkml:"):
                continue
            mod_path = schema_dir / f"{imp}.yaml"
            if mod_path.exists():
                with open(mod_path) as f:
                    self._load_module(yaml.safe_load(f))

        # Build UPPER_SNAKE -> PascalCase reverse map
        for pv in self._enum_values:
            upper = self._to_upper_snake(pv)
            if upper != pv:
                self._upper_to_pv[upper] = pv

    def _load_module(self, schema: dict) -> None:
        """Extract classes and enum values from a single schema module."""
        self._classes.update(schema.get("classes") or {})
        for _ename, edef in (schema.get("enums") or {}).items():
            for pv in (edef.get("permissible_values") or {}):
                self._enum_values.add(pv)

    @staticmethod
    def _to_upper_snake(name: str) -> str:
        """Convert PascalCase/camelCase to UPPER_SNAKE_CASE.

        Mirrors Rosetta's Java codegen convention: inserts underscores before
        uppercase letters *and* before digits that follow letters.
        """
        s = re.sub(r"(?<=[a-z0-9])(?=[A-Z])", "_", name)
        s = re.sub(r"(?<=[A-Z])(?=[A-Z][a-z])", "_", s)
        s = re.sub(r"(?<=[a-zA-Z])(?=[0-9])", "_", s)
        return s.upper()

    def _is_class_name(self, key: str) -> bool:
        """Check if a key is a known CDM class name (PascalCase)."""
        return key in self._classes

    def _resolve_slots(self, cls_name: str) -> set[str]:
        """Collect all slot names for a class including inherited."""
        slots: set[str] = set()
        visited: set[str] = set()
        cur: str | None = cls_name
        while cur and cur not in visited:
            visited.add(cur)
            cls_def = self._classes.get(cur)
            if not cls_def:
                break
            slots.update(cls_def.get("slots") or [])
            slots.update((cls_def.get("slot_usage") or {}).keys())
            cur = cls_def.get("is_a")
        return slots

    def normalize(self, data: object) -> object:
        """Recursively normalize a parsed JSON value."""
        if isinstance(data, dict):
            return self._normalize_dict(data)
        if isinstance(data, list):
            return [self.normalize(item) for item in data]
        if isinstance(data, str):
            return self._normalize_enum(data)
        return data

    def _normalize_dict(self, obj: dict) -> object:
        """Normalize a JSON object, handling wrappers and discriminators."""
        # 1. Unwrap single-key discriminator pattern:
        #    {"ClassName": {child_props}} -> {child_props}
        #    Only when the single key is a known class name.
        if len(obj) == 1:
            key = next(iter(obj))
            val = obj[key]
            if self._is_class_name(key) and isinstance(val, dict):
                return self.normalize(val)

        # 2. Unwrap FieldWithMeta {"value": X} or {"value": X, "meta": {...}}
        #    But not if "value" is a genuine CDM slot alongside other CDM slots
        if "value" in obj:
            other_keys = {k for k in obj if k != "value" and k != "meta"}
            if not other_keys:
                # Pure wrapper — unwrap
                return self.normalize(obj["value"])

        # 3. Recursively normalize all values, and inline discriminator children
        result: dict = {}
        for k, v in obj.items():
            normalized_v = self.normalize(v)
            # If the key is a class name discriminator within a dict with siblings,
            # inline its children
            if self._is_class_name(k) and isinstance(normalized_v, dict):
                for ck, cv in normalized_v.items():
                    result[ck] = cv
            else:
                result[k] = normalized_v

        return result

    def _normalize_enum(self, value: str) -> str:
        """Convert UPPER_SNAKE_CASE enum values back to PascalCase."""
        if value in self._upper_to_pv:
            return self._upper_to_pv[value]
        # Already a valid PV or not an enum — return as-is
        return value


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--schema",
        default="src/common_domain_model/schema/common_domain_model.yaml",
        help="Path to root LinkML schema",
    )
    parser.add_argument("input", help="Rosetta-serialised JSON file")
    parser.add_argument(
        "-o", "--output",
        help="Output file (default: stdout)",
    )
    args = parser.parse_args()

    normalizer = RosettaNormalizer(args.schema)

    with open(args.input) as f:
        data = json.load(f)

    normalized = normalizer.normalize(data)

    out = open(args.output, "w") if args.output else sys.stdout
    json.dump(normalized, out, indent=2)
    out.write("\n")
    if args.output:
        out.close()


if __name__ == "__main__":
    main()
