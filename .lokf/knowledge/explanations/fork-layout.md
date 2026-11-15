---
type: Explanation
id: https://w3id.org/lmodel/common-domain-model/knowledge/explanations/fork-layout
title: The fork's layout
description: "Why FINOS's tree sits at the root, unchanged but for its Dependabot settings, and this project sits beside it: the LinkML project in `.linkml/`, the knowledge bundle in `.lokf/`, the site in `ktl-website/`, and the `linkml_schema` and `knowledge_bundle` doorways."
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
  at: "2026-11-15T18:41:27Z"
status: draft
---

# The fork's layout

FINOS's tree stays as FINOS publishes it, but for `.github/dependabot.yml`, which holds this project's Dependabot settings, so a merge of a later release meets no other change of this project's. The project adds its other files where FINOS has none.[^readme.md] `CONTRIBUTING.md` lists what each folder holds.[^contributing.md]

`linkml_schema` at the root links to the schema's folder, and `knowledge_bundle` to the bundle, under names that folder pickers show.

[^readme.md]: .linkml/README.md, What it models
[^contributing.md]: .linkml/CONTRIBUTING.md, What this project is
