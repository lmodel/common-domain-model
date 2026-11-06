---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/upstream-pin
title: The upstream pin and tree list
description: "`.linkml/upstream/pin.yaml`, which names the FINOS release the tree and the schema hold, and `.linkml/tests/upstream_tree.tsv`, which lists that release's files by git object hash."
genre: reference
resource: .linkml/upstream/pin.yaml
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/references/finos-common-domain-model
sources:
  - id: pin.yaml
    resource: .linkml/upstream/pin.yaml
  - resource: .linkml/tests/upstream_tree.tsv
  - id: test_converter.py
    resource: .linkml/tests/test_converter.py
    title: test_the_header_names_the_pinned_edition
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 98d11b2417a688095c194d2efaeaa793285cfa4f
status: draft
---

# The upstream pin and tree list

The pin names the edition, the tag, the commit and the date of FINOS's release.[^pin.yaml] The schema header takes its `version` and `source` from it, and a test holds the three equal.[^test_converter.py]

[^pin.yaml]: .linkml/upstream/pin.yaml
[^test_converter.py]: .linkml/tests/test_converter.py, test_the_header_names_the_pinned_edition
