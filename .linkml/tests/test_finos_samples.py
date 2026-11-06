"""Reads every CDM document in FINOS's tree with the committed JSON Schema.

FINOS's tree holds about 900 documents that Rune wrote: the trade states and
workflow steps its FpML ingest produces, and the inputs and outputs of its
function tests. tests/rune_json.py puts each in the form this schema states, and
the JSON Schema then reads it.

The test holds the shape of each document: every key is an attribute of the type
at that place, every value has the attribute's type, and every enumerated value
is one of its enumeration's. It does not hold completeness. The ingest writes
partial trades from partial FpML, so many documents leave out a required
attribute or break a condition, and Rune records those as validation failures
rather than refusing the document. tests/sample_departures.yaml lists the
documents whose shape the schema refuses, each with the reason, and the test
fails when that list is wrong either way.
"""

import json
from functools import cache
from pathlib import Path

import jsonschema
import yaml

from rune_json import Normaliser, Schema

ROOT = Path(__file__).parent.parent
TREE = ROOT.parent
RESOURCES = TREE / "rosetta-source" / "src" / "main" / "resources"
FOLDERS = ("ingest/output", "functions")
JSON_SCHEMA = ROOT / "project" / "jsonschema" / "common_domain_model.schema.json"
DEPARTURES = Path(__file__).parent / "sample_departures.yaml"

# What a document must have, as against what it is: these keywords hold
# required attributes, cardinality, choices and conditions.
COMPLETENESS = {
    "required",
    "oneOf",
    "anyOf",
    "allOf",
    "not",
    "if",
    "then",
    "else",
    "const",
    "minimum",
    "maximum",
    "minItems",
    "maxItems",
}


@cache
def schema() -> dict:
    return json.loads(JSON_SCHEMA.read_text(encoding="utf-8"))


def documents() -> list[Path]:
    """Every JSON file that holds one CDM object, named by its @type."""
    out = []
    for folder in FOLDERS:
        for path in sorted((RESOURCES / folder).rglob("*.json")):
            if path.stat().st_size < 3:
                continue
            doc = json.loads(path.read_text(encoding="utf-8"))
            if isinstance(doc, dict) and "@type" in doc:
                out.append(path)
    return out


def leaves(error):
    """The errors that say what is wrong, inside any branch that failed."""
    if not error.context:
        return [error]
    inner = [
        c
        for c in error.context
        if not (c.validator == "type" and c.validator_value == "null")
    ]
    return [leaf for c in inner for leaf in leaves(c)] or [error]


@cache
def shape_errors() -> tuple[dict[str, list[str]], dict[str, int]]:
    """The documents the schema refuses, and what the normaliser could not undo:
    a value of a subtype where its parent is declared, which the JSON Schema
    accepts since it is generated with include_range_class_descendants, and a
    reference to an object the document does not hold."""
    normaliser = Normaliser(Schema(ROOT / "src" / "common_domain_model" / "schema"))
    validators = {}
    found = {}
    findings = {"subtype_cases": 0, "unresolved_references": 0}
    for path in documents():
        root, body, left = normaliser.normalise(
            json.loads(path.read_text(encoding="utf-8"))
        )
        findings["subtype_cases"] += len(left.subtypes)
        findings["unresolved_references"] += len(left.unresolved)
        if root not in validators:
            s = dict(schema())
            s["$ref"] = f"#/$defs/{root}"
            validators[root] = jsonschema.validators.validator_for(s)(s)
        errors = [
            leaf
            for e in validators[root].iter_errors(body)
            for leaf in leaves(e)
            if leaf.validator not in COMPLETENESS
        ]
        if errors:
            found[str(path.relative_to(RESOURCES))] = sorted(
                {
                    "/" + "/".join(map(str, e.absolute_path)) + ": " + e.validator
                    for e in errors
                }
            )
    return found, findings


@cache
def listed() -> dict:
    return yaml.safe_load(DEPARTURES.read_text(encoding="utf-8"))


def test_finos_documents_have_the_shape_the_schema_states():
    expected = listed()["documents"]
    assert set(expected.values()) <= set(listed()["reasons"])
    found, _ = shape_errors()
    assert sorted(found) == sorted(expected), {
        "refused, not listed": sorted(set(found) - set(expected)),
        "listed, now read": sorted(set(expected) - set(found)),
    }


def test_what_the_normaliser_could_not_undo_is_counted():
    """The subtype values and the unresolved references in FINOS's documents, so a
    FINOS release that changes either shows here."""
    _, findings = shape_errors()
    assert findings == listed()["findings"]
    assert findings["subtype_cases"] > 0


def test_the_documents_are_there():
    """A move of FINOS's samples would leave this test reading nothing."""
    assert len(documents()) > 800
