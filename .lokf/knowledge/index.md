---
lokf_version: "0.2"
okf_version: "0.2"
base_iri: https://w3id.org/lmodel/common-domain-model/knowledge/
context: https://w3id.org/lokf/context.jsonld
title: common-domain-model Knowledge Bundle
description: FINOS Common Domain Model (LinkML)
license: https://creativecommons.org/licenses/by/4.0/
publisher:
  type: Person
  id: https://w3id.org/lmodel/common-domain-model/knowledge/person/noel-mcloughlin
  name: Noel McLoughlin
---

# common-domain-model Knowledge Bundle

A [LOKF](https://lokf.nolan-nichols.com) knowledge base for common-domain-model. Every Markdown file under `knowledge/` is one concept; together they form a queryable knowledge graph, derived from this repository's code and docs.

# Services

* [Documentation site](services/documentation-site.md) - The knowledge website in `knowledge-website/`, built from the bundle, the README, the docs, the changelog and the schema's pages, and published to `https://lmodel.github.io/common-domain-model/`.

# References

* [FINOS Common Domain Model](references/finos-common-domain-model.md) - The Common Domain Model (CDM) that FINOS publishes for financial products, trades and their lifecycle events, held here at release 8.0.0-dev.13 from FINOS's master branch under the Community Specification License 1.0.

# Datasets

* [The CDM LinkML schema](datasets/common-domain-model-linkml-schema.md) - The LinkML schema of the CDM: one module per Rosetta namespace under `.linkml/src/common_domain_model/schema/`, with every type, choice, enumeration and type alias, written by `scripts/rosetta_to_linkml.py` and never edited by hand.
* [The CDM's Rosetta model](datasets/rosetta-model.md) - FINOS's Rosetta files under `rosetta-source/src/main/rosetta/`: the CDM's types, choices, enumerations, type aliases, conditions and functions, which the converter reads.
* [The FpML code lists](datasets/fpml-code-lists.md) - The FpML coding schemes under `rosetta-source/src/main/resources/codelist/json/`, which the CDM's code-list type aliases name and the schema writes as enumerations of their codes.
* [FINOS's tree](datasets/finos-tree.md) - Every file of FINOS's CDM release, unchanged at the repository's root: the Rosetta model, its resources and samples, the Java build, FINOS's documentation site in `website/` and its governance files.
* [The upstream pin and tree list](datasets/upstream-pin.md) - `.linkml/upstream/pin.yaml`, which names the FINOS release the tree and the schema hold, and `.linkml/tests/upstream_tree.tsv`, which lists that release's files by git object hash.
* [The adapt copy](datasets/adapt-copy.md) - `.lokf/common-domain-model.yaml`, the copy of the schema that `just lokf-adapt` writes for a knowledge bundle to import beside LOKF's schema, with `LegalEntity` and `Party` re-rooted on Concept and thirteen keys renamed with a `cdm_` prefix.
* [Example data](datasets/example-data.md) - The examples and counter-examples under `.linkml/tests/data/`, named after the class they hold, which `tests/test_data.py` holds to the committed JSON Schema and the generated dataclasses.
* [FINOS's CDM documents](datasets/finos-sample-documents.md) - The CDM documents Rune wrote in FINOS's tree, from its FpML ingest and its function tests, which `tests/test_finos_samples.py` reads with the committed JSON Schema, and the list of those whose shape the schema refuses.
* [Neighbour copies](datasets/neighbour-copies.md) - The released adapt copies of other lmodel schemas under `.linkml/tests/neighbours/`, pinned by checksum, and `tests/shared_names.json`, which lists the names this copy shares with each.
* [Generated artefacts](datasets/generated-artefacts.md) - What the LinkML generators write from the schema: the JSON Schema, OWL, SHACL, ShEx, SQL, GraphQL, protobuf, TypeScript and JSON-LD under `.linkml/project/`, the Python dataclasses and Pydantic models, and the merged schema in `.linkml/docs/schema/`.

# Explanations

* [The fork's layout](explanations/fork-layout.md) - Why FINOS's tree sits unchanged at the root and this project sits beside it: the LinkML project in `.linkml/`, the knowledge bundle in `.lokf/`, the site in `knowledge-website/`, and the `linkml_schema` and `knowledge_bundle` doorways.
* [What each Rosetta construct becomes](explanations/rosetta-to-linkml.md) - How the converter writes the CDM in LinkML: a namespace as a module, a type as a class, a choice as a class that holds exactly one option, an enumeration keyed by display name, a code-list alias as an enumeration, and conditions as class expressions or rules.
* [What LinkML cannot state](explanations/what-linkml-cannot-state.md) - The CDM conditions and constructs the schema does not state: paths into another type, comparisons of two attributes, list conditions, `<>`, boolean equality, strict decimal bounds, function calls, metadata, subtypes in place of a parent and one meaning per attribute name.
* [Reading a CDM document](explanations/reading-a-cdm-document.md) - How a CDM document that Rune wrote, with its `@type`, `@key`, `@ref` and `@data` keys, is put in the form the schema states, so that the generated JSON Schema can judge it.
* [Keys shared with LOKF](explanations/keys-shared-with-lokf.md) - Why thirteen CDM attribute names, such as `name`, `description` and `version`, are top-level slots in `common_domain_model_keys.yaml`: so that `lokf adapt` renames them in the copy, and a concept's own description keeps LOKF's IRI.
* [What is left out](explanations/what-is-left-out.md) - What the schema does not carry from FINOS's tree: the synonym mappings FINOS moved out before 8.0, the guessed SSSOM sets this fork used to carry, the namespaces that hold only functions, and the text of FpML's codes and of the documents the CDM cites.

# Glossary

* [Rosetta](glossary/rosetta.md) - The language the CDM is written in: types, choices, enumerations, type aliases, conditions and functions, which FINOS's build turns into Java and which this project's converter turns into LinkML.
* [Choice type](glossary/choice-type.md) - A Rosetta `choice`, such as `Asset` or `Payout`, which holds exactly one of its options; the schema writes it as a class with one attribute per option and an `exactly_one_of` over them.
* [Rosetta metadata](glossary/rosetta-metadata.md) - A Rosetta `[metadata ...]` annotation, such as `key`, `reference` or `scheme`, which lets a value be given by reference or carry its scheme; the schema records it as the annotation `rosetta_metadata`.
* [Display name](glossary/display-name.md) - The `displayName` a CDM enumeration value may carry, such as `ACT/360` for `ACT_360`, which Rune writes in JSON and which the schema uses as the value's key.
* [Adapt copy](glossary/adapt-copy.md) - The copy of a LinkML schema that `lokf adapt` writes for a knowledge bundle to import beside LOKF's schema, with chosen classes re-rooted on Concept and clashing keys renamed.

# Playbooks

* [Regenerate and test](playbooks/regenerate-and-test.md) - How to rebuild the schema and everything written from it after a change: `just gen-linkml`, `just gen-project`, `just gen-doc` and `just lokf-adapt` from `.linkml/`, then `just lint` and `just test`.
* [Take a new FINOS release](playbooks/take-a-new-finos-release.md) - How to move the fork to a later CDM release from FINOS's master branch: merge the tag, rewrite the tree list, move the pin and regenerate, then merge with a merge commit.
* [Release](playbooks/release.md) - How a release is cut: Conventional Commits on `master`, the `## [Unreleased]` changelog section, semantic-release behind the `release` Environment, and the knowledge release that attaches the adapt copy and the bundle.
* [Knowledge sources](playbooks/knowledge-sources.md) - The map of where this bundle's knowledge comes from: the schema project in `.linkml/`, the workflows, the site, and FINOS's Rosetta model and resources, with the classes each yields and how to re-check it.

# Policies

* [AI covenant](policies/ai-covenant.md) - The rules for AI-assisted contributions: the contributor owns the work, FINOS's files stay FINOS's, the schema is written by the converter, a condition is stated only as the CDM states it, and no mapping is guessed.
* [Licence and attribution](policies/license-and-attribution.md) - Which licence applies where: the schema project under Apache 2.0, FINOS's files under the Community Specification License 1.0, and the CDM's descriptions in the schema carried with the attribution that licence asks for.
* [Security policy](policies/security-policy.md) - How to report a vulnerability, what this repository releases, what executes here and what holds each surface, as `.github/SECURITY.md` states.

# Workflows

* [Build and test (main.yaml)](workflows/main.md) - The workflow that lints the schema, runs the tests on Python 3.10 to 3.14 and checks the adapt copy, on every pull request and push to `master`.
* [Lint and docs (lint-and-docs.yaml)](workflows/lint-and-docs.md) - The checks of this project's shell scripts, workflows and prose: ShellCheck, actionlint, the governance files' word budgets, markdownlint, lychee and codespell, never over FINOS's files.
* [Upstream watch (upstream-watch.yaml)](workflows/upstream-watch.md) - The weekly check that `.linkml/scripts/check_upstream_release.py` runs: a drifted copy, a moved tag or a new FINOS release from master fails the run and opens or updates an issue.
* [Semantic release (semantic-release.yml)](workflows/semantic-release.md) - The release job: it previews every pull request with a dry run, and on a push to `master` promotes the changelog, tags the release and dispatches the knowledge release.
* [Knowledge librarian (knowledge-librarian.yaml)](workflows/knowledge-librarian.md) - The weekly run of the librarian agent, which opens a review pull request with whatever changed in the bundle, inert until `KNOWLEDGE_LIBRARIAN_ENABLED` is `true`.
* [Knowledge registrar (knowledge-registrar.yaml)](workflows/knowledge-registrar.md) - The validation of the bundle's records on every change to `.lokf/` and weekly: `lokf validate --check-refs`, the conventions script, and the provenance check of a person's events.
* [Knowledge release (knowledge-release.yaml)](workflows/knowledge-release.md) - The job that attaches the bundle, the Microsoft 365 skill zips and the adapt copy to a GitHub release, each with its checksum.
* [Knowledge sync (knowledge-sync.yaml)](workflows/knowledge-sync.md) - The weekly job that keeps the sidecar's copies and the skills pin at the newest Knowledge Trust Ladder release, in one pull request.
* [Knowledge website (knowledge-website.yaml)](workflows/knowledge-website.md) - The workflow that builds the site in `knowledge-website/` on every change and weekly, and publishes the default branch's build once `KNOWLEDGE_WEBSITE_ENABLED` is `true`.
