---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-website
title: Knowledge website (knowledge-website.yaml)
description: The workflow that builds the site in `ktl-website/` on every change and weekly, and publishes the default branch's build once `KNOWLEDGE_WEBSITE_ENABLED` is `true`.
genre: reference
resource: .github/workflows/knowledge-website.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/services/documentation-site
sources:
  - id: knowledge-website.yaml
    resource: .github/workflows/knowledge-website.yaml
generated:
  by: process:ktl-librarian
  at: "2026-11-15T03:47:48Z"
status: draft
---

# Knowledge website (knowledge-website.yaml)

The workflow builds the site in `ktl-website/` when a push to the default branch or a pull request touches its sources, and every Monday. A pull request gets the same build, link check included, and no deployment.[^knowledge-website.yaml]

The `build` job runs Hugo, Pagefind and the lokf toolkit under a read-only token. The `deploy` job holds the Pages scopes and runs for the default branch only, once the repository variable `KNOWLEDGE_WEBSITE_ENABLED` is `true`. Until then the workflow builds the site but deploys nothing.[^knowledge-website.yaml]

[^knowledge-website.yaml]: .github/workflows/knowledge-website.yaml
