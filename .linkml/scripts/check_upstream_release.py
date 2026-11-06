#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = []
# ///
"""Check FINOS's tree in this repository against FINOS's releases.

The schema models the FINOS Common Domain Model at one release on FINOS's master
branch, which upstream/pin.yaml names by tag and commit. This fork holds FINOS's
tree at that tag, and tests/upstream_tree.tsv lists every file with its git
object hash. Three things can change:

- this repository's copy of a file drifts from the pin;
- the pinned tag moves to another commit;
- FINOS releases from master again, changing a file the schema or its tests read,
  or the licence.

This script compares every local file with the list offline. It asks the GitHub API
for the tag, the releases and the newest release's tree, so nothing is downloaded
but listings.

It prints a Markdown report, writes it to ``--report`` when given, and exits 0 when
nothing needs a person's attention. It exits 1 when one of the three happened, or a
check could not finish.

Set ``GITHUB_TOKEN`` to raise the API rate limit; it is sent to api.github.com alone
and never on to a redirect. Usage::

    python scripts/check_upstream_release.py [--report FILE]
"""

from __future__ import annotations

import argparse
import hashlib
import re
import http.client
import json
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TREE = ROOT.parent
MANIFEST = ROOT / "tests" / "upstream_tree.tsv"
PIN = ROOT / "upstream" / "pin.yaml"
API_ORIGIN = "https://api.github.com"
API = f"{API_ORIGIN}/repos/finos/common-domain-model"
USER_AGENT = "lmodel-common-domain-model-upstream-check"
# The most one answer may hold. A tree listing of FINOS's repository is under a
# megabyte; a larger answer is refused.
MAX_BYTES = 5 * 1024 * 1024
# FINOS releases from several branches; the fork follows master's.
BRANCH = "master"

# What the schema and its tests read, and the licence files.
READ_FOLDERS = (
    "rosetta-source/src/main/rosetta/",
    "rosetta-source/src/main/resources/codelist/json/",
    "rosetta-source/src/main/resources/ingest/output/",
    "rosetta-source/src/main/resources/functions/",
)
READ_FILES: set[str] = set()
LICENCES = {"LICENSE.md", "NOTICE.md"}


def read_pin() -> dict[str, str]:
    """The edition, tag and commit upstream/pin.yaml names, read without a YAML library."""
    found = {}
    for line in PIN.read_text(encoding="utf-8").splitlines():
        m = re.fullmatch(r'(edition|tag|commit|date):\s*"?([^"#]+?)"?\s*', line)
        if m:
            found[m.group(1)] = m.group(2)
    return found


PINNED = read_pin()
PINNED_EDITION = PINNED["edition"]
PINNED_TAG = PINNED["tag"]
PINNED_COMMIT = PINNED["commit"]


class _HttpsApiOnly(urllib.request.HTTPRedirectHandler):
    """Follows a redirect only to another https address of the GitHub API, so a
    read never moves to plain http or to another host."""

    def redirect_request(self, req, fp, code, msg, headers, newurl):
        if not newurl.startswith(API_ORIGIN + "/"):
            raise urllib.error.HTTPError(
                newurl, code, f"refused a redirect off {API_ORIGIN}", headers, fp
            )
        return super().redirect_request(req, fp, code, msg, headers, newurl)


_OPENER = urllib.request.build_opener(_HttpsApiOnly)


def _get(url: str) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    req.add_header("Accept", "application/vnd.github+json")
    token = os.environ.get("GITHUB_TOKEN")
    if token:
        # urllib copies ordinary headers onto a redirect, so the token goes in an
        # unredirected one and reaches api.github.com alone.
        req.add_unredirected_header("Authorization", f"Bearer {token}")
    with _OPENER.open(req, timeout=60) as resp:
        data = resp.read(MAX_BYTES + 1)
    if len(data) > MAX_BYTES:
        raise ValueError(f"the answer from {url} is over {MAX_BYTES} bytes")
    return data


def _code(text: object) -> str:
    """Text a server chose, such as a file name or an error message, as a code span,
    so it cannot mention a person or add a link in the issue."""
    return "`" + str(text).replace("`", "'") + "`"


def blob_sha(path: Path) -> str:
    """The git object hash of a file, as the GitHub API reports it."""
    data = path.read_bytes()
    return hashlib.sha1(b"blob %d\0" % len(data) + data).hexdigest()


def pins() -> dict[str, str]:
    """Each file of the pinned commit, with its git object hash."""
    found = {}
    for line in MANIFEST.read_text(encoding="utf-8").splitlines():
        sha, path = line.split("\t", 1)
        # A path is read under FINOS's tree alone, so one that climbs out of it, or
        # starts at the root, is refused rather than followed.
        if path.startswith("/") or ".." in path.split("/"):
            raise ValueError(f"a manifest path outside FINOS's tree: {path}")
        found[path] = sha
    return found


