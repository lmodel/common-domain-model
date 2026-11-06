---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/finos-sample-documents
title: FINOS's CDM documents
description: The CDM documents Rune wrote in FINOS's tree, from its FpML ingest and its function tests, which `tests/test_finos_samples.py` reads with the committed JSON Schema, and the list of those whose shape the schema refuses.
genre: reference
resource: rosetta-source/src/main/resources/ingest/output
isPartOf:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/finos-tree
sources:
  - id: test_finos_samples.py
    resource: .linkml/tests/test_finos_samples.py
    title: the docstring
  - id: sample_departures.yaml
    resource: .linkml/tests/sample_departures.yaml
  - id: rune_json.py
    resource: .linkml/tests/rune_json.py
    title: the docstring
  - resource: rosetta-source/src/main/resources/functions
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 830b53b3403be45abcb3b3e194908831f418286c
status: draft
---

# FINOS's CDM documents

`tests/rune_json.py` puts each document in the form the schema states, and the test checks its shape: every key, type and enumerated value.[^rune_json.py] It does not check completeness, because the ingest writes partial trades from partial FpML.[^test_finos_samples.py]

`tests/sample_departures.yaml` lists the documents whose shape the schema refuses. Both reasons are references the ingest points at an object of another type.[^sample_departures.yaml]

[^test_finos_samples.py]: .linkml/tests/test_finos_samples.py, the docstring
[^sample_departures.yaml]: .linkml/tests/sample_departures.yaml
[^rune_json.py]: .linkml/tests/rune_json.py, the docstring
