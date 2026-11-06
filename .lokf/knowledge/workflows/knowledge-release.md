---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-release
title: Knowledge release (knowledge-release.yaml)
description: The job that attaches the bundle, the Microsoft 365 skill zips and the adapt copy to a GitHub release, each with its checksum.
genre: reference
resource: .github/workflows/knowledge-release.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/adapt-copy
sources:
  - id: knowledge-release.yaml
    resource: .github/workflows/knowledge-release.yaml
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 1e172551353ddd65e23e92fd26303827aa641e44
status: draft
---

# Knowledge release (knowledge-release.yaml)

It attaches the domain schema the justfile names as `schema-<tag>-<name>.yaml`, and runs on a release only once `KNOWLEDGE_RELEASE_ENABLED` is `true`.[^knowledge-release.yaml]

[^knowledge-release.yaml]: .github/workflows/knowledge-release.yaml
