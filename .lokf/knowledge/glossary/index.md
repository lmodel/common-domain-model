# Glossary

* [Rosetta](rosetta.md) - The language the CDM is written in: types, choices, enumerations, type aliases, conditions and functions, which FINOS's build turns into Java and which this project's converter turns into LinkML.
* [Choice type](choice-type.md) - A Rosetta `choice`, such as `Asset` or `Payout`, which holds exactly one of its options; the schema writes it as a class with one attribute per option and an `exactly_one_of` over them.
* [Rosetta metadata](rosetta-metadata.md) - A Rosetta `[metadata ...]` annotation, such as `key`, `reference` or `scheme`, which lets a value be given by reference or carry its scheme; the schema records it as the annotation `rosetta_metadata`.
* [Display name](display-name.md) - The `displayName` a CDM enumeration value may carry, such as `ACT/360` for `ACT_360`, which Rune writes in JSON and which the schema uses as the value's key.
* [Adapt copy](adapt-copy.md) - The copy of a LinkML schema that `lokf adapt` writes for a knowledge bundle to import beside LOKF's schema, with chosen classes re-rooted on Concept and clashing keys renamed.
