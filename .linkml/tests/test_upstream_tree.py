"""Holds FINOS's tree beside .linkml/ to the pinned release, byte for byte, but for
the files this project replaces, which REPLACED in scripts/check_upstream_release.py
names."""

import hashlib
import subprocess
import sys
from fnmatch import fnmatch
from pathlib import Path, PurePosixPath

import yaml

ROOT = Path(__file__).parent.parent
TREE = ROOT.parent
MANIFEST = Path(__file__).parent / "upstream_tree.tsv"
PIN = ROOT / "upstream" / "pin.yaml"
DEPENDABOT = TREE / ".github" / "dependabot.yml"
FINOS_MANIFESTS = {"npm": ("package.json", "package-lock.json"), "maven": ("pom.xml",)}

sys.path.insert(0, str(ROOT / "scripts"))
from check_upstream_release import REPLACED  # noqa: E402


def manifest() -> dict[str, str]:
    out = {}
    for line in MANIFEST.read_text(encoding="utf-8").splitlines():
        sha, path = line.split("\t", 1)
        out[path] = sha
    return out


def blob_sha(path: Path) -> str:
    data = path.read_bytes()
    return hashlib.sha1(b"blob %d\0" % len(data) + data).hexdigest()


def test_every_finos_file_matches_the_pin():
    differing = [
        p
        for p, sha in manifest().items()
        if p not in REPLACED and (not (TREE / p).is_file() or blob_sha(TREE / p) != sha)
    ]
    assert not differing, differing[:20]


def test_the_manifest_is_the_pinned_commit():
    """Read from git when the clone holds the commit; a shallow clone skips this."""
    pin = yaml.safe_load(PIN.read_text())
    probe = subprocess.run(
        ["git", "-C", str(TREE), "cat-file", "-e", pin["commit"]],
        capture_output=True,
        check=False,
    )
    if probe.returncode != 0:
        return
    listing = subprocess.run(
        ["git", "-C", str(TREE), "ls-tree", "-r", "-z", pin["commit"]],
        capture_output=True,
        check=True,
    ).stdout.split(b"\0")
    expected = {}
    for entry in filter(None, listing):
        meta, path = entry.split(b"\t", 1)
        _, kind, sha = meta.split()
        if kind == b"blob":
            expected[path.decode("utf-8")] = sha.decode()
    assert manifest() == expected


def test_this_project_adds_files_and_changes_none_of_finos():
    """Every tracked file outside .linkml/ is FINOS's, or one this project adds where
    FINOS has none. NOTICE names the added ones."""
    tracked = (
        subprocess.run(
            ["git", "-C", str(TREE), "ls-files", "-z"], capture_output=True, check=True
        )
        .stdout.decode("utf-8")
        .split("\0")
    )
    finos = manifest()
    added = sorted(
        p for p in tracked if p and p not in finos and not p.startswith(".linkml/")
    )
    allowed = (
        ".lokf/",
        ".github/workflows/",
        ".github/scripts/",
        ".github/release/",
        ".github/PULL_REQUEST_TEMPLATE/knowledge-sync.md",
        ".github/SECURITY.md",
        "ktl-website/",
        "knowledge_bundle",
        "linkml_schema",
        "llms.txt",
        ".releaserc.json",
    )
    assert all(p.startswith(allowed) for p in added), [
        p for p in added if not p.startswith(allowed)
    ]


def test_each_replaced_file_is_finos():
    """A file this project replaces is one FINOS's release holds, and is here."""
    for path in REPLACED:
        assert path in manifest(), path
        assert (TREE / path).is_file(), path


def _dependabot_updates():
    return yaml.safe_load(DEPENDABOT.read_text(encoding="utf-8"))["updates"]


def test_dependabot_ignores_every_finos_manifest():
    """Each directory that holds a FINOS manifest is in an entry that ignores every
    dependency, so no Dependabot pull request touches FINOS's tree, and no such entry
    reaches a directory this project's own entries update."""
    for ecosystem, names in FINOS_MANIFESTS.items():
        ignored, ours = [], []
        for entry in _dependabot_updates():
            if entry["package-ecosystem"] != ecosystem:
                continue
            directories = entry.get("directories", [entry.get("directory")])
            everything = {"dependency-name": "*"} in entry.get("ignore", [])
            (ignored if everything else ours).extend(directories)
        for path in manifest():
            if PurePosixPath(path).name in names:
                parent = PurePosixPath(path).parent.as_posix()
                directory = "/" if parent == "." else "/" + parent
                assert any(fnmatch(directory, glob) for glob in ignored), path
        for directory in ours:
            assert not any(fnmatch(directory, glob) for glob in ignored), directory


def test_dependabot_leaves_finos_workflows_alone():
    """The github-actions entry's exclude-paths match each FINOS workflow and none of ours."""
    (entry,) = (
        e for e in _dependabot_updates() if e["package-ecosystem"] == "github-actions"
    )
    finos = set(manifest())
    for workflow in sorted((TREE / ".github" / "workflows").glob("*.y*ml")):
        path = str(workflow.relative_to(TREE))
        excluded = any(fnmatch(path, glob) for glob in entry["exclude-paths"])
        assert excluded == (path in finos), path
