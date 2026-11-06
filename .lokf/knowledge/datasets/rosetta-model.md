---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/rosetta-model
title: The CDM's Rosetta model
description: "FINOS's Rosetta files under `rosetta-source/src/main/rosetta/`: the CDM's types, choices, enumerations, type aliases, conditions and functions, which the converter reads."
genre: reference
resource: rosetta-source/src/main/rosetta
isPartOf:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/finos-tree
sources:
  - id: rosetta_to_linkml.py
    resource: .linkml/scripts/rosetta_to_linkml.py
    title: the docstring
  - id: about.md
    resource: .linkml/docs/about.md
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: dafe7bab2c015f40a486685508fc5c2e6a629def
status: draft
---

# The CDM's Rosetta model

The CDM declares its data model in Rosetta. Each file holds one namespace and one kind of declaration, such as `base-datetime-type.rosetta` and `base-datetime-enum.rosetta`.[^rosetta_to_linkml.py] The converter reads the type, choice, enumeration and type alias declarations. It leaves the functions and rules out, because they compute or classify data and are not data.[^about.md]

[^rosetta_to_linkml.py]: .linkml/scripts/rosetta_to_linkml.py, the docstring
[^about.md]: .linkml/docs/about.md
