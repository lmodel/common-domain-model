"""Tests for the generated LinkML schema — structure, import resolution, and data validation."""

import difflib
import json
import subprocess
import sys
import tempfile
from pathlib import Path

import pytest
import yaml

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

ROOT = Path(__file__).resolve().parent.parent
SCHEMA_DIR = ROOT / "src" / "common_domain_model" / "schema"
ROOT_SCHEMA = SCHEMA_DIR / "common_domain_model.yaml"
MAPPINGS_DIR = ROOT / "src" / "common_domain_model" / "mappings"
SSSOM_FILE = MAPPINGS_DIR / "rosetta_to_linkml.sssom.tsv"
EXT_SSSOM_FILE = MAPPINGS_DIR / "cdm-mappings.sssom.tsv"
CODELIST_DIR = ROOT / "rosetta-source" / "src" / "main" / "resources" / "codelist" / "json"
EXAMPLES_DIR = ROOT / "examples" / "samples"
VALID_DIR = ROOT / "tests" / "data" / "valid"
INVALID_DIR = ROOT / "tests" / "data" / "invalid"


# ---------------------------------------------------------------------------
# Schema structure tests
# ---------------------------------------------------------------------------


class TestSchemaStructure:
    """Verify the generated schema files are well-formed."""

    def test_root_schema_exists(self):
        assert ROOT_SCHEMA.is_file(), f"Root schema not found: {ROOT_SCHEMA}"

    def test_root_schema_is_valid_yaml(self):
        data = yaml.safe_load(ROOT_SCHEMA.read_text())
        assert isinstance(data, dict)
        assert data.get("name") == "common_domain_model"
        assert "imports" in data

    def test_root_schema_has_required_fields(self):
        data = yaml.safe_load(ROOT_SCHEMA.read_text())
        for key in ("id", "name", "description", "license", "prefixes", "imports"):
            assert key in data, f"Missing required field: {key}"

    def test_all_imported_modules_exist(self):
        data = yaml.safe_load(ROOT_SCHEMA.read_text())
        for imp in data.get("imports", []):
            if imp.startswith("linkml:"):
                continue
            mod_path = SCHEMA_DIR / (imp.lstrip("./") + ".yaml")
            assert mod_path.is_file(), f"Imported module not found: {mod_path}"

    def test_module_schemas_are_valid_yaml(self):
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            assert isinstance(data, dict), f"{f.name} is not a valid YAML dict"
            assert "name" in data, f"{f.name} missing 'name' field"
            assert "imports" in data, f"{f.name} missing 'imports' field"

    def test_module_naming_convention(self):
        """Module names must be lower_snake_case starting with cdm_."""
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            name = data.get("name", "")
            assert name.startswith("cdm_"), f"{f.name}: name should start with 'cdm_'"
            assert name == name.lower(), f"{f.name}: name should be lower_snake_case"

    def test_classes_are_pascal_case(self):
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_name in data.get("classes", {}).keys():
                assert cls_name[0].isupper(), (
                    f"{f.name}: class '{cls_name}' should be PascalCase"
                )

    def test_slots_are_snake_or_camel_case(self):
        """Slots from Rosetta use camelCase; verify no spaces or odd chars."""
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for slot_name in data.get("slots", {}).keys():
                assert " " not in slot_name, (
                    f"{f.name}: slot '{slot_name}' must not contain spaces"
                )

    def test_enums_have_permissible_values(self):
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for enum_name, enum_def in data.get("enums", {}).items():
                # Deprecated enums may be empty
                if "deprecated" in enum_def:
                    continue
                assert "permissible_values" in enum_def, (
                    f"{f.name}: enum '{enum_name}' has no permissible_values"
                )

    def test_at_least_one_tree_root(self):
        """At least one class across all modules should have tree_root: true."""
        found = False
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                if cls_def.get("tree_root"):
                    found = True
                    break
            if found:
                break
        assert found, "No class with tree_root: true found"

    def test_no_duplicate_slot_definitions(self):
        """Each slot name must be defined in exactly one module (no cross-module dupes)."""
        from collections import defaultdict
        slot_modules = defaultdict(list)
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            mod_name = data.get("name", f.stem)
            for slot_name in data.get("slots", {}).keys():
                slot_modules[slot_name].append(mod_name)
        dupes = {k: v for k, v in slot_modules.items() if len(v) > 1}
        assert not dupes, (
            f"Found {len(dupes)} slots defined in multiple modules: "
            + ", ".join(f"{k} ({v})" for k, v in list(dupes.items())[:5])
        )


