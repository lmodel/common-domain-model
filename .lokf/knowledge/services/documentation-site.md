---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/services/documentation-site
title: Documentation site
description: The knowledge website in `ktl-website/`, built with Hugo from the bundle, the README, the docs, the changelog and the schema's pages, and published to `https://lmodel.github.io/common-domain-model/`.
genre: reference
resource: ktl-website/README.md
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-website
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
sources:
  - id: ktl-website-readme.md
    resource: ktl-website/README.md
  - id: site.toml
    resource: ktl-website/site.toml
  - id: knowledge-website.yaml
    resource: .github/workflows/knowledge-website.yaml
    title: the header comment
  - id: upstream_tree.tsv
    resource: .linkml/tests/upstream_tree.tsv
  - resource: ktl-website
generated:
  by: process:ktl-librarian
  at: "2026-11-15T03:47:48Z"
status: draft
---

# Documentation site

`website/` holds FINOS's own site, whose files `.linkml/tests/upstream_tree.tsv` pins.[^upstream_tree.tsv] So this site sits in `ktl-website/`, the folder the workflow builds when `website/` holds another site.[^knowledge-website.yaml]

`scripts/build.sh` builds it with Hugo and Pagefind, which come from PyPI at the versions `pyproject.toml` names. The README beside it says what each page is built from.[^ktl-website-readme.md]

`site.toml` holds this repository's values: the address, the title, the default branch `master`, and `source = ".linkml"`, so the README, the docs and the changelog come from `.linkml/`.[^site.toml]

[^upstream_tree.tsv]: .linkml/tests/upstream_tree.tsv
[^knowledge-website.yaml]: .github/workflows/knowledge-website.yaml, the header comment
[^ktl-website-readme.md]: ktl-website/README.md
[^site.toml]: ktl-website/site.toml
