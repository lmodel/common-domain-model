"""Holds FINOS's tree beside .linkml/ to the pinned release, byte for byte."""

import hashlib
import subprocess
from pathlib import Path

import yaml

ROOT = Path(__file__).parent.parent
TREE = ROOT.parent
MANIFEST = Path(__file__).parent / "upstream_tree.tsv"
PIN = ROOT / "upstream" / "pin.yaml"


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
        if not (TREE / p).is_file() or blob_sha(TREE / p) != sha
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
        "knowledge-website/",
        "knowledge_bundle",
        "linkml_schema",
        "llms.txt",
        ".releaserc.json",
    )
    assert all(p.startswith(allowed) for p in added), [
        p for p in added if not p.startswith(allowed)
    ]