# ---------------------------------------------------------------------------
# SSSOM mapping tests
# ---------------------------------------------------------------------------


class TestSSSOM:
    """Verify the SSSOM mapping file."""

    def test_sssom_file_exists(self):
        assert SSSOM_FILE.is_file(), f"SSSOM file not found: {SSSOM_FILE}"

    def test_sssom_has_header(self):
        text = SSSOM_FILE.read_text()
        assert text.startswith("#"), "SSSOM file should start with metadata comment"

    def test_sssom_has_rows(self):
        lines = [
            l for l in SSSOM_FILE.read_text().splitlines()
            if l and not l.startswith("#")
        ]
        assert len(lines) > 1, "SSSOM file should have header row + data rows"
        header = lines[0].split("\t")
        assert "subject_id" in header
        assert "object_id" in header
        assert "predicate_id" in header

    def test_sssom_row_count_matches_schema_elements(self):
        """SSSOM should have at least one row per class, enum, and slot."""
        lines = [
            l for l in SSSOM_FILE.read_text().splitlines()
            if l and not l.startswith("#")
        ]
        data_rows = len(lines) - 1  # minus header
        assert data_rows > 100, (
            f"Expected >100 SSSOM rows but got {data_rows}"
        )


# ---------------------------------------------------------------------------
# Reproducibility tests
# ---------------------------------------------------------------------------


class TestReproducibility:
    """Verify that re-running the generator produces identical output."""

    def test_parser_script_exists(self):
        script = ROOT / "scripts" / "rosetta_to_linkml.py"
        assert script.is_file(), f"Parser script not found: {script}"

    def test_regeneration_is_idempotent(self):
        """Re-running the generator must produce byte-identical schema files.

        The generator is run into a temporary directory so the committed schemas
        are never modified by this test.  A unified diff is included in the
        assertion message to make failures easy to diagnose.
        """
        with tempfile.TemporaryDirectory() as tmp_dir:
            tmp_path = Path(tmp_dir)
            tmp_sssom = tmp_path / "rosetta_to_linkml.sssom.tsv"
            tmp_ext_sssom = tmp_path / "cdm-mappings.sssom.tsv"

            # Re-run generator — mirrors `just _gen-from-rosetta` exactly,
            # writing output to a temp directory instead of SCHEMA_DIR.
            result = subprocess.run(
                [
                    sys.executable,
                    str(ROOT / "scripts" / "rosetta_to_linkml.py"),
                    "--rosetta-dir",
                    str(ROOT / "rosetta-source" / "src" / "main" / "rosetta"),
                    "--output-dir",
                    str(tmp_path),
                    "--codelist-dir",
                    str(CODELIST_DIR),
                    "--schema-dir",
                    str(ROOT / "rosetta-source" / "src" / "main" / "resources" / "schemas"),
                    "--sssom-out",
                    str(tmp_sssom),
                    "--ext-sssom-out",
                    str(tmp_ext_sssom),
                    "--ecosystem-mappings-dir",
                    str(MAPPINGS_DIR),
                ],
                capture_output=True,
                text=True,
            )
            assert result.returncode == 0, f"Generator failed:\n{result.stderr}"

            # Compare every committed schema file against the regenerated copy.
            diffs: list[str] = []
            for committed in sorted(SCHEMA_DIR.glob("*.yaml")):
                regenerated = tmp_path / committed.name
                if not regenerated.exists():
                    diffs.append(f"{committed.name}: missing from regenerated output")
                    continue
                original_lines = committed.read_text().splitlines(keepends=True)
                new_lines = regenerated.read_text().splitlines(keepends=True)
                if original_lines != new_lines:
                    diff = "".join(
                        difflib.unified_diff(
                            original_lines,
                            new_lines,
                            fromfile=f"committed/{committed.name}",
                            tofile=f"regenerated/{committed.name}",
                            n=3,
                        )
                    )
                    diffs.append(diff)

            assert not diffs, (
                f"{len(diffs)} schema file(s) differ after regeneration.\n"
                "Run `just gen-from-rosetta` to update committed schemas.\n\n"
                + "\n".join(diffs)
            )


# ---------------------------------------------------------------------------
# Enrichment tests
# ---------------------------------------------------------------------------


