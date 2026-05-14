## Add your own just recipes here. This is imported by the main justfile.

# Overriding recipes from the root justfile by adding a recipe with the same
# name in this file is not possible until a known issue in just is fixed,
# https://github.com/casey/just/issues/2540

[group('model development')]
quick_test: test_cdm_examples_samples
  uv run python -m pytest

# Add the merged model to docs/schema.
# Workaround: linkml-runtime 1.11.0 omits SafeDumper.add_multi_representer(JsonObj, …)
# causing RepresenterError; scripts/gen_yaml_patched.py backports the missing line.
# Remove once linkml-runtime > 1.11.0 is available on PyPI.  See ISSUE.md §Issue-1.
_gen-yaml:
  -mkdir -p {{distrib_schema_path}}
  uv run python scripts/gen_yaml_patched.py {{source_schema_path}} > {{distrib_schema_path}}/{{schema_name}}.yaml


# ============== CDM-specific recipes ==============

# Generate enriched LinkML schema from Rosetta DSL source files, then apply ecosystem SSSOM overlays
[group('model development')]
gen-from-rosetta: _gen-from-rosetta overlay-sssom

[private]
_gen-from-rosetta:
  uv run python scripts/rosetta_to_linkml.py \
    --rosetta-dir rosetta-source/src/main/rosetta \
    --output-dir src/common_domain_model/schema \
    --codelist-dir rosetta-source/src/main/resources/codelist/json \
    --schema-dir rosetta-source/src/main/resources/schemas \
    --sssom-out src/common_domain_model/mappings/rosetta_to_linkml.sssom.tsv \
    --ext-sssom-out src/common_domain_model/mappings/cdm-mappings.sssom.tsv \
    --ecosystem-mappings-dir src/common_domain_model/mappings

# Overlay ecosystem SSSOM mappings (gist/oscal/iso29100/spdx) onto existing schemas
[group('model development')]
overlay-sssom:
  uv run python scripts/apply_sssom_overlay.py \
    --schema-dir src/common_domain_model/schema \
    --mappings-dir src/common_domain_model/mappings

# Validate example/sample data against the generated LinkML schema.
#
# Every JSON file under examples/samples/ is validated; xfail-globs mark the
# subtrees with known upstream issues so they don't fail the build. As fixes
# land upstream, remove the matching --xfail-glob lines.
[group('model development')]
test_cdm_examples_samples:
  uv run python scripts/validate_samples.py \
    --xfail-glob 'examples/samples/legal-agreements/Isda-Credit-Support-Annex-Docs/Legacy-CSA-Sample-Data/**/*.json' \
    --xfail-glob 'examples/samples/legal-agreements/Isda-Credit-Support-Annex-Docs/VM-CSA-Sample-Data/**/*.json' \
    --xfail-glob 'examples/samples/legal-agreements/Isda-Credit-Support-Annex-Docs/IM-CSA-Sample-Data/**/*-IM-CSA.json' \
    --xfail-glob 'examples/samples/legal-agreements/Isda-Credit-Support-Annex-Docs/IM-CSA-Sample-Data/**/*-IM-CSD.json' \
    --xfail-glob 'examples/samples/legal-agreements/Isda-Credit-Support-Annex-Docs/IM-CSA-Sample-Data/**/*-IM-CTA.json' \
    --xfail-glob 'examples/samples/legal-agreements/eligible-collateral-schedules/**/*.json' \
    examples/samples

# Run the Rosetta-to-LinkML idempotency and structure tests
[group('model development')]
test-linkml:
  uv run python -m pytest tests/test_linkml_schema.py -v
