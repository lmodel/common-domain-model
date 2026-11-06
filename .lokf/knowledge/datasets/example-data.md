---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/example-data
title: Example data
description: The examples and counter-examples under `.linkml/tests/data/`, named after the class they hold, which `tests/test_data.py` holds to the committed JSON Schema and the generated dataclasses.
genre: reference
resource: .linkml/tests/data
about:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
sources:
  - id: test_data.py
    resource: .linkml/tests/test_data.py
    title: the docstring and tests
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: e9c7d99ead9238bda4ccb29adc6e00a807244ed0
status: draft
---

# Example data

A valid example must load into the dataclasses and pass the JSON Schema. A counter-example names, on its first line, the JSON pointer where it fails, and the test checks it fails there. Each class a knowledge concept may name as its type has an example.[^test_data.py]

[^test_data.py]: .linkml/tests/test_data.py, the docstring and tests
