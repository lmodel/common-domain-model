---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-librarian
title: Knowledge librarian (knowledge-librarian.yaml)
description: The weekly run of the librarian agent, which opens a review pull request with whatever changed in the bundle, inert until `KNOWLEDGE_LIBRARIAN_ENABLED` is `true`.
genre: reference
resource: .github/workflows/knowledge-librarian.yaml
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/playbooks/knowledge-sources
  - https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-registrar
sources:
  - id: knowledge-librarian.yaml
    resource: .github/workflows/knowledge-librarian.yaml
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 1e172551353ddd65e23e92fd26303827aa641e44
status: draft
---

# Knowledge librarian (knowledge-librarian.yaml)

It runs on Mondays at 05:00 UTC, never pushes to the default branch and never merges.[^knowledge-librarian.yaml]

[^knowledge-librarian.yaml]: .github/workflows/knowledge-librarian.yaml
