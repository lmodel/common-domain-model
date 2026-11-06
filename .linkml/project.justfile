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
