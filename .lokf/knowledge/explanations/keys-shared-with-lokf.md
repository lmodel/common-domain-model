---
type: Explanation
id: https://w3id.org/lmodel/common-domain-model/knowledge/explanations/keys-shared-with-lokf
title: Keys shared with LOKF
description: "Why thirteen CDM attribute names, such as `name`, `description` and `version`, are top-level slots in `common_domain_model_keys.yaml`: so that `lokf adapt` renames them in the copy, and a concept's own description keeps LOKF's IRI."
genre: explanation
resource: .linkml/src/common_domain_model/schema/common_domain_model_keys.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/adapt-copy
sources:
  - id: rosetta_to_linkml.py
    resource: .linkml/scripts/rosetta_to_linkml.py
    title: LOKF_KEYS
  - id: test_schema_rules.py
    resource: .linkml/tests/test_schema_rules.py
    title: test_the_keys_lokf_shares_are_slots
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 57dc9f073be3725deb9d1cb697fbe95d674fc262
status: draft
---

# Keys shared with LOKF

The JSON-LD context gives each key one IRI, so a CDM key named like a LOKF one would project a concept's description, name or version under the CDM's IRI. `lokf adapt` renames a clashing slot in the copy but not a class's attribute, so these names are slots, and each class gives its own description and range in `slot_usage`.[^rosetta_to_linkml.py]

A test holds the list to the names LOKF's schema defines.[^test_schema_rules.py]

[^rosetta_to_linkml.py]: .linkml/scripts/rosetta_to_linkml.py, LOKF_KEYS
[^test_schema_rules.py]: .linkml/tests/test_schema_rules.py, test_the_keys_lokf_shares_are_slots
