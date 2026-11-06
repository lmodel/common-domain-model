---
type: Playbook
id: https://w3id.org/lmodel/common-domain-model/knowledge/playbooks/release
title: Release
description: "How a release is cut: Conventional Commits on `master`, the `## [Unreleased]` changelog section, semantic-release behind the `release` Environment, and the knowledge release that attaches the adapt copy and the bundle."
genre: how-to
resource: .linkml/CONTRIBUTING.md
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/workflows/semantic-release
sources:
  - id: contributing.md
    resource: .linkml/CONTRIBUTING.md
    title: Releasing (maintainers)
  - id: releaserc.json
    resource: .releaserc.json
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 66ce5b0555aa24ae9b0135666c534827d6bafebf
status: draft
---

# Release

Write `## [Unreleased]` in the changelog as you go, and type each commit for what it is. On a merge to `master`, `semantic-release.yml` promotes the section, tags `vX.Y.Z` and publishes the release.[^contributing.md] `.releaserc.json` maps a breaking change to a minor release below 1.0.0.[^releaserc.json]

[^contributing.md]: .linkml/CONTRIBUTING.md, Releasing (maintainers)
[^releaserc.json]: .releaserc.json
