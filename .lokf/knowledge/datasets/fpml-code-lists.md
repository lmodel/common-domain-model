---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/fpml-code-lists
title: The FpML code lists
description: The FpML coding schemes under `rosetta-source/src/main/resources/codelist/json/`, which the CDM's code-list type aliases name and the schema writes as enumerations of their codes.
genre: reference
resource: rosetta-source/src/main/resources/codelist/json
isPartOf:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/finos-tree
sources:
  - id: about.md
    resource: .linkml/docs/about.md
  - id: notice
    resource: .linkml/NOTICE
generated:
  by: process:ktl-librarian
  at: "2026-11-06T12:02:20Z"
  revision: a5d4433af82402eeda5b6d2b885a05ab5f15d231
status: draft
---

# The FpML code lists

A CDM type alias such as `BusinessCenter` checks a code against the FpML code list its `domain` names. The schema writes each such alias as an enumeration of the list's codes, with `enum_uri` naming the list, so a validator checks the code as Rosetta does.[^about.md]

The code lists are FpML coding schemes, part of the FpML Specifications, which ISDA licenses under the FpML Public License; NOTICE carries that licence's notice. The schema carries each scheme's codes and its canonical URI, and leaves out FpML's descriptions of the codes. FpML publishes no IRI for a code, so a value is the code alone.[^notice]

[^about.md]: .linkml/docs/about.md
[^notice]: .linkml/NOTICE
