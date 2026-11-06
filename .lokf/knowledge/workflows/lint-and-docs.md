---
type: Service
id: https://w3id.org/lmodel/common-domain-model/knowledge/workflows/lint-and-docs
title: Lint and docs (lint-and-docs.yaml)
description: "The checks of this project's shell scripts, workflows and prose: ShellCheck, actionlint, the governance files' word budgets, markdownlint, lychee and codespell, never over FINOS's files."
genre: reference
resource: .github/workflows/lint-and-docs.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/explanations/fork-layout
sources:
  - id: lint-and-docs.yaml
    resource: .github/workflows/lint-and-docs.yaml
  - resource: .linkml/.markdownlint-cli2.jsonc
  - resource: .linkml/.pre-commit-config.yaml
  - resource: .linkml/.yamllint.yaml
  - resource: .linkml/lychee.toml
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: a45b9bda655ffd18c85f280bf372e1e6534edfdc
status: draft
---

# Lint and docs (lint-and-docs.yaml)

It runs on pull requests, on pushes to `master` and every Monday. CONTRIBUTING has a budget of 1,000 words and SECURITY one of 900.[^lint-and-docs.yaml]

[^lint-and-docs.yaml]: .github/workflows/lint-and-docs.yaml
