#!/usr/bin/env python3
"""Validate CDM sample JSON files against the generated LinkML schema.

For each file, normalizes Rosetta-serialised JSON (enum casing, value
wrappers, choice discriminators) into LinkML-compatible form, detects the
target class, then runs ``linkml-validate``.

Usage:
    uv run python scripts/validate_samples.py [--schema SCHEMA] PATH ...

Each ``PATH`` may be a JSON file or a directory; directories are searched
recursively for ``*.json`` (excluding ``*.schema.json``). Failures expected
upstream can be marked with ``--xfail FILE`` or ``--xfail-glob PATTERN``.

Exit code 0 if all files pass or xfail; 1 if any unexpected failures occur.
"""

import argparse
import glob
import json
import subprocess
import sys
import tempfile
from pathlib import Path

GREEN = "\033[32m"
YELLOW = "\033[33m"
RED = "\033[31m"
RESET = "\033[0m"

from detect_linkml_class import detect_class
from normalize_rosetta_json import RosettaNormalizer


def _expand_paths(paths: list[str]) -> list[Path]:
    """Expand a mixed list of files and directories into a sorted file list.

    Directories are recursively searched for ``*.json`` (excluding files
    whose name ends with ``.schema.json``). Duplicate paths are collapsed.
    """
    out: dict[str, Path] = {}
    for raw in paths:
        p = Path(raw)
        if p.is_dir():
            for match in p.rglob("*.json"):
                if match.name.endswith(".schema.json"):
                    continue
                key = str(match.resolve())
                if key not in out:
                    out[key] = match
        elif p.is_file():
            key = str(p.resolve())
            if key not in out:
                out[key] = p
        else:
            # Missing path — keep it so the caller sees the failure rather
            # than silently dropping it.
            out[str(p)] = p
    return sorted(out.values(), key=lambda x: str(x))


def _expand_xfail_globs(patterns: list[str]) -> set[str]:
    """Resolve each shell glob into an absolute-path xfail set."""
    out: set[str] = set()
    for pat in patterns:
        for match in glob.glob(pat, recursive=True):
            out.add(str(Path(match).resolve()))
    return out


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--schema",
        default="src/common_domain_model/schema/common_domain_model.yaml",
        help="Path to root LinkML schema (default: %(default)s)",
    )
    parser.add_argument(
        "--xfail",
        action="append",
        default=[],
        help="Files expected to fail (reported but don't affect exit code)",
    )
    parser.add_argument(
        "--xfail-glob",
        action="append",
        default=[],
        metavar="PATTERN",
        help=(
            "Shell glob (supports recursive ** with --xfail-glob) whose matches "
            "are marked xfail. May be repeated."
        ),
    )
    parser.add_argument(
        "paths",
        nargs="+",
        help="JSON data files or directories to validate (dirs are searched recursively for *.json)",
    )
    args = parser.parse_args()

    schema = Path(args.schema)
    if not schema.exists():
        print(f"Schema not found: {schema}", file=sys.stderr)
        sys.exit(2)

    files = _expand_paths(args.paths)
    if not files:
        print("No JSON files found in the given paths", file=sys.stderr)
        sys.exit(2)

    xfail_set = {str(Path(x).resolve()) for x in args.xfail}
    xfail_set |= _expand_xfail_globs(args.xfail_glob)

    normalizer = RosettaNormalizer(schema)

    passed = 0
    failed = 0
    xfailed = 0
    errors: list[str] = []

    print(f"\n\n{GREEN}=== Validating {len(files)} sample files against LinkML schema ==={RESET}")
    print(f"{YELLOW}--- Note: xfails are awaiting upstream enhancements/bugfixes ---{RESET}\n")
    for data_path in files:
        filepath = str(data_path)
        if not data_path.exists():
            print(f"  {filepath}  [MISSING] ... SKIP")
            errors.append(f"{filepath}: file not found")
            failed += 1
            continue

        # Normalize Rosetta JSON -> LinkML JSON
        with open(data_path) as f:
            raw_data = json.load(f)
        normalized = normalizer.normalize(raw_data)

        # Detect class from normalized data
        cls = detect_class(schema, data_path)
        if not cls:
            print(f"  {filepath}  [?] ... FAIL (no matching class)")
            errors.append(f"{filepath}: no matching class detected")
            failed += 1
            continue

        # Write normalized JSON to temp file for validation
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False
        ) as tmp:
            json.dump(normalized, tmp, indent=2)
            tmp_path = tmp.name

        print(f"  {filepath}  [{cls}] ... ", end="", flush=True)
        is_xfail = str(data_path.resolve()) in xfail_set
        result = subprocess.run(
            [
                "linkml-validate",
                "-s",
                str(schema),
                "-C",
                cls,
                tmp_path,
            ],
            capture_output=True,
            text=True,
        )
        Path(tmp_path).unlink(missing_ok=True)
        if result.returncode == 0:
            if is_xfail:
                print(f"{GREEN}OK{RESET} (unexpected pass — remove from --xfail?)")
            else:
                print(f"{GREEN}OK{RESET}")
            passed += 1
        else:
            detail = (result.stderr or result.stdout).strip()
            if is_xfail:
                print(f"{YELLOW}XFAIL{RESET} (known failure)")
                xfailed += 1
            else:
                print(f"{RED}FAIL{RESET}")
                if detail:
                    for line in detail.splitlines()[:5]:
                        print(f"    {line}")
                errors.append(f"{filepath} [{cls}]: {detail[:200]}")
                failed += 1

    print(f"\n=== Results: {GREEN}{passed} passed{RESET}, {YELLOW}{xfailed} xfail{RESET}, {RED}{failed} failed{RESET} out of {len(files)} files ===")
    if errors:
        print("\nUnexpected failures:")
        for e in errors:
            print(f"  - {e}")
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
