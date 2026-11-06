---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/finos-tree
title: FINOS's tree
description: "Every file of FINOS's CDM release, unchanged at the repository's root: the Rosetta model, its resources and samples, the Java build, FINOS's documentation site in `website/` and its governance files."
genre: reference
resource: rosetta-source
isPartOf:
  - https://w3id.org/lmodel/common-domain-model/knowledge/references/finos-common-domain-model
sources:
  - id: test_upstream_tree.py
    resource: .linkml/tests/test_upstream_tree.py
    title: the docstring
  - resource: .linkml/tests/upstream_tree.tsv
  - resource: .gitignore
  - resource: CONTRIBUTING.md
  - resource: GOVERNANCE.md
  - resource: LICENSE.md
  - resource: NOTICE.md
  - resource: Participants.md
  - resource: README.md
  - resource: ROADMAP.md
  - resource: ROADMAP26.md
  - resource: SCHEDULE26.md
  - resource: SCOPE.md
  - resource: allow-list.xml
  - resource: checkstyle.xml
  - resource: codefresh.yml
  - resource: config.json
  - resource: docs
  - resource: examples
  - resource: netlify.toml
  - resource: pom.xml
  - resource: python
  - resource: rosetta-source
  - resource: settings.xml
  - resource: tests
  - resource: website
  - resource: .github/Approval-Process.png
  - resource: .github/CDM Org Structure.pptx
  - resource: .github/CDM-Governance-Landscape.png
  - resource: .github/CODEOWNERS
  - resource: .github/CODE_OF_CONDUCT.md
  - resource: .github/FINOS-CDM-Working-Groups.png
  - resource: .github/Group-Roles-Scope.png
  - resource: .github/ISSUE_TEMPLATE/01--Feature_Template.yml
  - resource: .github/ISSUE_TEMPLATE/02--Task_Template.yml
  - resource: .github/ISSUE_TEMPLATE/03--Bug_Template.yml
  - resource: .github/ISSUE_TEMPLATE/config.yml
  - resource: .github/PULL_REQUEST_TEMPLATE/default.md
  - resource: .github/PULL_REQUEST_TEMPLATE/pull_request_template.md
  - resource: .github/Trade-Association-Collaboration.png
  - resource: .github/actions/maven-build/action.yml
  - resource: .github/bulb.svg
  - resource: .github/cdm-governance.png
  - resource: .github/cdm-release-mgmt.png
  - resource: .github/cdm-release-mgmt.pptx
  - resource: .github/cdm-roadmap-2024-1.png
  - resource: .github/cdm-roadmap-2024-2.png
  - resource: .github/cdm-roadmap-2025-1.png
  - resource: .github/cdm-roadmap-2025-2.png
  - resource: .github/dependabot.yml
  - resource: .github/finos-cdm-governance-structure.png
  - resource: .github/operating-model-1.png
  - resource: .github/operating-model-2.png
  - resource: .github/operating-model-3.png
  - resource: .github/product-coverage.png
  - resource: .github/use-of-github.png
  - resource: .github/workflows/close-blank-issues.yml
  - resource: .github/workflows/cve-scanning-schedule.yml
  - resource: .github/workflows/cve-scanning.yml
  - resource: .github/workflows/license-scanning.yml
  - resource: .github/workflows/pmd-code-scan.yml
  - resource: .github/workflows/windows-build.yml
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: dafe7bab2c015f40a486685508fc5c2e6a629def
status: draft
---

# FINOS's tree

This project reads FINOS's files and changes none of them. `.linkml/tests/upstream_tree.tsv` lists each file of the pinned release with its git object hash, and `.linkml/tests/test_upstream_tree.py` holds the tree to it byte for byte.[^test_upstream_tree.py]

FINOS's own site sits in `website/`, so this project's site sits in `knowledge-website/`.

[^test_upstream_tree.py]: .linkml/tests/test_upstream_tree.py, the docstring
