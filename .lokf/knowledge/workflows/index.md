# Workflows

* [Build and test (main.yaml)](main.md) - The workflow that lints the schema, runs the tests on Python 3.10 to 3.14 and checks the adapt copy, on every pull request and push to `master`.
* [Lint and docs (lint-and-docs.yaml)](lint-and-docs.md) - The checks of this project's shell scripts, workflows and prose: ShellCheck, actionlint, the governance files' word budgets, markdownlint, lychee and codespell, never over FINOS's files.
* [Upstream watch (upstream-watch.yaml)](upstream-watch.md) - The weekly check that `.linkml/scripts/check_upstream_release.py` runs: a drifted copy, a moved tag or a new FINOS release from master fails the run and opens or updates an issue.
* [Semantic release (semantic-release.yml)](semantic-release.md) - The release job: it previews every pull request with a dry run, and on a push to `master` promotes the changelog, tags the release and dispatches the knowledge release.
* [Knowledge librarian (knowledge-librarian.yaml)](knowledge-librarian.md) - The weekly run of the librarian agent, which opens a review pull request with whatever changed in the bundle, inert until `KNOWLEDGE_LIBRARIAN_ENABLED` is `true`.
* [Knowledge registrar (knowledge-registrar.yaml)](knowledge-registrar.md) - The validation of the bundle's records on every change to `.lokf/` and weekly: `lokf validate --check-refs`, the conventions script, and the provenance check of a person's events.
* [Knowledge release (knowledge-release.yaml)](knowledge-release.md) - The job that attaches the bundle, the Microsoft 365 skill zips and the adapt copy to a GitHub release, each with its checksum.
* [Knowledge sync (knowledge-sync.yaml)](knowledge-sync.md) - The weekly job that keeps the sidecar's copies and the skills pin at the newest Knowledge Trust Ladder release, in one pull request.
* [Knowledge website (knowledge-website.yaml)](knowledge-website.md) - The workflow that builds the site in `knowledge-website/` on every change and weekly, and publishes the default branch's build once `KNOWLEDGE_WEBSITE_ENABLED` is `true`.
