# Changelog

All notable changes to this project are documented here. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

The `v0.0.0` tag is a baseline, not a release: it marks where versioning starts so the first real release is `0.1.0` rather than `1.0.0`. The schema stays below 1.0.0 until its shape settles, so a breaking change is a minor release.

## [Unreleased]

### Added

- **A schema written from the CDM's own Rosetta files**, at FINOS's release 8.0.0-dev.13: every type, choice, enumeration and type alias, one module per Rosetta namespace, with the conditions LinkML can state. `scripts/rosetta_to_linkml.py` writes it, and `docs/about.md` says what each Rosetta construct becomes and what LinkML cannot state. A `<>` condition is a `none_of`, a comparison on an optional attribute also requires it, as Rune reads an absent value, and an ancestor's rules are left to the generator, which applies them to a subclass itself.
- **The FpML code lists as enumerations**, so a code-list type such as `BusinessCenter` checks its code as Rosetta does. The values are the codes, under the scheme's canonical URI; FpML publishes no IRI for a code, so none is minted. NOTICE carries the FpML Public License notice.
- **A test that reads the CDM documents in FINOS's tree** with the committed JSON Schema, once `tests/rune_json.py` has taken out the keys Rune adds. `tests/sample_departures.yaml` lists the documents whose shape the schema refuses.
- **A weekly watch** of FINOS's releases from master, against a list of every file of the pinned release.
- **`.lokf/schema/common-domain-model.yaml`, the schema's `lokf adapt` copy**, with `LegalEntity` and `Party` as the types a concept may name. The knowledge release attaches it as `schema-<tag>-common-domain-model.yaml`.
- **The repository's Knowledge Trust Ladder (KTL) knowledge bundle and its sidecar automation**, from the KTL v0.61.0 templates with the lokf floor at 0.9.0, and a knowledge website in `knowledge-website/` that replaces the mkdocs site.
- **The governance files**: SECURITY.md, AI_COVENANT.md, NOTICE and the CONTRIBUTING checklist.

### Changed

- **The bundle's schema files sit in `.lokf/schema/`**: `lokf.yaml` and the adapt copy, as KTL's main branch lays them out. The knowledge release workflow and the sidecar preflight carry KTL #325's change to read that folder until a KTL release does, and the next sync replaces them.
- **The schema project moved into the `.linkml/` sidecar**, and FINOS's tree is back to FINOS's files, byte for byte. `linkml_schema` at the root links to the schema's folder.
- **Pin linkml and linkml-runtime at 1.12.1.** PyPI publishing and the docs preview stay off.

### Removed

- **The old converter, its patched generators and its schema.** It wrote functions into comments, read an optional choice as "at least one", and named FpML classes as guessed close mappings.
- **The six SSSOM sets.** The sets to gist, iso29100, oscal and spdx were guessed, the construct set mapped Rosetta names to the same LinkML names, and the FpML set restated what the schema now states in `enum_uri` and its values.

## [0.0.0] - 2026-11-06

### Added

- **The baseline**: this fork's merge of FINOS's tree at release 8.0.0-dev.13, which the `v0.0.0` tag marks.
