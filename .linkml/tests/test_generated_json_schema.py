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
    """gen-json-schema does not pass a class expression to a subclass, so the
    converter states each ancestor's class expression again: Measure keeps Schedule's."""
    measure = schema_yaml()["classes"]["Measure"]
    assert any(e["description"].startswith("From Schedule.") for e in measure["all_of"])
    expressions = [e for e in schema()["$defs"]["Measure"]["allOf"] if "if" not in e]
    assert len(expressions) == len(measure["all_of"])


def test_an_inherited_rule_is_applied_once():
    """gen-json-schema applies an ancestor's rules to a subclass itself, so the
    converter does not restate them: Offset carries Period's DayPeriod rule once,
    beside its own DayType rule."""
    datetime = yaml.safe_load((SCHEMA.parent / "cdm_base_datetime.yaml").read_text())
    offset = datetime["classes"]["Offset"]
    assert offset["is_a"] == "Period"
    own = offset.get("rules", [])
    assert own and not any(r["description"].startswith("From Period.") for r in own)
    period_rules = datetime["classes"]["Period"]["rules"]
    assert len(period_rules) == 1
    rendered = schema()["$defs"]["Offset"]
    conditionals = [e for e in rendered.get("allOf", []) if "if" in e]
    if "if" in rendered:
        conditionals.append(rendered)
    assert len(conditionals) == len(period_rules) + len(own)


# How gen-json-schema 1.12.1 renders a none_of, which is how the converter states a
# Rosetta `a <> X`: valid when a is absent or differs from X, invalid when it equals X.
# `Bare` shows why the converter always carries value_presence on the negated
# condition: without it, a none_of that the enclosing expression does not require
# denies an instance in which the slot is absent, since the inner condition holds
# vacuously. A change in the generator shows up here before it reaches the schema.
NEGATION = """
id: https://example.org/t
name: t
prefixes: {linkml: https://w3id.org/linkml/, t: https://example.org/t/}
default_prefix: t
default_range: string
imports: [linkml:types]
classes:
  Top:
    attributes: {a: {}, b: {}}
    none_of:
      - slot_conditions: {a: {equals_string: X, value_presence: PRESENT}}
  Ruled:
    attributes: {a: {}, b: {}}
    rules:
      - preconditions: {slot_conditions: {b: {value_presence: PRESENT}}}
        postconditions:
          none_of: [{slot_conditions: {a: {equals_string: X, value_presence: PRESENT}}}]
  Nested:
    attributes: {a: {}, b: {}}
    all_of:
      - none_of: [{slot_conditions: {a: {equals_string: X, value_presence: PRESENT}}}]
  InOr:
    attributes: {a: {}, b: {}}
    all_of:
      - any_of:
          - none_of: [{slot_conditions: {a: {equals_string: X, value_presence: PRESENT}}}]
          - slot_conditions: {b: {value_presence: PRESENT}}
  Bare:
    attributes: {a: {}, b: {}}
    all_of:
      - none_of: [{slot_conditions: {a: {equals_string: X}}}]
"""
INSTANCES = ({}, {"a": "X"}, {"a": "Y"}, {"b": "z"}, {"a": "X", "b": "z"})
VERDICTS = {
    "Top": [True, False, True, True, False],
    "Ruled": [True, True, True, True, False],
    "Nested": [True, False, True, True, False],
    "InOr": [True, False, True, True, True],
    "Bare": [False, False, True, False, False],
}


def test_a_none_of_denies_a_present_equal_value_only():
    generated = json.loads(JsonSchemaGenerator(NEGATION, top_class="Top").serialize())
    for cls, expected in VERDICTS.items():
        s = {"$schema": generated["$schema"], "$defs": generated["$defs"]}
        s["$ref"] = f"#/$defs/{cls}"
        validator = jsonschema.validators.validator_for(s)(s)
        assert [validator.is_valid(i) for i in INSTANCES] == expected, cls
