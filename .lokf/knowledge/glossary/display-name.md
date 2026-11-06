---
type: GlossaryTerm
id: https://w3id.org/lmodel/common-domain-model/knowledge/glossary/display-name
title: Display name
description: The `displayName` a CDM enumeration value may carry, such as `ACT/360` for `ACT_360`, which Rune writes in JSON and which the schema uses as the value's key.
genre: reference
resource: .linkml/docs/about.md
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/explanations/rosetta-to-linkml
sources:
  - id: about.md
    resource: .linkml/docs/about.md
    title: What each Rosetta construct becomes
  - id: test_converter.py
    resource: .linkml/tests/test_converter.py
    title: test_enum_values_are_written_as_rune_serialises_them
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: bdbcffe4754db3ce411ddc9f0d492297e6a3defd
status: draft
---

# Display name

A value with a display name is keyed by it and lists its Rosetta name under `aliases`.[^about.md] A test holds `DayCountFractionEnum` to it.[^test_converter.py]

[^about.md]: .linkml/docs/about.md, What each Rosetta construct becomes
[^test_converter.py]: .linkml/tests/test_converter.py, test_enum_values_are_written_as_rune_serialises_them
