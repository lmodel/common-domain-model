"""Checks the upstream watch's decisions against stubbed GitHub API answers.

scripts/check_upstream_release.py asks the GitHub API about
finos/common-domain-model. These tests replace its one network call, `_get`, with
a table of answers, so they run offline.
"""

import importlib.util
import json
import urllib.error
import urllib.request
from pathlib import Path

import pytest

ROOT = Path(__file__).parent.parent
SCRIPT = ROOT / "scripts" / "check_upstream_release.py"
HEAD = "f" * 40


@pytest.fixture
def watch():
    """A fresh copy of the script, so no test sees another's cached answers."""
    spec = importlib.util.spec_from_file_location("watch_under_test", SCRIPT)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def _stub(watch, monkeypatch, tree=None, release=None, tag_sha=None):
    """Answer as the API does: the pinned tag at `tag_sha`, and `release` as the
    newest release from master, holding `tree`."""
    release = release or watch.PINNED_TAG
    tree = watch.pins() if tree is None else tree
    answers = {
        f"{watch.API}/git/ref/tags/{watch.PINNED_TAG}": {
            "object": {"sha": tag_sha or watch.PINNED_COMMIT, "type": "commit"}
        },
        f"{watch.API}/releases?per_page=30": [
            {
                "tag_name": release,
                "target_commitish": "master",
                "published_at": "2026-11-01T00:00:00Z",
            },
            {
                "tag_name": "7.99.0",
                "target_commitish": "7.x.x",
                "published_at": "2026-11-02T00:00:00Z",
            },
        ],
        f"{watch.API}/git/trees/{release}?recursive=1": {
            "tree": [{"path": p, "sha": s, "type": "blob"} for p, s in tree.items()]
        },
    }

    def fake(url):
        return json.dumps(answers[url]).encode()

    monkeypatch.setattr(watch, "_get", fake)


ENUMS = "rosetta-source/src/main/rosetta/base-datetime-enum.rosetta"


def test_nothing_moved(watch, monkeypatch, capsys):
    _stub(watch, monkeypatch)
    assert watch.main([]) == 0
    out = capsys.readouterr().out
    assert "is the pin" in out
    assert "3231 of 3231" in out


def test_a_release_from_another_branch_is_not_ours(watch, monkeypatch, capsys):
    """The stub's 7.x.x release is newer, and still not reported."""
    _stub(watch, monkeypatch)
    assert watch.main([]) == 0
    assert "7.99.0" not in capsys.readouterr().out


@pytest.mark.parametrize(
    ("change", "says"),
    [
        (lambda t: t.update({ENUMS: "a" * 40}), "changes 1 file"),
        (lambda t: t.pop(ENUMS), "drops 1 file"),
        (
            lambda t: t.update(
                {"rosetta-source/src/main/rosetta/new-type.rosetta": "a" * 40}
            ),
            "adds 1 file",
        ),
        (lambda t: t.update({"LICENSE.md": "a" * 40}), "changes the licence"),
        (
            lambda t: t.update({"website/README.md": "a" * 40}),
            "releases `8.0.0-dev.14`",
        ),
    ],
)
def test_a_new_release(watch, monkeypatch, capsys, change, says):
    tree = dict(watch.pins())
    change(tree)
    _stub(watch, monkeypatch, tree=tree, release="8.0.0-dev.14")
    assert watch.main([]) == 1
    assert says in capsys.readouterr().out


def test_a_moved_tag(watch, monkeypatch, capsys):
    _stub(watch, monkeypatch, tag_sha=HEAD)
    assert watch.main([]) == 1
    assert "now names" in capsys.readouterr().out


def test_a_drifted_copy(watch, monkeypatch, capsys):
    pins = dict(watch.pins())
    pins["README.md"] = "a" * 40
    monkeypatch.setattr(watch, "pins", lambda: pins)
    _stub(watch, monkeypatch, tree=pins)
    assert watch.main([]) == 1
    assert "`README.md`" in capsys.readouterr().out


def test_a_failed_fetch_is_reported(watch, monkeypatch, capsys):
    def fail(url):
        raise urllib.error.URLError("no route")

    monkeypatch.setattr(watch, "_get", fail)
    assert watch.main([]) == 1
    assert "could not finish" in capsys.readouterr().out


def test_server_text_is_quoted(watch, monkeypatch, capsys):
    _stub(watch, monkeypatch, release="@someone`")
    assert watch.main([]) == 1
    assert "`@someone'`" in capsys.readouterr().out


def test_the_report_is_written(watch, monkeypatch, tmp_path):
    _stub(watch, monkeypatch)
    report = tmp_path / "report.md"
    assert watch.main(["--report", str(report)]) == 0
    assert "is the pin" in report.read_text(encoding="utf-8")


def test_a_redirect_off_the_api_is_refused(watch):
    """A redirect is followed only to another https address of the GitHub API."""
    handler = watch._HttpsApiOnly()
    req = urllib.request.Request(f"{watch.API}/tags")
    for elsewhere in (
        "http://api.github.com/repos/finos/common-domain-model/tags",
        "https://example.org/tags",
        "https://api.github.com.example.org/tags",
    ):
        with pytest.raises(urllib.error.HTTPError):
            handler.redirect_request(req, None, 302, "Found", {}, elsewhere)
    followed = handler.redirect_request(
        req, None, 302, "Found", {}, f"{watch.API_ORIGIN}/repositories/1/tags"
    )
    assert followed.full_url == f"{watch.API_ORIGIN}/repositories/1/tags"


@pytest.mark.parametrize("path", ["../outside.md", "docs/../../x", "/etc/passwd"])
def test_a_manifest_path_outside_the_tree_is_refused(
    watch, monkeypatch, tmp_path, path
):
    manifest = tmp_path / "upstream_tree.tsv"
    manifest.write_text(f"{'a' * 40}\t{path}\n", encoding="utf-8")
    monkeypatch.setattr(watch, "MANIFEST", manifest)
    with pytest.raises(ValueError):
        watch.pins()
