---
type: Playbook
id: https://w3id.org/lmodel/common-domain-model/knowledge/playbooks/take-a-new-finos-release
title: Take a new FINOS release
description: "How to move the fork to a later CDM release from FINOS's master branch: merge the tag, rewrite the tree list, move the pin and regenerate, then merge with a merge commit."
genre: how-to
resource: .linkml/CONTRIBUTING.md
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/references/finos-common-domain-model
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/upstream-pin
sources:
  - id: contributing.md
    resource: .linkml/CONTRIBUTING.md
    title: Taking a new release from FINOS
  - id: check_upstream_release.py
    resource: .linkml/scripts/check_upstream_release.py
    title: the docstring
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 66ce5b0555aa24ae9b0135666c534827d6bafebf
status: draft
---

# Take a new FINOS release

The weekly watch opens an issue when FINOS releases from master.[^check_upstream_release.py] On a branch, merge the release's tag, rewrite `.linkml/tests/upstream_tree.tsv` from `git ls-tree -r -z`, move the pin in `.linkml/upstream/pin.yaml`, and run `just gen-linkml`. Merge with a merge commit, since a squash loses FINOS's history.[^contributing.md]

[^contributing.md]: .linkml/CONTRIBUTING.md, Taking a new release from FINOS
[^check_upstream_release.py]: .linkml/scripts/check_upstream_release.py, the docstring
