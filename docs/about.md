# About common-domain-model

Finos Common Domain Model (CDM) LinkML Schema

> **Generated:** 2026-05-14 | **Script:** `scripts/rosetta_to_linkml.py` (3 637 lines)
> **Replay:** `just gen-from-rosetta`

---

## 1. Schema Summary

| Artifact | Path | Count |
|----------|------|-------|
| Module schemas | `src/common_domain_model/schema/cdm_*.yaml` | 36 |
| Root schema | `src/common_domain_model/schema/common_domain_model.yaml` | 1 |
| Construct SSSOM | `src/common_domain_model/schema/mappings/rosetta_to_linkml.sssom.tsv` | 3 831 rows |
| External SSSOM | `src/common_domain_model/schema/mappings/common-domain-model-mappings.sssom.tsv` | 2 310 rows |

| Element | Count |
|---------|-------|
| Classes (from `type` + `choice`) | 779 |
| Enums | 272 |
| Slots (unique, globally deduplicated) | 1 775 |
| Slot usage overrides (per-class) | 720 |
| Custom Types (from `typeAlias`) | 16 (2 renamed) |

---

## 2. Enrichment

| # | Rosetta Source | LinkML Field | On Element | Count |
|---|----------------|-------------|------------|-------|
| 1 | `[deprecated]` on types/enums | `deprecated` | class / enum | 5 |
| 2 | `[deprecated]` on attributes | `deprecated` | slot / slot_usage | 3 |
| 3 | `[rootType]` | `tree_root: true` | class | 13 |
| 4 | `[docRef … schemeLocation]` URI | `exact_mappings` | enum | 16 |
| 5 | Codelist `canonicalUri` (heuristic) | `exact_mappings` | enum | 25 |
| 6 | Codelist per-code URI (explicit) | `meaning` | permissible_value | ~390 |
| 7 | Codelist per-code URI (heuristic) | `meaning` | permissible_value | ~230 |
| 8 | ICMA `namingConvention` | `related_mappings` | slot | 9 |
| 9 | ISDA/ICMA corpus refs | `see_also` | class | 64 |
| 10 | ISDA paragraph/clause refs | `notes` | class / slot | 208 |
| 11 | `[metadata key]` | `annotations: {metadata_key}` | class | 78 |
| 12 | `[metadata scheme]` | `annotations: {metadata_scheme}` | slot | 79 |
| 13 | `[metadata reference]` | `annotations: {metadata_reference}` | slot | 44 |
| 14 | FpML 5.10 synonym (type) | `close_mappings` | class | 144 |
| 15 | FpML 5.10 synonym (attr) | `close_mappings` | slot | 387 |
| 16 | `condition` names + bodies | `comments` + `rules:` | class | 572 conditions, 319 mapped to rules |
| 17 | Body/corpus/segment decls | `comments` | module | 1 |
| 18 | `func` definitions | `comments` (signatures) + `annotations: {rosetta_functions}` + `functions.yaml` sidecar | module / class / sidecar | 23 modules, 87 classes, 1 304 functions |
| 19 | Module filename | `subsets` / `in_subset` | module / class | 36 modules, 779 classes |
| 20 | `synonym source` declarations | `prefixes` | module | conditional per module |

### Heuristic Codelist Matching

Enums without an explicit `[docReference … schemeLocation]` are matched to FpML codelist JSON files by name: strip `Enum` suffix, camelCase, match against codelist `shortName` (with `Scheme` suffix stripped). Adds 25 enum-level `exact_mappings` and ~230 per-value `meaning` URIs.

---

## 3. SSSOM Mappings

