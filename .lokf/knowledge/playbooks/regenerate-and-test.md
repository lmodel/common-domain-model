---
type: Playbook
id: https://w3id.org/lmodel/common-domain-model/knowledge/playbooks/regenerate-and-test
title: Regenerate and test
description: "How to rebuild the schema and everything written from it after a change: `just gen-linkml`, `just gen-project`, `just gen-doc` and `just lokf-adapt` from `.linkml/`, then `just lint` and `just test`."
genre: how-to
resource: .linkml/CONTRIBUTING.md
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/generated-artefacts
sources:
  - id: contributing.md
    resource: .linkml/CONTRIBUTING.md
    title: Before opening a pull request
  - id: project.justfile
    resource: .linkml/project.justfile
  - resource: .linkml/justfile
  - resource: .linkml/pyproject.toml
  - resource: .linkml/uv.lock
  - resource: .linkml/config.public.mk
  - resource: .linkml/generators.yaml
  - resource: .linkml/.copier-answers.yml
  - resource: .linkml/.editorconfig
  - resource: .linkml/src/common_domain_model/__init__.py
  - resource: .linkml/src/common_domain_model/_version.py
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 66ce5b0555aa24ae9b0135666c534827d6bafebf
status: draft
---

# Regenerate and test

Change the converter, never the modules. From `.linkml/`, run `just gen-linkml`, `just gen-project`, `just gen-doc` and `just lokf-adapt`, and commit what they write.[^contributing.md] `just check-linkml` fails when the modules differ from what the Rosetta files give.[^project.justfile]

Run `just lint` and `just test` before a pull request.

[^contributing.md]: .linkml/CONTRIBUTING.md, Before opening a pull request
[^project.justfile]: .linkml/project.justfile
