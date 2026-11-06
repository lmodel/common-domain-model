---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-sync
title: Knowledge sync (knowledge-sync.yaml)
description: The weekly job that keeps the sidecar's copies and the skills pin at the newest Knowledge Trust Ladder release, in one pull request.
genre: reference
resource: .github/workflows/knowledge-sync.yaml
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-librarian
sources:
  - id: knowledge-sync.yaml
    resource: .github/workflows/knowledge-sync.yaml
  - resource: .github/PULL_REQUEST_TEMPLATE/knowledge-sync.md
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 1e172551353ddd65e23e92fd26303827aa641e44
status: draft
---

# Knowledge sync (knowledge-sync.yaml)

It copies the release's templates over the host's copies and opens one pull request, which it refreshes until it is merged.[^knowledge-sync.yaml]

[^knowledge-sync.yaml]: .github/workflows/knowledge-sync.yaml
