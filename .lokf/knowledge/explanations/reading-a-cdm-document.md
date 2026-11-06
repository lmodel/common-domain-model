---
type: Explanation
id: https://w3id.org/lmodel/common-domain-model/knowledge/explanations/reading-a-cdm-document
title: Reading a CDM document
description: How a CDM document that Rune wrote, with its `@type`, `@key`, `@ref` and `@data` keys, is put in the form the schema states, so that the generated JSON Schema can judge it.
genre: explanation
resource: .linkml/tests/rune_json.py
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/finos-sample-documents
sources:
  - id: rune_json.py
    resource: .linkml/tests/rune_json.py
    title: the docstring
  - id: about.md
    resource: .linkml/docs/about.md
    title: Reading a CDM document
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 82a6897805591d58acb34a76be5d238e96e4dd79
status: draft
---

# Reading a CDM document

Rune writes metadata as keys starting with `@` and a choice by the type it holds. `tests/rune_json.py` drops the keys, replaces a reference with the object it names in the same document, unwraps `@data`, and nests a choice through its options.[^rune_json.py]

What it cannot undo, it reports: a subtype where the schema expects the parent, and a reference it cannot resolve.[^about.md]

[^rune_json.py]: .linkml/tests/rune_json.py, the docstring
[^about.md]: .linkml/docs/about.md, Reading a CDM document
