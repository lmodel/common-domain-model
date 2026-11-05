#!/usr/bin/env python3
"""Overlay ecosystem SSSOM mappings onto already-generated LinkML schema YAMLs.

This is the "overlay-only" path: it does NOT re-parse Rosetta DSL. Use it when
a ``cdm-<ecosystem>.sssom.tsv`` has been edited and the new mappings need to
be pushed into the schema YAMLs without regenerating them from scratch.

For each YAML in ``--schema-dir`` the script:

1. Loads classes and enums.
2. For every class/enum name that appears as a subject in the SSSOM TSVs,
   merges the predicate-mapped CURIEs into the corresponding mapping slot
   (``close_mappings``, ``exact_mappings``, ``broad_mappings``,
   ``narrow_mappings``, ``related_mappings``). Existing entries are
   preserved; duplicates are dropped.
3. Adds any referenced ecosystem prefixes to the ``prefixes`` block.
4. Writes the YAML back using the same formatter as ``rosetta_to_linkml.py``.

Usage:
    python scripts/apply_sssom_overlay.py \
        --schema-dir src/common_domain_model/schema \
        --mappings-dir src/common_domain_model/mappings
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

import yaml

# Reuse loader and writer from the main generator.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from rosetta_to_linkml import (  # noqa: E402
    ECOSYSTEM_PREFIX_URIS,
    EcosystemMappings,
    load_ecosystem_mappings,
    write_yaml,
)


# Class definitions: mappings appear *before* these keys in the canonical
# layout produced by rosetta_to_linkml.py. ``annotations`` is deliberately
# excluded — when set from metadata_key it appears BEFORE mappings; when set
# only by function-annotation enrichment it appears AFTER mappings, so it is
# never a reliable anchor.
_CLASS_POST_MAPPING_KEYS = (
    "rules",
    "comments",
    "slots",
    "slot_usage",
    "in_subset",
)

# Enum definitions: mappings appear *after* permissible_values in the
# canonical layout, so an enum has no anchor and new slots are appended.
_ENUM_POST_MAPPING_KEYS: tuple[str, ...] = ()


def _insert_mapping_slot(
    defn: dict, slot: str, curies: list[str], post_keys: tuple[str, ...]
) -> None:
    """Insert ``defn[slot] = curies`` keeping mapping slots in canonical position.

    The slot is inserted just before the first member of ``post_keys`` that
    appears in ``defn``. If none is present, the slot is appended.
    """
    anchor = next((k for k in defn if k in post_keys), None)
    if anchor is None:
        defn[slot] = curies
        return
    rebuilt: dict = {}
    for k, v in defn.items():
        if k == anchor:
            rebuilt[slot] = curies
        rebuilt[k] = v
    defn.clear()
    defn.update(rebuilt)


def overlay_file(schema_path: Path, mappings: EcosystemMappings) -> tuple[int, int]:
    """Overlay ecosystem mappings onto one schema YAML in place.

    Returns ``(elements_updated, links_added)``. A file is rewritten only
    when at least one element was updated.
    """
    with open(schema_path, "r", encoding="utf-8") as fh:
        data = yaml.safe_load(fh)
    if not isinstance(data, dict):
        return 0, 0

    classes = data.get("classes") or {}
    enums = data.get("enums") or {}
    prefixes = data.get("prefixes") or {}

    used_prefixes: set[str] = set()
    elements_updated = 0
    links_added = 0

    # Merge into both classes and enums. Each collection has its own
    # canonical anchor list because the generator places mappings in
    # different positions for classes vs enums.
    for collection, post_keys in (
        (classes, _CLASS_POST_MAPPING_KEYS),
        (enums, _ENUM_POST_MAPPING_KEYS),
    ):
        for name, defn in collection.items():
            if not isinstance(defn, dict):
                continue
            slot_map = mappings.by_name.get(name)
            if not slot_map:
                continue
            touched = False
            # Iterate slots in TSV-row order (preserved by EcosystemMappings).
            # rosetta_to_linkml.py inserts slots in the same order, so a
            # brand-new element ends up with mapping slots in the same
            # sequence as a full regeneration would produce.
            for slot, curies in slot_map.items():
                existing = defn.get(slot)
                if existing is None:
                    _insert_mapping_slot(defn, slot, list(curies), post_keys)
                    touched = True
                    links_added += len(curies)
                else:
                    for c in curies:
                        if c not in existing:
                            existing.append(c)
                            touched = True
                            links_added += 1
                for c in curies:
                    if ":" in c:
                        used_prefixes.add(c.split(":", 1)[0])
            if touched:
                elements_updated += 1

    # Ensure referenced ecosystem prefixes are declared.
    prefixes_changed = False
    for px in sorted(used_prefixes):
        if px not in prefixes and px in ECOSYSTEM_PREFIX_URIS:
            prefixes[px] = ECOSYSTEM_PREFIX_URIS[px]
            prefixes_changed = True
    if prefixes_changed:
        data["prefixes"] = prefixes

    if elements_updated:
        write_yaml(data, schema_path)
    return elements_updated, links_added


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Overlay ecosystem SSSOM mappings onto LinkML schema YAMLs."
    )
    parser.add_argument(
        "--schema-dir",
        type=Path,
        required=True,
        help="Directory containing LinkML schema YAML files",
    )
    parser.add_argument(
        "--mappings-dir",
        type=Path,
        required=True,
        help=(
            "Directory containing cdm-<ecosystem>.sssom.tsv files (one per "
            "ecosystem prefix declared in ECOSYSTEM_PREFIX_URIS)"
        ),
    )
    args = parser.parse_args()

    if not args.schema_dir.is_dir():
        print(f"Error: schema-dir {args.schema_dir} is not a directory", file=sys.stderr)
        sys.exit(1)
    if not args.mappings_dir.is_dir():
        print(f"Error: mappings-dir {args.mappings_dir} is not a directory", file=sys.stderr)
        sys.exit(1)

    mappings = load_ecosystem_mappings(args.mappings_dir)
    if not mappings.by_name:
        print(
            f"No ecosystem mappings loaded from {args.mappings_dir} "
            "(expected one or more cdm-<ecosystem>.sssom.tsv files)",
            file=sys.stderr,
        )
        sys.exit(1)
    n_subjects = len(mappings.by_name)
    n_links = sum(len(c) for sm in mappings.by_name.values() for c in sm.values())
    print(
        f"Loaded {n_links} mappings across {n_subjects} CDM subjects "
        f"(prefixes: {', '.join(sorted(mappings.used_prefixes))})"
    )

    schemas = sorted(args.schema_dir.glob("*.yaml"))
    if not schemas:
        print(f"No YAML schemas in {args.schema_dir}", file=sys.stderr)
        sys.exit(1)

    files_changed = 0
    total_elements = 0
    total_links = 0
    for path in schemas:
        elements, links = overlay_file(path, mappings)
        if elements:
            files_changed += 1
            total_elements += elements
            total_links += links
            print(f"  {path.name}: +{links} links across {elements} elements")

    if total_links:
        print(
            f"\nOverlay complete: {total_links} new mappings applied to "
            f"{total_elements} elements across {files_changed} files"
        )
    else:
        print("\nOverlay complete: schemas already in sync with SSSOM files — no changes needed")


if __name__ == "__main__":
    main()