def _is_read(path: str) -> bool:
    return path in READ_FILES or path.startswith(READ_FOLDERS)


def check_copy() -> tuple[list[str], bool]:
    """Report each pinned file that differs here or is gone, offline."""
    pinned = pins()
    differing = sorted(
        path
        for path, sha in pinned.items()
        if not (TREE / path).is_file() or blob_sha(TREE / path) != sha
    )
    report = [
        f"- {len(pinned) - len(differing)} of {len(pinned)} of FINOS's files here match the pin."
    ]
    if differing:
        report.append(
            f"- **{len(differing)} file(s) differ from the pin:** "
            + ", ".join(_code(p) for p in differing)
            + "."
        )
    return report, bool(differing)


def _tree(ref: str) -> dict[str, str]:
    """Each file of FINOS's repository at a ref, with its git object hash."""
    answer = json.loads(_get(f"{API}/git/trees/{ref}?recursive=1"))
    if answer.get("truncated"):
        raise OSError(f"the tree at {ref} is too large for one listing")
    return {e["path"]: e["sha"] for e in answer["tree"] if e["type"] == "blob"}


def check_tag() -> tuple[list[str], bool]:
    """Report the pinned tag naming another commit than the pin."""
    answer = json.loads(_get(f"{API}/git/ref/tags/{PINNED_TAG}"))
    sha = answer["object"]["sha"]
    report = [f"- Pinned release: {PINNED_EDITION}, tag `{PINNED_TAG}` at `{PINNED_COMMIT[:12]}`."]
    if sha != PINNED_COMMIT:
        report.append(
            f"- **The tag now names {_code(sha[:12])}.** Find out why before trusting it."
        )
        return report, True
    return report, False


def check_releases() -> tuple[list[str], bool]:
    """Report a newer release from master, and what it changes that the schema reads."""
    answer = json.loads(_get(f"{API}/releases?per_page=30"))
    ours = [r for r in answer if r.get("target_commitish") == BRANCH and not r.get("draft")]
    if not ours:
        return [f"- FINOS's last 30 releases hold none from {BRANCH}."], False
    newest = max(ours, key=lambda r: r["published_at"])
    tag = newest["tag_name"]
    if tag == PINNED_TAG:
        return [f"- FINOS's newest release from {BRANCH} is the pin."], False
    report = [f"- **FINOS releases {_code(tag)} from {BRANCH}.**"]
    tree = _tree(tag)
    pinned = pins()
    changed = sorted(
        p for p, sha in pinned.items() if _is_read(p) and p in tree and tree[p] != sha
    )
    dropped = sorted(p for p in pinned if _is_read(p) and p not in tree)
    added = sorted(p for p in tree if _is_read(p) and p not in pinned)
    licence = sorted(p for p in LICENCES if tree.get(p) != pinned.get(p))
    for label, paths in (("changes", changed), ("drops", dropped), ("adds", added)):
        if paths:
            shown = ", ".join(_code(p) for p in paths[:20])
            more = f" and {len(paths) - 20} more" if len(paths) > 20 else ""
            report.append(
                f"- It {label} {len(paths)} file(s) the schema or its tests read: {shown}{more}."
            )
    if licence:
        report.append(
            "- **It changes the licence files:** "
            + ", ".join(_code(p) for p in licence)
            + ". Read them before merging."
        )
    report.append(
        f"- Merge the tag into a branch, run `just gen-linkml` and the tests, and move "
        "the pins in `upstream/pin.yaml` and `tests/upstream_tree.tsv`."
    )
    return report, True


# Each check, by the name the report gives it when it cannot finish.
CHECKS = (("copy", check_copy), ("tag", check_tag), ("releases", check_releases))


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument(
        "--report", type=Path, help="Also write the Markdown report to this file"
    )
    args = parser.parse_args(argv)
    lines, attention = [], False
    for label, check in CHECKS:
        try:
            found, needs = check()
        # OSError covers a refused or failed fetch and a timeout, and HTTPException a
        # connection cut off mid-answer. ValueError covers an answer that is not JSON
        # or UTF-8 or is too large, and LookupError and TypeError one of another shape
        # than the API documents.
        except (
            OSError,
            http.client.HTTPException,
            ValueError,
            LookupError,
            TypeError,
        ) as err:
            found = [f"- **The {label} check could not finish: {_code(err)}.**"]
            needs = True
        lines += found
        attention = attention or needs
    text = "\n".join(lines) + "\n"
    print(text, end="")
    if args.report:
        args.report.write_text(text, encoding="utf-8")
    return 1 if attention else 0


if __name__ == "__main__":
    sys.exit(main())
