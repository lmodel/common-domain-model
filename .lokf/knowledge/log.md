# Change Log

## 2026-11-06

* **Changed**: the adapt copy moved to `.lokf/schema/common-domain-model.yaml`, beside `.lokf/schema/lokf.yaml`.
* **Changed**: the converter now states `<>` as a `none_of`, requires an optional attribute it compares, and leaves an ancestor's rules to the generator; the FpML code lists carry their codes alone, under the FpML Public License.
* **Prose**: reworded 4 concept bodies in plain English. No fact, link, number or frontmatter changed.
* **Added**: [Knowledge sources](playbooks/knowledge-sources.md) and the first concepts of the bundle, derived from the schema project, its workflows, the site and FINOS's Rosetta model, with the map of knowledge sources; the sidecar's two example services are gone.
* **Removal**: the sidecar's placeholder service; the concepts above describe the repository instead.
* **Initialization**: Scaffolded the LOKF bundle for common-domain-model with placeholder
  services. Real concepts to follow.
