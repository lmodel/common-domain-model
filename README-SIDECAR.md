<a href="https://github.com/linkml/linkml-project-copier"><img src="https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-grayscale-inverted-border-teal.json" alt="Copier Badge" style="max-width:100%;"/></a>

# common-domain-model

Common Domain Model - Linked Data Sidecar

## Documentation Website

[https://lmodel.github.io/common-domain-model](https://lmodel.github.io/common-domain-model)

## Repository Structure

* [docs/](docs/) - mkdocs-managed documentation
  * [elements/](docs/elements/) - generated schema documentation
* [examples/](examples/) - Examples of using the schema
* [project/](project/) - project files (these files are auto-generated, do not edit)
* [src/](src/) - source files (edit these)
  * [nist_ai_rmf](src/nist_ai_rmf)
    * [schema/](src/nist_ai_rmf/schema) -- LinkML schema
      (edit this)
    * [datamodel/](src/nist_ai_rmf/datamodel) -- generated
      Python datamodel
* [tests/](tests/) - Python tests
  * [data/](tests/data) - Example data

## Developer Tools

There are several pre-defined command-recipes available.
They are written for the command runner [just](https://github.com/casey/just/). To list all pre-defined commands, run `just` or `just --list`.

## Autogenerate Schema and Mappings

> &#128161; Tip<br>
> See [docs/about.md](./docs/about.md) for status of Linkml sidecar.

Typical developer commands
```bash
just
just clean
just gen-from-rosetta  # auto-generate linkml schema / mappings to GIST, ISO29100, Oscal, SPDX
just gen-project       # Generate Linkml project (runs polygot generators)
just test              # unit valid/invalid tests
just testdoc           # check docs locally
```

## Credits

This project uses the template [linkml-project-copier](https://github.com/linkml/linkml-project-copier).
