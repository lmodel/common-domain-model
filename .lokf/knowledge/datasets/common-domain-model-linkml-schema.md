---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
title: The CDM LinkML schema
description: "The LinkML schema of the CDM: one module per Rosetta namespace under `.linkml/src/common_domain_model/schema/`, with every type, choice, enumeration and type alias, written by `scripts/rosetta_to_linkml.py` and never edited by hand."
genre: reference
resource: .linkml/src/common_domain_model/schema
derivedFrom:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/rosetta-model
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/fpml-code-lists
isPartOf:
  - https://w3id.org/lmodel/common-domain-model/knowledge/references/finos-common-domain-model
sources:
  - id: rosetta_to_linkml.py
    resource: .linkml/scripts/rosetta_to_linkml.py
    title: the docstring
  - id: about.md
    resource: .linkml/docs/about.md
  - id: test_converter.py
    resource: .linkml/tests/test_converter.py
    title: the docstring
  - resource: .linkml/.linkmllint.yaml
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 57dc9f073be3725deb9d1cb697fbe95d674fc262
status: draft
---

# The CDM LinkML schema

`scripts/rosetta_to_linkml.py` reads every `type`, `choice`, `enum` and `typeAlias` in FINOS's Rosetta files and writes one LinkML module per Rosetta namespace, plus the umbrella `common_domain_model.yaml` that imports them all.[^rosetta_to_linkml.py] A condition the converter cannot state is named in the class's `comments`, with its Rosetta text.

`docs/about.md` says what each Rosetta construct becomes.[^about.md] `tests/test_converter.py` fails when a module differs from what the converter writes, so nobody edits the modules by hand.[^test_converter.py]

[^rosetta_to_linkml.py]: .linkml/scripts/rosetta_to_linkml.py, the docstring
[^about.md]: .linkml/docs/about.md
[^test_converter.py]: .linkml/tests/test_converter.py, the docstring
