---
type: Playbook
id: https://w3id.org/lmodel/common-domain-model/knowledge/playbooks/knowledge-sources
title: Knowledge sources
description: "The map of where this bundle's knowledge comes from: the schema project in `.linkml/`, the workflows, the site, and FINOS's Rosetta model and resources, with the classes each yields and how to re-check it."
genre: how-to
sources:
  - resource: .linkml/src/common_domain_model/schema
  - resource: .linkml/scripts
  - resource: .linkml/tests
  - resource: .linkml/docs
  - resource: .linkml/upstream
  - resource: .linkml/project
  - resource: .linkml/README.md
  - resource: .linkml/CONTRIBUTING.md
  - resource: .linkml/NOTICE
  - resource: .linkml/AI_COVENANT.md
  - resource: .linkml/CHANGELOG.md
  - resource: .github/SECURITY.md
  - resource: .github/workflows/main.yaml
  - resource: .github/workflows/lint-and-docs.yaml
  - resource: .github/workflows/upstream-watch.yaml
  - resource: .github/workflows/semantic-release.yml
  - resource: .github/workflows/knowledge-librarian.yaml
  - resource: .github/workflows/knowledge-registrar.yaml
  - resource: .github/workflows/knowledge-release.yaml
  - resource: .github/workflows/knowledge-sync.yaml
  - resource: .github/workflows/knowledge-website.yaml
  - resource: knowledge-website/README.md
  - resource: rosetta-source/src/main/rosetta
  - resource: rosetta-source/src/main/resources
exclusions:
  - resource: .linkml/CODE_OF_CONDUCT.md
    reason: The Contributor Covenant as the template ships it, with the maintainer's address; it states no fact about this project's knowledge.
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
status: draft
---

# Knowledge sources

| Source | Yields | Re-check |
| --- | --- | --- |
| `.linkml/src/common_domain_model/schema/`, `.linkml/scripts/`, `.linkml/docs/` | the schema, explanations, glossary terms | `just check-linkml`, and read `docs/about.md` |
| `.linkml/tests/`, `.linkml/upstream/` | datasets | `just test` |
| `.linkml/README.md`, `CONTRIBUTING.md`, `NOTICE`, `AI_COVENANT.md`, `.github/SECURITY.md` | playbooks, policies | read them |
| `.github/workflows/` (this project's) | one Service per workflow | read the header comment |
| `knowledge-website/` | the documentation site | `npm run build` |
| `rosetta-source/` | the Rosetta model, the code lists, the samples | `just check-linkml` and `tests/test_finos_samples.py` |

The rest of FINOS's tree has one concept, on FINOS's tree, because this project only holds it to its hashes.
