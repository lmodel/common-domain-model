"""Checks the JSON Schema this project commits, as a user of it would read it."""

import json
from functools import cache
from pathlib import Path

import jsonschema
import yaml
from linkml.generators.jsonschemagen import JsonSchemaGenerator

ROOT = Path(__file__).parent.parent
COMMITTED = ROOT / "project" / "jsonschema" / "common_domain_model.schema.json"
SCHEMA = ROOT / "src" / "common_domain_model" / "schema" / "common_domain_model.yaml"


@cache
def schema_yaml():
    return yaml.safe_load((SCHEMA.parent / "cdm_base_math.yaml").read_text())


@cache
def schema():
    return json.loads(COMMITTED.read_text(encoding="utf-8"))


def test_the_schema_is_valid_under_the_draft_it_declares():
    jsonschema.validators.validator_for(schema()).check_schema(schema())


def test_the_committed_file_is_the_generators_output():
    """A schema edit without `just gen-project` fails here."""
    settings = yaml.safe_load((ROOT / "generators.yaml").read_text())
    args = settings["generator_args"]["jsonschema"]
    generated = JsonSchemaGenerator(str(SCHEMA), **args).serialize()
    assert json.loads(generated) == schema()


def test_an_inherited_condition_binds_the_subtype():
    """LinkML does not pass a class expression to a subclass in JSON Schema, so the
    converter states each ancestor's condition again: Measure keeps Schedule's."""
    measure = schema_yaml()["classes"]["Measure"]
    assert any(e["description"].startswith("From Schedule.") for e in measure["all_of"])
    assert len(schema()["$defs"]["Measure"]["allOf"]) == len(measure["all_of"])
