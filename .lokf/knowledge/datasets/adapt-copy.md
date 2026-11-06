---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/adapt-copy
title: The adapt copy
description: "`.lokf/common-domain-model.yaml`, the copy of the schema that `just lokf-adapt` writes for a knowledge bundle to import beside LOKF's schema, with `LegalEntity` and `Party` re-rooted on Concept and thirteen keys renamed with a `cdm_` prefix."
genre: reference
resource: .lokf/common-domain-model.yaml
derivedFrom:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
sources:
  - id: project.justfile
    resource: .linkml/project.justfile
    title: the lokf-adapt recipes
  - id: test_schema_rules.py
    resource: .linkml/tests/test_schema_rules.py
    title: the docstrings
  - id: readme.md
    resource: .linkml/README.md
    title: Knowledge Trust Ladder (KTL)
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 57dc9f073be3725deb9d1cb697fbe95d674fc262
status: draft
---

# The adapt copy

`just lokf-adapt` writes the copy from the schema, with the roots `LegalEntity` and `Party` and the prefix `cdm`, and `just lokf-adapt-check` fails when it is stale.[^project.justfile]

The copy renames the keys the CDM shares with LOKF and keeps their IRIs. A concept of type `LegalEntity` therefore writes its name as `cdm_name`.[^readme.md] `tests/test_schema_rules.py` holds the copy apart from LOKF and lists the names it shares with other lmodel copies.[^test_schema_rules.py]

[^project.justfile]: .linkml/project.justfile, the lokf-adapt recipes
[^test_schema_rules.py]: .linkml/tests/test_schema_rules.py, the docstrings
[^readme.md]: .linkml/README.md, Knowledge Trust Ladder (KTL)
