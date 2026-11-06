---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/main
title: Build and test (main.yaml)
description: The workflow that lints the schema, runs the tests on Python 3.10 to 3.14 and checks the adapt copy, on every pull request and push to `master`.
genre: reference
resource: .github/workflows/main.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/adapt-copy
sources:
  - id: main.yaml
    resource: .github/workflows/main.yaml
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: a59ec3c748855a6c4dd4affde866d61dfaa92b97
status: draft
---

# Build and test (main.yaml)

The job runs in `.linkml/`, installs from `uv.lock`, lints the schema on Python 3.13, runs `just test` on each version, and checks the adapt copy.[^main.yaml]

[^main.yaml]: .github/workflows/main.yaml
