---
type: Explanation
id: https://w3id.org/lmodel/common-domain-model/knowledge/explanations/rosetta-to-linkml
title: What each Rosetta construct becomes
description: "How the converter writes the CDM in LinkML: a namespace as a module, a type as a class, a choice as a class that holds exactly one option, an enumeration keyed by display name, a code-list alias as an enumeration, and conditions as class expressions or rules."
genre: explanation
resource: .linkml/docs/about.md
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
sources:
  - id: about.md
    resource: .linkml/docs/about.md
    title: What each Rosetta construct becomes
  - id: rosetta_to_linkml.py
    resource: .linkml/scripts/rosetta_to_linkml.py
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: bdbcffe4754db3ce411ddc9f0d492297e6a3defd
status: draft
---

# What each Rosetta construct becomes

`docs/about.md` holds the table, one row per Rosetta construct.[^about.md] A Rosetta condition binds every subtype, and a LinkML class expression does not reach a subclass in the generated JSON Schema, so the converter states each one again on every subtype.

A name two Rosetta namespaces declare takes the last part of its namespace as a prefix, as in `CsaAdditionalTerminationEvent`.[^rosetta_to_linkml.py]

[^about.md]: .linkml/docs/about.md, What each Rosetta construct becomes
[^rosetta_to_linkml.py]: .linkml/scripts/rosetta_to_linkml.py
