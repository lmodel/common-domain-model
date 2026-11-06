---
type: GlossaryTerm
id: https://w3id.org/lmodel/common-domain-model/knowledge/glossary/adapt-copy
title: Adapt copy
description: The copy of a LinkML schema that `lokf adapt` writes for a knowledge bundle to import beside LOKF's schema, with chosen classes re-rooted on Concept and clashing keys renamed.
genre: reference
resource: .lokf/common-domain-model.yaml
references:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/adapt-copy
sources:
  - id: project.justfile
    resource: .linkml/project.justfile
    title: the lokf-adapt recipes
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 57dc9f073be3725deb9d1cb697fbe95d674fc262
status: draft
---

# Adapt copy

Here the copy is `.lokf/common-domain-model.yaml`, and `just lokf-adapt` writes it.[^project.justfile]

[^project.justfile]: .linkml/project.justfile, the lokf-adapt recipes
