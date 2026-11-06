---
type: GlossaryTerm
id: https://w3id.org/lmodel/common-domain-model/knowledge/glossary/adapt-copy
title: Adapt copy
description: The copy of a LinkML schema that `lokf adapt` writes for a knowledge bundle to import beside LOKF's schema, with chosen classes re-rooted on Concept and clashing keys renamed.
genre: reference
resource: .lokf/schema/common-domain-model.yaml
references:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/adapt-copy
sources:
  - id: project.justfile
    resource: .linkml/project.justfile
    title: the lokf-adapt recipes
generated:
  by: process:ktl-librarian
  at: "2026-11-06T16:03:15Z"
  revision: 77146c9f6cd0f79b75af68062e2b73402819be24
status: draft
---

# Adapt copy

Here the copy is `.lokf/schema/common-domain-model.yaml`, and `just lokf-adapt` writes it.[^project.justfile]

[^project.justfile]: .linkml/project.justfile, the lokf-adapt recipes
