# How the schema reads the CDM

The schema is the Common Domain Model (CDM) that FINOS publishes, at release 8.0.0-dev.13, the newest on FINOS's master branch. `scripts/rosetta_to_linkml.py` writes it from two parts of FINOS's tree: the Rosetta model under `rosetta-source/src/main/rosetta/`, and the FpML code lists under `rosetta-source/src/main/resources/codelist/json/` that the model names. `tests/test_converter.py` fails when a module differs from what the converter writes.

## What each Rosetta construct becomes

| Rosetta | LinkML |
| --- | --- |
| A namespace, such as `cdm.base.datetime` | A module, `cdm_base_datetime.yaml`, which imports the modules its types name. `common_domain_model.yaml` imports them all. |
| `type` | A class, with the CDM's name and description. |
| `extends` | `is_a`. |
| An attribute | An attribute of the class, with the CDM's camelCase name. |
| An attribute a subtype declares again, or marks `override` | `slot_usage` on the subtype. |
| Cardinality `(1..1)`, `(0..*)`, `(2..2)` | `required`, `multivalued`, `minimum_cardinality` and `maximum_cardinality`. |
| `choice` | A class with one attribute per option, named after the option's type, and an `exactly_one_of` over them. |
| `enum` | An enumeration. A value with a `displayName` is keyed by that name, which is what Rune writes in JSON, and lists its Rosetta name under `aliases`. |
| `enum ... extends` | The parent's values repeated, since LinkML enumerations do not inherit. |
| `typeAlias` naming an FpML code list | An enumeration of the list's codes, with `enum_uri` naming the list. Rosetta checks a code against the list, and so does the enumeration. |
| Another `typeAlias` | A LinkML type, with its bounds. |
| `one-of`, `required choice`, `optional choice` | `exactly_one_of` on the class. An optional choice adds a branch in which none is present. |
| A condition on the type's own attributes | A class expression, or a rule when it starts with `if`. |
| `[metadata key]`, `[metadata reference]`, `[metadata scheme]` and the rest | The annotation `rosetta_metadata`. |
| `[docReference ...]` | The annotation `doc_reference`, and `see_also` for a `schemeLocation`. A provision's text is left out. |
| `[deprecated]` | `deprecated`. |
| `[rootType]` | The annotation `rosetta_root_type`. |

A Rosetta condition binds every subtype. A LinkML class expression or rule does not reach a subclass in the generated JSON Schema, so the converter states each one again on every subtype, with `From <Type>.` before its description.

Thirteen attribute names, such as `name`, `description` and `version`, are also slots of LOKF's schema, under other IRIs. They are top-level slots in `common_domain_model_keys.yaml`, and each class that uses one gives its description and range in `slot_usage`, so that `lokf adapt` can rename them in the copy a knowledge bundle imports.

A name two Rosetta namespaces both declare takes the last part of its namespace as a prefix, because LinkML merges a schema's imports into one namespace: `CsaAdditionalTerminationEvent` and `IsdaAdditionalTerminationEvent`, `AssetFloatingRateIndex` and `CodelistFloatingRateIndex`, `AssetSettlementRateOption` and `CodelistSettlementRateOption`. Each lists its Rosetta name under `aliases`.

## What LinkML cannot state

About half of the CDM's conditions are stated. `just linkml-report` counts them, and a class's `comments` name each one that is not, with its Rosetta text. These cannot be stated:

- a condition on a path into another type, such as `relatedAgreements -> agreementDate exists`, or on a choice option through `as`;
- a comparison of two attributes, such as `startDate <= endDate`;
- a condition over a list's members, with `count`, `only exists`, `contains`, `all` or `any`;
- `<>`, because the converter cannot match what Rosetta gives for an absent value;
- equality with `True` or `False`, since JSON Schema compares a LinkML string condition with a JSON boolean and never matches;
- a strict bound on a decimal, such as `> 0`;
- a function call, `switch` or `to-enum`.

Four more things Rosetta states have no LinkML counterpart:

- **Metadata.** A `[metadata reference]` attribute may hold a reference to a keyed object instead of the object, and a `[metadata scheme]` value may carry the scheme it comes from. The schema states the value alone, and the annotation records the metadata.
- **Subtypes in place of their parent.** An attribute declared with a type may hold any of its subtypes, as in Java. The generated JSON Schema reads the declared type only.
- **Logic.** Functions, qualification functions and reporting rules compute or classify data, and are not data, so they are left out.
- **One meaning per name.** A Rosetta attribute belongs to its type, so `identifier` may be a string in one type and an object in another. LinkML gives each attribute name one IRI, and the JSON-LD context one term, so the RDF of a document reads every `identifier` alike.

## Reading a CDM document

Rune writes a CDM object to JSON with keys that carry metadata: `@type`, `@key` and its `:external` and `:scoped` forms, `@ref` and its forms, `@data` and `@scheme`. It writes a choice by the type the choice holds. `tests/rune_json.py` puts such a document in the form this schema states: it drops the keys, replaces a reference with the object it names in the same document, unwraps `@data`, and nests a choice through its options.

`tests/test_finos_samples.py` reads every CDM document in FINOS's tree that way, about 900 in all, and holds its shape. Every key must be an attribute of the type at that place, every value must have its attribute's type, and every enumerated value must be one of its enumeration's. The test does not hold completeness. FINOS's ingest writes partial trades from partial FpML, and most of them leave out a required attribute or break a condition. `tests/sample_departures.yaml` lists the documents whose shape the schema refuses, with the reason for each.

## What is left out

- The CDM's synonym mappings, which FINOS's tree no longer holds at this release, and the guessed SSSOM sets this fork used to carry.
- The namespaces that hold only functions and rules and declare no type, such as the FpML ingest under `cdm.ingest`.
- The descriptions of FpML's codes, and the text of the ISDA, ICMA and other documents the CDM cites. [NOTICE](https://github.com/lmodel/common-domain-model/blob/master/.linkml/NOTICE) says what the schema carries and under which terms.
