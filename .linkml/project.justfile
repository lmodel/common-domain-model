## Add your own just recipes here. This is imported by the main justfile.

# Overriding recipes from the root justfile by adding a recipe with the same
# name in this file is not possible until a known issue in just is fixed,
# https://github.com/casey/just/issues/2540

# ============ The schema from FINOS's Rosetta files ============

# Rewrite the schema's modules and .linkmllint.yaml from ../rosetta-source/
[group('model development')]
gen-linkml:
  uv run python scripts/rosetta_to_linkml.py

# Fail when the schema differs from what ../rosetta-source/ gives
[group('model development')]
check-linkml:
  uv run python scripts/rosetta_to_linkml.py --check

# Count the Rosetta conditions the schema states, and why the rest are not
[group('model development')]
linkml-report:
  uv run python scripts/rosetta_to_linkml.py --report

# ---- linkml-sidecar: the linkml_schema doorway (kept across `just update`) ----
# The schema folder under an ordinary, visible name at the host root, for
# folder pickers and file managers that hide dot-folders. Git carries the
# link; a sync service does not, so this recipe recreates it on a machine
# where it is missing. POSIX only; on Windows run, from the host root,
# mklink /J linkml_schema .linkml\src\common_domain_model\schema

# Create (or recreate) the linkml_schema link at the host root, to .linkml/src/common_domain_model/schema
[group('sidecar')]
linkml-link:
    #!/usr/bin/env bash
    set -euo pipefail
    target=".linkml/src/{{schema_name}}/schema"
    [ -d "../$target" ] || { echo "no $target to link to" >&2; exit 1; }
    if [ -L ../linkml_schema ]; then
      if [ "$(readlink ../linkml_schema)" = "$target" ]; then echo "linkml_schema already present - nothing to link"; exit 0; fi
      echo "../linkml_schema is a link elsewhere ($(readlink ../linkml_schema)) - remove it and re-run" >&2; exit 1
    fi
    if [ -e ../linkml_schema ]; then echo "../linkml_schema exists and is not a link - leaving it alone" >&2; exit 1; fi
    ln -s "$target" ../linkml_schema && echo "linked linkml_schema -> $target"
