#!/usr/bin/env python3
"""Detect the LinkML target class for a CDM JSON data file.

Loads the root schema, builds a lookup of class -> set-of-own-slots
(including inherited), then picks the class whose slot set best matches
the top-level keys present in the JSON file.

Usage:
    python scripts/detect_linkml_class.py <schema.yaml> <datafile.json>

Prints the detected class name to stdout (exit 1 if none found).
"""

import json
import sys
from pathlib import Path

import yaml


def _load_all_classes(schema_dir: Path, root_file: Path) -> dict[str, dict]:
    """Return merged {class_name: class_def} from root + all imported modules."""
    classes: dict[str, dict] = {}
    with open(root_file) as f:
        root = yaml.safe_load(f)
    classes.update(root.get("classes") or {})
    for imp in root.get("imports", []):
        if imp.startswith("linkml:"):
            continue
        mod_path = schema_dir / f"{imp}.yaml"
        if mod_path.exists():
            with open(mod_path) as f:
                mod = yaml.safe_load(f)
            classes.update(mod.get("classes") or {})
    return classes


def _resolve_slots(cls_name: str, all_classes: dict[str, dict]) -> set[str]:
    """Collect all slots for a class including those inherited via is_a."""
    slots: set[str] = set()
    visited: set[str] = set()
    cur = cls_name
    while cur and cur not in visited:
        visited.add(cur)
        cls_def = all_classes.get(cur)
        if not cls_def:
            break
        slots.update(cls_def.get("slots") or [])
        slots.update((cls_def.get("slot_usage") or {}).keys())
        cur = cls_def.get("is_a")
    return slots


def detect_class(schema_path: Path, data_path: Path) -> str | None:
    """Return the best-matching class name for the JSON data file."""
    schema_dir = schema_path.parent
    all_classes = _load_all_classes(schema_dir, schema_path)

    with open(data_path) as f:
        data = json.load(f)
    if not isinstance(data, dict):
        return None
    data_keys = set(data.keys())

    best_name: str | None = None
    best_score = 0
    for cls_name, cls_def in all_classes.items():
        cls_slots = _resolve_slots(cls_name, all_classes)
        if not cls_slots:
            continue
        overlap = len(data_keys & cls_slots)
        if overlap == 0:
            continue
        # Prefer classes where all data keys are valid slots (precision)
        # and that cover the most data keys (recall).
        precision = overlap / len(data_keys)
        recall = overlap / len(cls_slots)
        score = 2 * precision * recall / (precision + recall)  # F1
        if score > best_score:
            best_score = score
            best_name = cls_name
    return best_name


def main() -> None:
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <schema.yaml> <datafile.json>", file=sys.stderr)
        sys.exit(2)
    schema_path = Path(sys.argv[1])
    data_path = Path(sys.argv[2])
    cls = detect_class(schema_path, data_path)
    if cls:
        print(cls)
    else:
        print(f"No matching class found for {data_path}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