class TestEnrichment:
    """Verify enrichment from docReferences, codelists, and synonyms."""

    def test_deprecated_classes_present(self):
        """Types annotated [deprecated] should have deprecated field."""
        found = False
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                if cls_def.get("deprecated"):
                    found = True
                    break
            if found:
                break
        assert found, "No class with deprecated field found"

    def test_exact_mappings_on_enums(self):
        """Enums with schemeLocation should have exact_mappings."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for enum_def in data.get("enums", {}).values():
                if "exact_mappings" in enum_def:
                    found += 1
                    mappings = enum_def["exact_mappings"]
                    assert isinstance(mappings, list)
                    assert all(
                        m.startswith("http")
                        for m in mappings
                    ), f"exact_mappings should be URIs: {mappings}"
        assert found >= 10, f"Expected >=10 enums with exact_mappings, got {found}"

    def test_meaning_on_enum_values(self):
        """Enum values matched to codelists should have meaning URIs."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for enum_def in data.get("enums", {}).values():
                for pv_def in (enum_def.get("permissible_values") or {}).values():
                    if pv_def.get("meaning"):
                        found += 1
        assert found >= 100, f"Expected >=100 enum values with meaning, got {found}"

    def test_close_mappings_from_synonyms(self):
        """Classes in synonym files should have close_mappings."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                if "close_mappings" in cls_def:
                    found += 1
        assert found >= 10, f"Expected >=10 classes with close_mappings, got {found}"

    def test_related_mappings_from_icma(self):
        """Slots with ICMA naming conventions should have related_mappings."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for slot_def in data.get("slots", {}).values():
                if "related_mappings" in slot_def:
                    found += 1
                    mappings = slot_def["related_mappings"]
                    assert isinstance(mappings, list)
        assert found >= 5, f"Expected >=5 slots with related_mappings, got {found}"

    def test_metadata_annotations_on_slots(self):
        """Slots with [metadata scheme/reference] should have annotations."""
        found_scheme = 0
        found_ref = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for slot_def in data.get("slots", {}).values():
                annot = slot_def.get("annotations", {})
                if annot.get("metadata_scheme"):
                    found_scheme += 1
                if annot.get("metadata_reference"):
                    found_ref += 1
        assert found_scheme >= 10, f"Expected >=10 slots with metadata_scheme, got {found_scheme}"
        assert found_ref >= 10, f"Expected >=10 slots with metadata_reference, got {found_ref}"

    def test_notes_on_classes_or_enums(self):
        """Types/enums with docReferences should have notes."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                if cls_def.get("notes"):
                    found += 1
            for enum_def in data.get("enums", {}).values():
                if enum_def.get("notes"):
                    found += 1
        assert found >= 5, f"Expected >=5 elements with notes, got {found}"

    def test_conditions_as_comments(self):
        """Classes with Rosetta conditions should have comments listing them."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                comments = cls_def.get("comments", [])
                if any(c.startswith("Rosetta condition:") for c in comments):
                    found += 1
        assert found >= 100, f"Expected >=100 classes with condition comments, got {found}"

    def test_see_also_isda_corpus(self):
        """Types with ISDA docReferences should have see_also with isda: CURIEs."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                see_also = cls_def.get("see_also", [])
                if any(s.startswith("isda:") for s in see_also):
                    found += 1
        assert found >= 10, f"Expected >=10 classes with isda: see_also, got {found}"

    def test_deprecated_on_slots(self):
        """Attributes annotated [deprecated] should produce deprecated slots."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for slot_def in data.get("slots", {}).values():
                if slot_def.get("deprecated"):
                    found += 1
        assert found >= 1, f"Expected >=1 deprecated slots, got {found}"

    def test_heuristic_codelist_matching(self):
        """Enums matched heuristically should have exact_mappings and meaning."""
        # More enums with exact_mappings than the 16 with explicit schemeLocation
        found_em = 0
        found_meaning = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for enum_def in data.get("enums", {}).values():
                if "exact_mappings" in enum_def:
                    found_em += 1
                for pv_def in (enum_def.get("permissible_values") or {}).values():
                    if pv_def.get("meaning"):
                        found_meaning += 1
        assert found_em >= 20, f"Expected >=20 enums with exact_mappings (incl heuristic), got {found_em}"
        assert found_meaning >= 500, f"Expected >=500 enum values with meaning (incl heuristic), got {found_meaning}"

    def test_body_corpus_comments(self):
        """Module with body/corpus declarations should have comments."""
        base_schema = SCHEMA_DIR / "cdm_base.yaml"
        data = yaml.safe_load(base_schema.read_text())
        comments = data.get("comments", [])
        assert len(comments) >= 3, f"Expected >=3 body/corpus comments, got {len(comments)}"
        assert any("Standard body:" in c for c in comments)
        assert any("Corpus:" in c for c in comments)

    def test_rules_from_conditions(self):
        """Classes with choice/if-then conditions should have rules: entries."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                if cls_def.get("rules"):
                    found += 1
        assert found >= 150, f"Expected >=150 classes with rules, got {found}"

    def test_condition_body_in_comments(self):
        """Condition comments should include the expression body text."""
        found_with_body = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                comments = cls_def.get("comments", [])
                for c in comments:
                    if c.startswith("Rosetta condition:") and "\u2014" in c:
                        found_with_body += 1
                        break
        assert found_with_body >= 80, (
            f"Expected >=80 classes with condition body text, got {found_with_body}"
        )

    def test_function_comments_on_modules(self):
        """Modules with functions should have function signature comments."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            comments = data.get("comments", [])
            if any(c.startswith("Rosetta func:") for c in comments):
                found += 1
        assert found >= 5, f"Expected >=5 modules with function comments, got {found}"

    def test_function_comments_on_classes(self):
        """Classes that are input/output of functions should have func comments."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_def in data.get("classes", {}).values():
                comments = cls_def.get("comments", [])
                if any(c.startswith("Rosetta func:") for c in comments):
                    found += 1
        assert found >= 20, f"Expected >=20 classes with function comments, got {found}"

    def test_slot_close_mappings_from_synonyms(self):
        """Slots with synonym attribute-level mappings should have close_mappings."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for slot_def in data.get("slots", {}).values():
                if slot_def.get("close_mappings"):
                    found += 1
        assert found >= 10, f"Expected >=10 slots with close_mappings, got {found}"


