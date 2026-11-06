"""Holds each example to the committed JSON Schema and the generated dataclasses."""

import json
from functools import cache
from pathlib import Path

import jsonschema
import pytest
import yaml
from linkml_runtime.loaders import yaml_loader

import common_domain_model.datamodel.common_domain_model as datamodel

ROOT = Path(__file__).parent.parent
DATA = Path(__file__).parent / "data"
VALID = sorted((DATA / "valid").glob("*.yaml"))
INVALID = sorted((DATA / "invalid").glob("*.yaml"))
JSON_SCHEMA = ROOT / "project" / "jsonschema" / "common_domain_model.schema.json"

# The classes a knowledge-bundle concept may name as its type: the roots of
# `just lokf-adapt` in project.justfile.
ROOTS = ("LegalEntity", "Party")


@cache
def schema() -> dict:
    return json.loads(JSON_SCHEMA.read_text(encoding="utf-8"))


@cache
def validator(cls: str):
    s = dict(schema())
    s["$ref"] = f"#/$defs/{cls}"
    return jsonschema.validators.validator_for(s)(s)


def pointers(error) -> set[str]:
    """Where an error, or any error inside it, sits, as JSON pointers."""
    out = {"/" + "/".join(str(p) for p in error.absolute_path)}
    for inner in error.context or []:
        out |= pointers(inner)
    return out


@pytest.mark.parametrize("path", VALID, ids=lambda p: p.name)
def test_valid_example_loads(path):
    cls = getattr(datamodel, path.stem.split("-")[0])
    assert yaml_loader.load(str(path), target_class=cls)


@pytest.mark.parametrize("path", VALID, ids=lambda p: p.name)
def test_valid_example_validates(path):
    errors = list(validator(path.stem.split("-")[0]).iter_errors(yaml.safe_load(path.read_text())))
    assert not errors, [e.message for e in errors]


@pytest.mark.parametrize("path", INVALID, ids=lambda p: p.name)
def test_counter_example_fails_where_it_says(path):
    """The first line names the JSON pointer of the failure, as `# Fails at: /key`."""
    text = path.read_text()
    first = text.splitlines()[0]
    assert first.startswith("# Fails at: "), f"{path.name}: the first line names where it fails"
    expected = first.removeprefix("# Fails at: ").strip()
    errors = list(validator(path.stem.split("-")[0]).iter_errors(yaml.safe_load(text)))
    assert errors, f"{path.name} validates"
    found = set().union(*(pointers(e) for e in errors))
    assert expected in found, found


def test_every_root_has_an_example():
    named = {p.stem.split("-")[0] for p in VALID}
    assert set(ROOTS) <= named
