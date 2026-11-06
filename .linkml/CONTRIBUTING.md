# Contributing to common-domain-model

*This file is a checklist, not a design log. Each rule is a line or two that links to where its reasoning lives. `lint-and-docs.yaml` holds it to a word budget.*

## What this project is

A LinkML schema of the Common Domain Model (CDM) that FINOS publishes, in a fork of FINOS's repository. FINOS's tree sits unchanged at the repository's root, and this project sits beside it in `.linkml/`.

| Path | Holds |
| --- | --- |
| `.linkml/src/common_domain_model/schema/` | The LinkML schema, which `.linkml/scripts/rosetta_to_linkml.py` writes from FINOS's Rosetta files. |
| `.linkml/src/common_domain_model/datamodel/`, `.linkml/project/`, `.linkml/docs/schema/` | Artefacts generated from the schema. |
| `.linkml/scripts/check_upstream_release.py` | The weekly comparison with FINOS's releases. |
| `.linkml/upstream/pin.yaml` | The FINOS release the tree and the schema hold. |
| `.linkml/docs/` | The website's own pages. |
| `.linkml/tests/` | Python tests and example data. |
| `.lokf/knowledge/` | This repository's knowledge bundle. |

Everything else is FINOS's.

## Development setup

You need Python 3.10+, [uv](https://docs.astral.sh/uv/) and [just](https://github.com/casey/just).

```bash
git clone https://github.com/lmodel/common-domain-model.git
cd common-domain-model/.linkml
uv sync --group dev
just --list
```

### Agent skills (optional, only for this repo's `.lokf/` bundle)

The bundle is maintained with the Knowledge Trust Ladder (KTL) skills, **installed, never committed**. Continuous integration (CI) installs the librarian skill at run time, pinned to a release. [The install page](https://w3id.org/ktl/docs/install/) lists every route. With npm:

```bash
npx skills add noelmcloughlin/knowledge-trust-ladder --skill ktl-librarian --yes   # derive concepts
npx skills add noelmcloughlin/knowledge-trust-ladder --skill ktl-curator --yes     # confirm them as a person
```

## Before opening a pull request

- **Leave FINOS's files alone.** A change to one goes to [FINOS](https://github.com/finos/common-domain-model). `.linkml/tests/test_upstream_tree.py` holds every file `.linkml/tests/upstream_tree.tsv` lists to its hash.
- **Change the converter, never the schema.** From `.linkml/`, run `just gen-linkml`, `just gen-project`, `just gen-doc` and `just lokf-adapt`, and commit the output. `.linkml/tests/test_converter.py` fails on a module edited by hand.
- **State a condition only as the CDM states it.** One the converter cannot state exactly stays a comment that names it.
- **Guess no mapping.** The schema names the FpML code lists the CDM names, and nothing else.
- **A departure is reported, not hidden.** `.linkml/tests/sample_departures.yaml` lists FINOS's documents whose shape the schema refuses, with the reason. Add to it only with a report to FINOS.
- **Keep names apart.** A host imports this adapt copy beside the Linked Open Knowledge Format (LOKF) schema and the released copies in `.linkml/tests/neighbours/`. `.linkml/tests/test_schema_rules.py` checks this.
- **Run the tests**: `just test` from `.linkml/`. Example data goes in `tests/data/valid/` and `tests/data/invalid/`, named `ClassName-suffix.yaml`; an invalid example's first line, `# Fails at: <pointer>`, names where it fails.
- **Keep the CDM's names.** Classes, attributes and values keep the CDM's spelling, so CDM documents validate. A name two Rosetta namespaces share takes its namespace's last part as a prefix.
- **Run the pre-commit hooks** on what you staged, from the root (`uvx pre-commit run -c .linkml/.pre-commit-config.yaml`).
- **Lock files are part of the change.** CI installs with `uv sync --locked`, so an edit without its `.linkml/uv.lock` (or `.lokf/uv.lock`) fails.
- **Knowledge-bundle changes**: `cd .lokf && just lokf-validate` must pass, and `knowledge-registrar.yaml` runs on any `.lokf/**` change.
- **`lint-and-docs.yaml`** runs ShellCheck, actionlint, markdownlint, lychee and codespell over this project's files, never FINOS's.
- **Actions are pinned to commit hashes**; Dependabot bumps them.
- **The skills pin moves with the sidecar copies.** When moving `TRUST_LADDER_SKILLS_REF` in `.github/workflows/knowledge-librarian.yaml`, copy the other `knowledge-*.yaml` workflows and `.lokf/scripts/` and `.lokf/m365/` from that release's `skills/ktl-sidecar/templates/` in the same pull request.
- **If your change alters behaviour**, add an entry under `## [Unreleased]` in [CHANGELOG.md](CHANGELOG.md).

## Taking a new release from FINOS

The weekly watch opens an issue when FINOS releases from master. On a branch, merge the release's tag, rewrite `.linkml/tests/upstream_tree.tsv` from `git ls-tree -r -z`, move the pin in `.linkml/upstream/pin.yaml`, and run `just gen-linkml`. Merge with a merge commit: a squash loses FINOS's history, and the next merge conflicts on every file.

## Code of conduct

Participation here is covered by the [Contributor Covenant](CODE_OF_CONDUCT.md).

## Using AI tools

Artificial intelligence (AI) assistance is welcome; [AI_COVENANT.md](AI_COVENANT.md) sets the rules, for people and the scheduled `knowledge-librarian` agent alike.

## Reporting issues

Use the [issue tracker](https://github.com/lmodel/common-domain-model/issues) for the schema. A problem in the CDM belongs with [FINOS](https://github.com/finos/common-domain-model/issues).

## Releasing (maintainers)

- Write `## [Unreleased]` in [CHANGELOG.md](CHANGELOG.md) as you go. The release job refuses an empty one (`.github/scripts/changelog-release.mjs check`).
- Type the commit ([Conventional Commits](https://www.conventionalcommits.org/)) for what the change *is*. Only `feat:`, `fix:`, `security:` and a breaking `!` start a release, and FINOS's commits in a merge count too. A pull request that would release must carry a releasing type in its title.
- On merge, [`semantic-release.yml`](../.github/workflows/semantic-release.yml) retitles the section to `## [X.Y.Z] - YYYY-MM-DD`, commits `.linkml/CHANGELOG.md`, tags `vX.Y.Z` and publishes the GitHub Release. Once `KNOWLEDGE_RELEASE_ENABLED` is `true`, it dispatches `.github/workflows/knowledge-release.yaml`, which attaches the schema copy and the bundle when either changed.
- That step runs behind the `release` GitHub Environment. Configure required reviewers on it in Settings → Environments, or every qualifying merge is released unattended.
- Below 1.0.0: the `v0.0.0` baseline tag sits on the merge of FINOS's tree, so FINOS's older commits do not count. `.releaserc.json` maps `breaking: true` to `minor`.
- A branch rule requiring pull requests, status checks or signed commits would reject the release job's own push to `master`, so leave them off. [SECURITY.md](../.github/SECURITY.md) says what holds `master` instead.

## License

By contributing, you agree that your contributions are licensed under the [Apache License 2.0](LICENSE). FINOS's files are under the Community Specification License 1.0; [NOTICE](NOTICE) says what applies where. Update it when you add something from elsewhere.
