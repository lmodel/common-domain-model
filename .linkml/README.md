<a href="https://github.com/linkml/linkml-project-copier"><img src="https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-grayscale-inverted-border-teal.json" alt="Copier Badge" style="max-width:100%;"/></a>

# common-domain-model

FINOS Common Domain Model (LinkML)

> **Only want to ask?** Install `ktl-docent` into any agent you use, by a route from [the install page](https://w3id.org/ktl/docs/install/), and ask it about this project. It answers from the bundle and says how far each answer has been checked.
>
> **Agents:** if `.lokf/knowledge/index.md` exists, read it first. `llms.txt` says how to weigh it.

## Documentation Website

[https://lmodel.github.io/common-domain-model](https://lmodel.github.io/common-domain-model)

## What it models

The schema models the [Common Domain Model](https://cdm.finos.org/) (CDM) that FINOS publishes for financial products, trades and their lifecycle events, at release 8.0.0-dev.13, the newest on FINOS's master branch. [scripts/rosetta_to_linkml.py](scripts/rosetta_to_linkml.py) writes it from the CDM's Rosetta files: every type, choice, enumeration and type alias, one module per Rosetta namespace, with the conditions LinkML can state. [docs/about.md](docs/about.md) says what each Rosetta construct becomes and what LinkML cannot state.

This repository is a fork of [finos/common-domain-model](https://github.com/finos/common-domain-model). FINOS's tree sits unchanged at the repository's root, and this project sits beside it, in this folder, `.lokf/` and `knowledge-website/`. [tests/upstream_tree.tsv](tests/upstream_tree.tsv) pins every file of the release, and a weekly workflow opens an issue when FINOS releases from master again.

The attributes and values keep the CDM's names, so the JSON Schema can check a CDM document's shape once [tests/rune_json.py](tests/rune_json.py) has taken out the keys Rune adds for metadata. `tests/test_finos_samples.py` checks the CDM documents in FINOS's tree that way.

## Mappings

* **FpML coding schemes**: each code-list enumeration names its scheme in `enum_uri` and the version read in `see_also`, and its values are the scheme's codes, as the CDM's code lists give them. `tests/test_converter.py` checks them.

## Repository Structure

* [docs/](docs/): the website's own pages
* [project/](project/): generated project files (do not edit them)
* [scripts/](scripts/): the converter and the upstream watch
* [src/common_domain_model/schema/](src/common_domain_model/schema): the LinkML schema, which the converter writes
* [src/common_domain_model/datamodel/](src/common_domain_model/datamodel): the generated Python datamodel
* [tests/](tests/): Python tests, with example data in [data/](tests/data)
* [upstream/pin.yaml](upstream/pin.yaml): the FINOS release the tree and the schema hold

## Developer Tools

Run `just` from this folder to list the project's [just](https://github.com/casey/just/) recipes. `just gen-linkml` rewrites the schema from FINOS's Rosetta files.

## Knowledge Trust Ladder (KTL)

`.lokf/` holds this project's [KTL](https://w3id.org/ktl/) sidecar. Its domain schema, `.lokf/schema/common-domain-model.yaml`, is the copy `just lokf-adapt` writes from `src/common_domain_model/schema/common_domain_model.yaml`, and `just lokf-adapt-check` says when it is stale. Edit the source, never the copy. A release carries the copy as `schema-<tag>-common-domain-model.yaml`.

In Obsidian, add these to the *Known LOKF types* setting of the KTL Registrar and KTL Curator plugins:

```text
LegalEntity, Party
```

The copy renames the thirteen keys the CDM shares with LOKF, such as `name`, `description` and `version`, with a `cdm_` prefix, keeping their IRIs: a concept of type `LegalEntity` writes its name as `cdm_name`. The CDM's names are its own, so the copy shares some with other lmodel copies: the classes `Account`, `Address`, `Agreement`, `Composite`, `Observable`, `Observation`, `Party`, `Resource` and `TelephoneNumber` with gist, oscal or uco, and keys with several more, which `tests/shared_names.json` lists. Import it beside those copies only once `lokf adapt` can keep them apart.

## Credits

This project uses the template [linkml-project-copier](https://github.com/linkml/linkml-project-copier) published under [10.5281/zenodo.15163584](https://doi.org/10.5281/zenodo.15163584).

## License

The schema project is under the [Apache License 2.0](LICENSE), and the bundle under CC BY 4.0.

The CDM is under the [Community Specification License 1.0](../LICENSE.md), and the schema carries its descriptions with the attribution that licence asks for. [NOTICE](NOTICE) says which applies where. This project is not a FINOS project, and FINOS does not endorse it.
