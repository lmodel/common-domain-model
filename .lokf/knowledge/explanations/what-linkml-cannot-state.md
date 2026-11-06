---
type: Explanation
id: https://w3id.org/lmodel/common-domain-model/knowledge/explanations/what-linkml-cannot-state
title: What LinkML cannot state
description: "The CDM conditions and constructs the schema does not state: paths into another type, comparisons of two attributes, list conditions, `<>`, boolean equality, strict decimal bounds, function calls, metadata, subtypes in place of a parent and one meaning per attribute name."
genre: explanation
resource: .linkml/docs/about.md
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
sources:
  - id: about.md
    resource: .linkml/docs/about.md
    title: What LinkML cannot state
  - id: project.justfile
    resource: .linkml/project.justfile
    title: linkml-report
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: bdbcffe4754db3ce411ddc9f0d492297e6a3defd
status: draft
---

# What LinkML cannot state

About half of the CDM's conditions are stated, and each class's `comments` name the rest, with their Rosetta text.[^about.md] `just linkml-report` counts them and gives the reasons.[^project.justfile]

[^about.md]: .linkml/docs/about.md, What LinkML cannot state
[^project.justfile]: .linkml/project.justfile, linkml-report
