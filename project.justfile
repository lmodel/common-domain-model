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
gen-linkml: _gen-linkml overlay-sssom

[private]
_gen-linkml:
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

# ============== Supplemental generator recipes (beyond gen-project defaults) ==============
# gen-project already covers: graphql, jsonldcontext, jsonld, jsonschema, owl,
# prefixmap, proto, python, shex, shacl, sqlddl, excel, typescript.
# Explicit in main justfile: java, typescript (dup), owl (dup), pydantic (→ datamodel/).
# The recipes below cover the remaining available generators.
# Run all at once with: just gen-project-extended

# ---- Schema / metadata formats ----

# NOTE: recipe named gen-merged-schema to avoid conflict with CDM's gen-linkml recipe
# Generate a single self-contained merged LinkML YAML with all imports resolved
[group('model development')]
gen-merged-schema:
  mkdir -p {{dest}}/linkml
  uv run gen-linkml --mergeimports -o {{dest}}/linkml/{{schema_name}}.merged.linkml.yaml {{source_schema_path}}

# gen-yaml CLI hits the linkml-runtime 1.11.0 RepresenterError (JsonObj missing SafeDumper representer).
# Use the same patched script as _gen-yaml until linkml-runtime > 1.11.0 lands.
# Generate resolved YAML schema (patched yamlgen)
[group('model development')]
gen-yaml-artifact:
  mkdir -p {{dest}}/yaml
  uv run python scripts/gen_yaml_patched.py {{source_schema_path}} > {{dest}}/yaml/{{schema_name}}.yaml

# Generate SSSOM mapping TSV from schema slot_uri / mappings
[group('model development')]
gen-sssom-artifact:
  mkdir -p {{dest}}/sssom
  uv run gen-sssom --mergeimports -o {{dest}}/sssom/{{schema_name}}.sssom.tsv {{source_schema_path}}

# Generate Python namespace manager for all prefixes in the schema
[group('model development')]
gen-namespaces-artifact:
  mkdir -p {{dest}}/namespaces
  uv run gen-namespaces --mergeimports {{source_schema_path}} > {{dest}}/namespaces/{{schema_name}}.namespaces.py

# Generate TSV summary (classes, slots, counts — useful in spreadsheets)
[group('model development')]
gen-summary-artifact:
  mkdir -p {{dest}}/summary
  uv run gen-summary --mergeimports {{source_schema_path}} > {{dest}}/summary/{{schema_name}}.summary.tsv

# ---- Visualization / diagram formats ----

# Generate a single combined Graphviz DOT graph of the schema
[group('model development')]
gen-graphviz-artifact:
  mkdir -p {{dest}}/graphviz
  uv run gen-graphviz --mergeimports -f dot -o {{dest}}/graphviz/{{schema_name}}.dot {{source_schema_path}}

# Generate per-class Mermaid class diagram Markdown files (one .md per class)
[group('model development')]
gen-mermaid-artifact:
  mkdir -p {{dest}}/mermaid
  uv run gen-mermaid-class-diagram --mergeimports -d {{dest}}/mermaid {{source_schema_path}}

# Generate Mermaid ER diagram (single file, mermaid format)
[group('model development')]
gen-erdiagram-artifact:
  mkdir -p {{dest}}/erdiagram
  uv run gen-erdiagram --mergeimports -f mermaid {{source_schema_path}} > {{dest}}/erdiagram/{{schema_name}}.er.md

# Generate PlantUML diagram (stdout → single file)
[group('model development')]
gen-plantuml-artifact:
  mkdir -p {{dest}}/plantuml
  uv run gen-plantuml --mergeimports {{source_schema_path}} > {{dest}}/plantuml/{{schema_name}}.plantuml

# ---- Data / query formats ----

# gen-rdf embeds ./cdm_*.context.jsonld refs that rdflib resolves against the
# schema @base URL (https://w3id.org/lmodel/…), returning HTTP 404. Patched
# script strips those refs; all prefix bindings are in the merged context.
# Generate RDF/Turtle representation of the schema
[group('model development')]
gen-rdf-artifact:
  mkdir -p {{dest}}/rdf
  uv run python scripts/gen_rdf_patched.py --mergeimports -o {{dest}}/rdf/{{schema_name}}.ttl {{source_schema_path}}

# Generate a directory of SPARQL validation queries (one query per constraint)
[group('model development')]
gen-sparql-artifact:
  mkdir -p {{dest}}/sparql
  uv run gen-sparql --mergeimports -d {{dest}}/sparql {{source_schema_path}}

