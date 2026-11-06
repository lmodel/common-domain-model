---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/neighbour-copies
title: Neighbour copies
description: The released adapt copies of other lmodel schemas under `.linkml/tests/neighbours/`, pinned by checksum, and `tests/shared_names.json`, which lists the names this copy shares with each.
genre: reference
resource: .linkml/tests/neighbours
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/adapt-copy
sources:
  - id: test_schema_rules.py
    resource: .linkml/tests/test_schema_rules.py
    title: the docstrings
  - id: shared_names.json
    resource: .linkml/tests/shared_names.json
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 0f21b8817a97c374d8038a2c5b2da80e4ed0a8d5
status: draft
---

# Neighbour copies

Each neighbour is the schema asset of a release. It was checked against the release's checksum, and the test pins it by that checksum.[^test_schema_rules.py] The CDM's names are its own, so the copy shares some classes and keys with gist, oscal, uco and others, as `tests/shared_names.json` lists.[^shared_names.json]

[^test_schema_rules.py]: .linkml/tests/test_schema_rules.py, the docstrings
[^shared_names.json]: .linkml/tests/shared_names.json
