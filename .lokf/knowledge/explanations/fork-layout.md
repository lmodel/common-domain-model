---
type: Explanation
id: https://w3id.org/lmodel/common-domain-model/knowledge/explanations/fork-layout
title: The fork's layout
description: "Why FINOS's tree sits unchanged at the root and this project sits beside it: the LinkML project in `.linkml/`, the knowledge bundle in `.lokf/`, the site in `knowledge-website/`, and the `linkml_schema` and `knowledge_bundle` doorways."
genre: explanation
resource: .linkml/README.md
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/finos-tree
sources:
  - id: readme.md
    resource: .linkml/README.md
    title: What it models
  - id: contributing.md
    resource: .linkml/CONTRIBUTING.md
    title: What this project is
  - resource: linkml_schema
  - resource: knowledge_bundle
  - resource: llms.txt
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: bdbcffe4754db3ce411ddc9f0d492297e6a3defd
status: draft
---

# The fork's layout

FINOS's tree stays as FINOS publishes it, so a merge of a later release meets no change of this project's. The project adds files where FINOS has none.[^readme.md] `CONTRIBUTING.md` lists what each folder holds.[^contributing.md]

`linkml_schema` at the root links to the schema's folder, and `knowledge_bundle` to the bundle, under names that folder pickers show.

[^readme.md]: .linkml/README.md, What it models
[^contributing.md]: .linkml/CONTRIBUTING.md, What this project is
