---
type: Dataset
id: https://w3id.org/lmodel/common-domain-model/knowledge/datasets/generated-artefacts
title: Generated artefacts
description: "What the LinkML generators write from the schema: the JSON Schema, OWL, SHACL, ShEx, SQL, GraphQL, protobuf, TypeScript and JSON-LD under `.linkml/project/`, the Python dataclasses and Pydantic models, and the merged schema in `.linkml/docs/schema/`."
genre: reference
resource: .linkml/project
derivedFrom:
  - https://w3id.org/lmodel/common-domain-model/knowledge/datasets/common-domain-model-linkml-schema
sources:
  - id: gitignore
    resource: .linkml/.gitignore
  - id: test_generated_json_schema.py
    resource: .linkml/tests/test_generated_json_schema.py
    title: the docstring
  - resource: .linkml/src/common_domain_model/datamodel
  - resource: .linkml/docs/schema
generated:
  by: process:ktl-librarian
  at: "2026-11-06T08:54:53Z"
  revision: 57dc9f073be3725deb9d1cb697fbe95d674fc262
status: draft
---

# Generated artefacts

`just gen-project` writes them, and a test fails when the committed JSON Schema differs from the generator's output.[^test_generated_json_schema.py] The Java classes are left out of git, one file for each of the CDM's 780 classes and choices.[^gitignore]

[^gitignore]: .linkml/.gitignore
[^test_generated_json_schema.py]: .linkml/tests/test_generated_json_schema.py, the docstring
