---
type: GlossaryTerm
id: https://w3id.org/lmodel/common-domain-model/knowledge/glossary/choice-type
title: Choice type
description: A Rosetta `choice`, such as `Asset` or `Payout`, which holds exactly one of its options; the schema writes it as a class with one attribute per option and an `exactly_one_of` over them.
genre: reference
resource: .linkml/docs/about.md
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/explanations/rosetta-to-linkml
sources:
  - id: about.md
    resource: .linkml/docs/about.md
    title: What each Rosetta construct becomes
  - id: rune_json.py
    resource: .linkml/tests/rune_json.py
    title: the docstring
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: bdbcffe4754db3ce411ddc9f0d492297e6a3defd
status: draft
---

# Choice type

A choice names its options by type, and each option attribute takes the type's name.[^about.md] Rune writes a choice by the type it holds, with `@type`, and `tests/rune_json.py` nests it through the options.[^rune_json.py]

[^about.md]: .linkml/docs/about.md, What each Rosetta construct becomes
[^rune_json.py]: .linkml/tests/rune_json.py, the docstring
