---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-website
title: Knowledge website (knowledge-website.yaml)
description: The workflow that builds the site in `knowledge-website/` on every change and weekly, and publishes the default branch's build once `KNOWLEDGE_WEBSITE_ENABLED` is `true`.
genre: reference
resource: .github/workflows/knowledge-website.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/services/documentation-site
sources:
  - id: knowledge-website.yaml
    resource: .github/workflows/knowledge-website.yaml
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 83af22aff3dd835c975c3ecbbe5e52a4d1db3307
status: draft
---

# Knowledge website (knowledge-website.yaml)

Until the variable is set, it builds and deploys nothing.[^knowledge-website.yaml]

[^knowledge-website.yaml]: .github/workflows/knowledge-website.yaml