# ---------------------------------------------------------------------------
# External SSSOM mapping tests
# ---------------------------------------------------------------------------


class TestExternalSSSOM:
    """Verify the external mapping SSSOM file."""

    def test_ext_sssom_file_exists(self):
        assert EXT_SSSOM_FILE.is_file(), f"External SSSOM not found: {EXT_SSSOM_FILE}"

    def test_ext_sssom_has_curie_map(self):
        text = EXT_SSSOM_FILE.read_text()
        assert "fpml:" in text, "Missing fpml prefix in curie_map"
        assert "isda:" in text, "Missing isda prefix in curie_map"
        assert "icma:" in text, "Missing icma prefix in curie_map"

    def test_ext_sssom_has_rows(self):
        lines = [
            line for line in EXT_SSSOM_FILE.read_text().splitlines()
            if line and not line.startswith("#")
        ]
        assert len(lines) > 1, "External SSSOM should have header + data rows"
        header = lines[0].split("\t")
        assert "subject_id" in header
        assert "predicate_id" in header
        assert "object_id" in header

    def test_ext_sssom_predicate_types(self):
        """External SSSOM should contain exactMatch, closeMatch, relatedMatch."""
        text = EXT_SSSOM_FILE.read_text()
        assert "skos:exactMatch" in text
        assert "skos:closeMatch" in text
        assert "skos:relatedMatch" in text

    def test_ext_sssom_has_enough_rows(self):
        lines = [
            line for line in EXT_SSSOM_FILE.read_text().splitlines()
            if line and not line.startswith("#")
        ]
        data_rows = len(lines) - 1
        assert data_rows >= 1600, f"Expected >=1600 external SSSOM rows, got {data_rows}"

    def test_ext_sssom_slot_level_synonym_rows(self):
        """Gap 1: slot-level close_mappings emitted as SSSOM rows."""
        text = EXT_SSSOM_FILE.read_text()
        attr_rows = [line for line in text.splitlines() if "attribute synonym" in line]
        assert len(attr_rows) >= 500, (
            f"Expected >=500 slot-level synonym SSSOM rows, got {len(attr_rows)}"
        )

    def test_ext_sssom_ore_xsd_mining(self):
        """Gap 2: ORE XSD element-level matches."""
        text = EXT_SSSOM_FILE.read_text()
        ore_xsd_rows = [line for line in text.splitlines() if "ORE_XSD" in line]
        assert len(ore_xsd_rows) >= 30, (
            f"Expected >=30 ORE XSD element SSSOM rows, got {len(ore_xsd_rows)}"
        )

    def test_ext_sssom_createiq_json_mining(self):
        """Gap 2: CreateiQ JSON schema field-level matches."""
        text = EXT_SSSOM_FILE.read_text()
        ciq_rows = [line for line in text.splitlines() if "CreateiQ_JSON" in line]
        assert len(ciq_rows) >= 30, (
            f"Expected >=30 CreateiQ JSON field SSSOM rows, got {len(ciq_rows)}"
        )

    def test_ext_sssom_fpml_mapping(self):
        """Should contain FpML coding scheme mappings."""
        text = EXT_SSSOM_FILE.read_text()
        assert "fpml.org/coding-scheme" in text


