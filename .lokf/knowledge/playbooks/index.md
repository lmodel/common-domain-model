# Playbooks

* [Regenerate and test](regenerate-and-test.md) - How to rebuild the schema and everything written from it after a change: `just gen-linkml`, `just gen-project`, `just gen-doc` and `just lokf-adapt` from `.linkml/`, then `just lint` and `just test`.
* [Take a new FINOS release](take-a-new-finos-release.md) - How to move the fork to a later CDM release from FINOS's master branch: merge the tag, rewrite the tree list, move the pin and regenerate, then merge with a merge commit.
* [Release](release.md) - How a release is cut: Conventional Commits on `master`, the `## [Unreleased]` changelog section, semantic-release behind the `release` Environment, and the knowledge release that attaches the adapt copy and the bundle.
* [Knowledge sources](knowledge-sources.md) - The map of where this bundle's knowledge comes from: the schema project in `.linkml/`, the workflows, the site, and FINOS's Rosetta model and resources, with the classes each yields and how to re-check it.
