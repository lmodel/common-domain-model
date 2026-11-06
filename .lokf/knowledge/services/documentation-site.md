---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/services/documentation-site
title: Documentation site
description: The knowledge website in `knowledge-website/`, built from the bundle, the README, the docs, the changelog and the schema's pages, and published to `https://lmodel.github.io/common-domain-model/`.
genre: reference
resource: knowledge-website/README.md
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-website
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
sources:
  - id: knowledge-website-readme.md
    resource: knowledge-website/README.md
  - id: site.config.mjs
    resource: knowledge-website/site.config.mjs
  - resource: knowledge-website
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 83af22aff3dd835c975c3ecbbe5e52a4d1db3307
status: draft
---

# Documentation site

The site sits in `knowledge-website/` because `website/` is FINOS's own site for the CDM.[^knowledge-website-readme.md] `site.config.mjs` names what it shows.[^site.config.mjs]

[^knowledge-website-readme.md]: knowledge-website/README.md
[^site.config.mjs]: knowledge-website/site.config.mjs