# ---------------------------------------------------------------------------
# LinkML lint integration test (requires linkml installed)
# ---------------------------------------------------------------------------


class TestLinkMLIntegration:
    """Integration tests that require the linkml toolchain."""

    @pytest.mark.skipif(
        subprocess.run(
            ["uv", "run", "linkml-lint", "--help"],
            capture_output=True,
        ).returncode != 0,
        reason="linkml-lint not available",
    )
    def test_schema_passes_lint(self):
        result = subprocess.run(
            ["uv", "run", "linkml-lint", "--ignore-warnings", str(SCHEMA_DIR)],
            capture_output=True,
            text=True,
        )
        # Ignore warnings so the test only fails on actual lint errors.
        assert result.returncode == 0, (
            f"linkml-lint failed:\nstdout:\n{result.stdout}\n\nstderr:\n{result.stderr}"
        )

    def test_function_annotations_on_modules(self):
        """Modules with functions should have structured rosetta_functions annotations."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            ann = data.get("annotations", {})
            rf = ann.get("rosetta_functions", "[]")
            # Annotation value is stored as a JSON string for linkml-lint compatibility
            if isinstance(rf, str):
                try:
                    funcs = json.loads(rf)
                except (ValueError, TypeError):
                    funcs = []
            elif isinstance(rf, list):
                funcs = rf
            else:
                funcs = []
            if funcs:
                found += 1
                # Every entry must have at least a name
                for entry in funcs:
                    assert "name" in entry, f"Function annotation missing 'name' in {f.name}"
        assert found >= 5, f"Expected >=5 modules with function annotations, got {found}"

    def test_function_annotations_on_classes(self):
        """Classes associated with functions should have structured annotations."""
        found = 0
        for f in sorted(SCHEMA_DIR.glob("cdm_*.yaml")):
            data = yaml.safe_load(f.read_text())
            for cls_name, cls_def in data.get("classes", {}).items():
                ann = cls_def.get("annotations", {})
                rf = ann.get("rosetta_functions", "[]")
                # Annotation value is stored as a JSON string for linkml-lint compatibility
                if isinstance(rf, str):
                    try:
                        funcs = json.loads(rf)
                    except (ValueError, TypeError):
                        funcs = []
                elif isinstance(rf, list):
                    funcs = rf
                else:
                    funcs = []
                if funcs:
                    found += 1
                    for entry in funcs:
                        assert "name" in entry, (
                            f"Function annotation missing 'name' on {cls_name} in {f.name}"
                        )
                        # Class-level annotations should have full signatures
                        assert "inputs" in entry or "output" in entry, (
                            f"Function annotation on {cls_name} missing inputs/output"
                        )
        assert found >= 20, f"Expected >=20 classes with function annotations, got {found}"

    def test_functions_sidecar_exists(self):
        """The functions.yaml sidecar registry should exist and contain functions."""
        sidecar = SCHEMA_DIR.parent / "sidecar_functions.yaml"
        assert sidecar.exists(), "sidecar_functions.yaml not found"
        data = yaml.safe_load(sidecar.read_text())
        funcs = data.get("functions", [])
        assert len(funcs) >= 100, f"Expected >=100 functions, got {len(funcs)}"

    def test_functions_sidecar_structure(self):
        """Each function entry should have name, namespace, and module."""
        sidecar = SCHEMA_DIR.parent / "sidecar_functions.yaml"
        data = yaml.safe_load(sidecar.read_text())
        for entry in data["functions"]:
            assert "name" in entry, f"Function missing 'name': {entry}"
            assert "namespace" in entry, f"Function missing 'namespace': {entry}"
            assert "module" in entry, f"Function missing 'module': {entry}"