Two [SSSOM TSV](https://mapping-commons.github.io/sssom/) files:

1. **Construct-level** (`rosetta_to_linkml.sssom.tsv`) — 3 831 rows mapping every Rosetta construct to its LinkML counterpart (`skos:exactMatch`).

2. **External** (`common-domain-model-mappings.sssom.tsv`) — 2 310 rows mapping CDM to FpML, ISDA, ICMA, ORE, CreateiQ, and FIS identifiers.

| Predicate | Count | Source |
|-----------|-------|--------|
| `skos:exactMatch` | 737 | 16 explicit + 25 heuristic scheme + 696 per-value codelist |
| `skos:closeMatch` | 1 376 | 144 FpML 5.10 type + 600 FpML 5.10 slot synonyms + 255 ORE XSD + 377 CreateiQ JSON |
| `skos:relatedMatch` | 197 | ISDA corpus refs + ICMA naming conventions |

Of the 737 exactMatch rows, **331 are heuristic** (`semapv:LexicalMatching`).

**Schema mining** (`--schema-dir`): ORE XSD elements and CreateiQ JSON Schema fields are extracted and case-insensitively matched against CDM class/slot names (excluding generic names like "type", "id", "name").

**FpML 5.10 synonyms** (`mapping-fpml-synonym.rosetta`): 144 CDM types with 600 attribute-level synonym entries, producing `close_mappings` on classes and slots. The `fpml_5_10` CURIE prefix (`https://www.fpml.org/spec/fpml-5-10#`) is declared in each module schema that uses it.

---

## 4. Implementation

### 4.1 Parser (`RosettaParser`)

Parses 132 Rosetta DSL files into `RosettaModule` objects. Key data classes:
`RosettaType`, `RosettaEnum`, `RosettaChoice`, `RosettaTypeAlias`,
`RosettaAttribute`, `DocReference`, `RosettaCondition`, `RosettaFunction`.

Additional parsers: `parse_desc_files()` (body/corpus/segment declarations), `parse_synonym_types()` / `parse_synonym_slots()` (external system mappings), `load_codelists()` (228 codelist JSONs).

### 4.2 Condition Classification

572 conditions classified into 7 kinds:

| Kind | Count | Example |
|------|-------|---------|
| `required_choice` | 54 | `required choice a, b, c` |
| `optional_choice` | 27 | `optional choice a, b` |
| `one_of` | 2 | `one-of` |
| `if_then` | 393 | `if slot exists then slot exists` |
| `exists` | 41 | `slot exists` |
| `comparison` | 41 | `startDate <= endDate` |
| `other` | 15 | Complex/unparseable |

319 mapped to LinkML `rules:` (208 classes with rules, using `postconditions` with `exactly_one_of`, `any_of`, `slot_conditions`, `minimum_value`/`maximum_value`,`none_of`). 253 remain as comments only (237 require path traversal, 15 use `count`/`all`/`to-enum`/comments-only constructs, 1 function call).

All rules include `preconditions: {}` for gen-doc compatibility.

### 4.3 Slot Deduplication

Each slot defined once globally in its owning module (first alphabetically).
Ptests/test_linkml_schema.py:522: AssertionError
=============================================== short test summary info ================================================
FAILED tests/test_linkml_schema.py::TestSSSOM::test_sssom_file_exists - AssertionError: SSSOM file not found: /home/noel/git/hub/noelmcloughlin/common-domain-model-ld/src/common_domain_mo...
FAILED tests/test_linkml_schema.py::TestSSSOM::test_sssom_has_header - FileNotFoundError: [Errno 2] No such file or directory: '/home/noel/git/hub/noelmcloughlin/common-domain-model-ld/s...
FAILED tests/test_linkml_schema.py::TestSSSOM::test_sssom_has_rows - FileNotFoundError: [Errno 2] No such file or directory: '/home/noel/git/hub/noelmcloughlin/common-domain-model-ld/s...
FAILED tests/test_linkml_schema.py::TestSSSOM::test_sssom_row_count_matches_schema_elements - FileNotFoundError: [Errno 2] No such file or directory: '/home/noel/git/hub/noelmcloughlin/common-domain-model-ld/s...
FAILED tests/test_linkml_schema.py::TestEnrichment::test_close_mappings_from_synonyms - AssertionError: Expected >=10 classes with close_mappings, got 0
FAILED tests/test_linkml_schema.py::TestEnrichment::test_slot_close_mappings_from_synonyms - AssertionError: Expected >=10 slots with close_mappings, got 0
FAILED tests/test_linkml_schema.py::TestExternalSSSOM::test_ext_sssom_predicate_types - AssertionError: assert 'skos:closeMatch' in '#curie_map:\n#  common_domain_model: https://w3id.org/finos/cdm/\n#  f...
FAILED tests/test_linkml_schema.py::TestExternalSSSOM::test_ext_sssom_has_enough_rows - AssertionError: Expected >=1600 external SSSOM rows, got 934
FAILED tests/test_linkml_schema.py::TestExternalSSSOM::test_ext_sssom_slot_level_synonym_rows - AssertionError: Expected >=500 slot-level synonym SSSOM rows, got 0
FAILED tests/test_linkml_schema.py::TestExternalSSSOM::test_ext_sssom_ore_xsd_mining - AssertionError: Expected >=30 ORE XSD element SSSOM rows, got 0
FAILED tests/test_linkml_schema.py::TestExternalSSSOM::test_ext_sssom_createiq_json_mining - AssertionError: Expected >=30 CreateiQ JSON field SSSOM rows, got 0
FAILED tests/test_linkml_schema.py::TestLinkMLIntegration::test_schema_passes_lint - AssertionError: linkml-lint failed:
====================================== 12 failed, 60 passed in 239.75s (0:03:59) er-class deviations use `slot_usage` (716 entries: 354 range, 653 description,
337 cardinality overrides). Cross-module `imports` added automatically.

### 4.4 Name Collision Handling

**TypeAlias collisions** — two Rosetta `typeAlias` names collide with classes:
`FloatingRateIndex` → `FloatingRateIndexType`, `SettlementRateOption` → `SettlementRateOptionType`.

**Reserved names** — `safe_slot_name()` appends `_` to Python keywords and
`index` (mkdocs conflict). SSSOM records all renames.

### 4.5 YAML Formatting

`write_yaml()` applies `_insert_blank_lines()` post-processing for readability (blank lines between sections, literal block style for multi-line strings).

---

## 5. Build & Test

```bash
just gen-from-rosetta       # regenerate schema from Rosetta DSL
just test-linkml            # 48 pytest tests (structure, SSSOM, enrichment, lint)
just test_cdm_examples_samples  # validate 20 ISDA CSA sample JSON files
```

### Test Suite (48 tests, 6 classes)

| Class | Tests | Covers |
|-------|-------|--------|
| `TestSchemaStructure` | 11 | YAML validity, naming, PascalCase, tree_root, permissible_values, no duplicate slots |
| `TestSSSOM` | 4 | File exists, header, columns, row count |
| `TestReproducibility` | 2 | Script exists, idempotent regeneration |
| `TestEnrichment` | 19 | All enrichment rows above (deprecated, mappings, annotations, rules, functions, etc.) |
| `TestExternalSSSOM` | 9 | File, curie_map, columns, predicates, row count, FpML, synonyms, ORE XSD, CreateiQ JSON |
| `TestLinkMLIntegration` | 1 | `linkml-lint` (0 errors; ~1 544 camelCase warnings ignored) |
| `TestLinkMLIntegration` | 2 | Structured `rosetta_functions` annotations on modules and classes |
| `TestLinkMLIntegration` | 2 | `functions.yaml` sidecar registry (exists, structure) |

### Sample Data Validation

`validate_samples.py` normalizes Rosetta JSON (enum casing, FieldWithMeta
unwrapping, choice discriminator flattening), auto-detects the target class
via F1-score matching, and validates with `linkml-validate`.

**Result:** 1/39 pass, 38 xfail (nested choice discriminators, missing required
properties, strict `additionalProperties` on `anyOf` branches). The single
passing file is the Euroclear Security Agreement; the rest cover ISDA
Legacy-CSA, IM-CSA, IM-CSD, IM-CTA, VM-CSA, and Eligible Collateral Schedule
samples. xfail groups are declared via `--xfail-glob` in
`project.justfile` (`test_cdm_examples_samples`).

---

## 6. Known Upstream Issues

| # | Component | Bug | Fix |
|---|-----------|-----|-----|
| 1 | `linkml-runtime` `yamlutils.py` | `SafeDumper` lacks `JsonObj` representer; `gen-yaml` raises `RepresenterError` on boolean annotations | `scripts/gen_yaml_patched.py` registers the missing representer before invoking the generator; `justfile` `_gen-yaml` recipe calls this wrapper instead of `gen-yaml` directly. Remove once `linkml-runtime > 1.11.0` is on PyPI. |
| 2 | `linkml` `excelgen.py` | `workbook.save()` in nested loop → O(n²) disk writes (~15 K for CDM) | Patch: `scripts/excelgen-perf-fix.patch` |
| 3 | `linkml` `docgen` Jinja2 | `class.md.jinja2` iterates `rule.preconditions` without None guard | Generator emits `preconditions: {}` on every rule |
| 4 | `linkml` `gen-json-schema` | `union_of` on abstract classes → empty `{}` with `additionalProperties: false` | Generator adds `any_of` with range alternatives |
| 5 | `linkml-runtime` `yamlutils.py` | `_normalize_inlined_as_dict` calls `Annotation(**dict_value)` when annotation value is a mapping — only scalar values are safe | `rosetta_functions` annotation values serialised as compact JSON strings (`json.dumps`) |
| 6 | `linkml` `jsonldgen.py` | `uri_for()` raises `ValueError: Unknown CURIE prefix` for any CURIE in `close_mappings` whose prefix is not declared in `prefixes:` | Generator now declares `fpml_5_10` prefix in every module schema that contains FpML 5.10 synonym mappings |
| 7 | `tests/test_linkml_schema.py` | `test_regeneration_is_idempotent` ran the generator with `--output-dir SCHEMA_DIR`, overwriting committed schema and SSSOM files in place. On failure the working tree was left dirty with regenerated content, masking the real diff and causing subsequent CI runs to produce inconsistent comparisons (e.g. a `comment` slot added to `AvailableInventoryRecord` in a transient Rosetta source state appeared as a committed change). | Generator is now run into a `tempfile.TemporaryDirectory()`; `--sssom-out` and `--ext-sssom-out` also point into the temp dir. Committed files are compared against the temp output after generation — schema and mapping files are never touched by the test. A `difflib.unified_diff` is included in the assertion message on mismatch; the message instructs the developer to run `just gen-from-rosetta` to update committed schemas. |

---

## 7. Future Work

| # | Item | Status | Details |
|---|------|--------|---------|
| 1 | Promote remaining Rosetta conditions to native `rules:` | 319/572 mapped (56%); 253 remain as `comments` only | 237 require path traversal (`->`), 15 use `count`/`all`/`to-enum`/commented-out constructs, 1 function call. Requires expression evaluator or upstream LinkML support for path-based constraints |
| | |
| 2 | Rosetta procedural functions in LinkML | Signatures emitted as structured `annotations: {rosetta_functions}` (machine-readable) + `comments` (human-readable). Metamodel extension `rosetta_metamodel.yaml` formalises the annotation shape. Custom gen-doc Jinja2 templates render them as collapsible function-signature cards. Function bodies remain not expressible | Functions like `CheckAgencyRating` use collection filtering, path traversal, set containment — outside LinkML's scope. Metamodel defines `RosettaFunctionAnnotation` / `RosettaFuncParamAnnotation` classes; schemas may declare `instantiates: rosetta_metamodel:FunctionBearing` (declarative, not yet enforced by validator). gen-doc (mkdocs) templates in `docs/templates-linkml/` override `common_metadata.md.jinja2` and `schema.md.jinja2` |
| | |
| 3 | `gen-json-schema` `union_of` expansion | Blocked upstream — slot-level `any_of` workaround in place; `$defs`-level `additionalProperties: false` still strict | 62 choice classes, 108 slots with `any_of` workaround; see `ISSUE.md` (Bug #4) |
| | |
| 4 | Sample data validation pass rate | 1/39 passing | 38 xfail due to nested choice discriminators + `additionalProperties: false`; depends on item 3 |

See [`ISSUE.md`](../ISSUE.md) for detailed analysis and proposed fixes of bugs #4 and #5.

---

## 8. File Manifest

| File | Purpose |
|------|---------|
| `scripts/rosetta_to_linkml.py` | Parser + generator + SSSOM (3 502 lines) |
| `src/common_domain_model/schema/common_domain_model.yaml` | Root schema — imports all 37 modules |
| `src/common_domain_model/schema/rosetta_metamodel.yaml` | Metamodel extension — formalises `rosetta_functions` annotation shape (3 classes: `FunctionBearing`, `RosettaFunctionAnnotation`, `RosettaFuncParamAnnotation`) |
| `src/common_domain_model/schema/functions.yaml` | Sidecar function registry — all 1 281 Rosetta functions with signatures, namespaces, and class associations |
| `src/common_domain_model/schema/cdm_*.yaml` | 37 module schemas |
| `src/common_domain_model/mappings/rosetta_to_linkml.sssom.tsv` | Construct-level SSSOM (3 823 rows) |
| `src/common_domain_model/mappings/common-domain-model-mappings.sssom.tsv` | External SSSOM (1 826 rows) |
| `tests/test_linkml_schema.py` | 48 tests (structure, SSSOM, enrichment, lint) |
| `scripts/normalize_rosetta_json.py` | Rosetta JSON → LinkML JSON normalizer |
| `scripts/detect_linkml_class.py` | Auto-detect target class from JSON keys |
| `scripts/validate_samples.py` | Sample data validation harness |
| `docs/templates-linkml/` | Custom gen-doc Jinja2 templates — renders `rosetta_functions` annotations as collapsible function-signature cards |
| `project.justfile` | `gen-from-rosetta`, `test-linkml`, `test_cdm_examples_samples` recipes |