# Generate CSV data dictionary of classes and slots
[group('model development')]
gen-csv-artifact:
  mkdir -p {{dest}}/csv
  uv run gen-csv --mergeimports {{source_schema_path}} > {{dest}}/csv/{{schema_name}}.csv

# ---- Database formats ----

# Generate DBML (Database Markup Language) for schema visualization tools (DBDiagram etc.)
[group('model development')]
gen-dbml-artifact:
  mkdir -p {{dest}}/dbml
  uv run python3 scripts/gen_dbml_patched.py -s {{source_schema_path}} -o {{dest}}/dbml/{{schema_name}}.dbml

# Generate SQLAlchemy ORM models
[group('model development')]
gen-sqla-artifact:
  mkdir -p {{dest}}/sqla
  uv run gen-sqla --mergeimports {{source_schema_path}} > {{dest}}/sqla/{{schema_name}}_sqlalchemy.py

# Generate SQL validation queries
[group('model development')]
gen-sqlvalidation-artifact:
  mkdir -p {{dest}}/sqlvalidation
  uv run gen-sqlvalidation --mergeimports {{source_schema_path}} > {{dest}}/sqlvalidation/{{schema_name}}.sql

# Generate TerminusDB JSON-LD schema
[group('model development')]
gen-terminusdb-artifact:
  mkdir -p {{dest}}/terminusdb
  uv run gen-terminusdb --mergeimports {{source_schema_path}} > {{dest}}/terminusdb/{{schema_name}}.json

# Generate TypeDB TypeQL schema definitions
[group('model development')]
gen-typedb-artifact:
  mkdir -p {{dest}}/typedb
  uv run gen-typedb --mergeimports {{source_schema_path}} > {{dest}}/typedb/{{schema_name}}.tql

# ---- Language bindings ----

# Generate Go structs (stdout → single file)
[group('model development')]
gen-golang-artifact:
  mkdir -p {{dest}}/golang
  uv run gen-golang --mergeimports {{source_schema_path}} > {{dest}}/golang/{{schema_name}}.go

# Generate Rust crate (directory with Cargo.toml + src/)
[group('model development')]
gen-rust-artifact:
  mkdir -p {{dest}}/rust
  uv run gen-rust --mergeimports --force -o {{dest}}/rust {{source_schema_path}}

# Generate C++17 header file
[group('model development')]
gen-cpp-artifact:
  mkdir -p {{dest}}/cpp
  uv run gen-cpp-header --mergeimports {{source_schema_path}} > {{dest}}/cpp/{{schema_name}}.h

# Generate Pandera dataframe validation schemas
[group('model development')]
gen-pandera-artifact:
  mkdir -p {{dest}}/pandera
  uv run python3 scripts/gen_pandera_patched.py {{source_schema_path}} > {{dest}}/pandera/{{schema_name}}_pandera.py

# Generate Markdown data dictionary (single combined file)
# NOTE Bug 12: gen-markdown-datadict creates a new ERDiagramGenerator (and
# therefore re-loads the full CDM schema) for every one of the 2500+ CDM
# classes, hanging indefinitely.  scripts/gen_markdown_datadict_patched.py
# overrides _generate_class_diagram to cache one ERDiagramGenerator instance.
[group('model development')]
gen-markdown-datadict-artifact:
  mkdir -p {{dest}}/markdown-datadict
  uv run python3 scripts/gen_markdown_datadict_patched.py --mergeimports {{source_schema_path}} > {{dest}}/markdown-datadict/{{schema_name}}.md

# Generate GOLR (SOLR) view configurations (one JSON per class)
[group('model development')]
gen-golr-artifact:
  mkdir -p {{dest}}/golr
  uv run gen-golr-views --mergeimports -d {{dest}}/golr {{source_schema_path}}

# ---- Aggregate ----

# Usage: just gen-project && just gen-project-extended
# Run all supplemental generators (those not already covered by gen-project)
[group('model development')]
gen-project-extended: \
  gen-merged-schema \
  gen-yaml-artifact \
  gen-sssom-artifact \
  gen-namespaces-artifact \
  gen-summary-artifact \
  gen-graphviz-artifact \
  gen-mermaid-artifact \
  gen-erdiagram-artifact \
  gen-plantuml-artifact \
  gen-rdf-artifact \
  gen-sparql-artifact \
  gen-csv-artifact \
  gen-dbml-artifact \
  gen-sqla-artifact \
  gen-sqlvalidation-artifact \
  gen-terminusdb-artifact \
  gen-typedb-artifact \
  gen-golang-artifact \
  gen-rust-artifact \
  gen-cpp-artifact \
  gen-pandera-artifact \
  gen-markdown-datadict-artifact \
  gen-golr-artifact
