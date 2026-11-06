---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/semantic-release
title: Semantic release (semantic-release.yml)
description: "The release job: it previews every pull request with a dry run, and on a push to `master` promotes the changelog, tags the release and dispatches the knowledge release."
genre: reference
resource: .github/workflows/semantic-release.yml
relatedTo:
  - https://w3id.org/lmodel/common-domain-model/knowledge/workflows/knowledge-release
  - https://w3id.org/lmodel/common-domain-model/knowledge/playbooks/release
sources:
  - id: semantic-release.yml
    resource: .github/workflows/semantic-release.yml
  - resource: .github/scripts/changelog-release.mjs
  - resource: .github/release
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 8c441655ad587d8324d373d13661a2030f425383
status: draft
---

# Semantic release (semantic-release.yml)

The release step runs behind the `release` Environment. FINOS's tags carry no `v`, so semantic-release does not read them as versions.[^semantic-release.yml]

[^semantic-release.yml]: .github/workflows/semantic-release.yml
