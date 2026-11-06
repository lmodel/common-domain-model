---
type: GlossaryTerm
id: https://w3id.org/lmodel/common-domain-model/knowledge/glossary/rosetta-metadata
title: Rosetta metadata
description: A Rosetta `[metadata ...]` annotation, such as `key`, `reference` or `scheme`, which lets a value be given by reference or carry its scheme; the schema records it as the annotation `rosetta_metadata`.
genre: reference
resource: .linkml/docs/about.md
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/explanations/what-linkml-cannot-state
  - https://w3id.org/lmodel/common-domain-model/knowledge/explanations/reading-a-cdm-document
sources:
  - id: about.md
    resource: .linkml/docs/about.md
    title: What LinkML cannot state
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: bdbcffe4754db3ce411ddc9f0d492297e6a3defd
status: draft
---

# Rosetta metadata

A `[metadata reference]` attribute may hold a reference to a keyed object instead of the object, and a `[metadata scheme]` value may carry the scheme it comes from. LinkML has no metaslot for either, so the schema states the value and records the metadata as an annotation.[^about.md]

[^about.md]: .linkml/docs/about.md, What LinkML cannot state
