---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/upstream-watch
title: Upstream watch (upstream-watch.yaml)
description: "The weekly check that `.linkml/scripts/check_upstream_release.py` runs: a drifted copy, a moved tag or a new FINOS release from master fails the run and opens or updates an issue."
genre: reference
resource: .github/workflows/upstream-watch.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/references/finos-common-domain-model
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/upstream-pin
sources:
  - id: upstream-watch.yaml
    resource: .github/workflows/upstream-watch.yaml
  - resource: .github/scripts/report-issue.sh
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: a59ec3c748855a6c4dd4affde866d61dfaa92b97
status: draft
---

# Upstream watch (upstream-watch.yaml)

The workflow runs every Monday, and a failing check opens an issue or comments on the one already open.[^upstream-watch.yaml]

[^upstream-watch.yaml]: .github/workflows/upstream-watch.yaml
