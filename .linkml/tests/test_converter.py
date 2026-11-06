"""Holds the schema to FINOS's Rosetta files and the converter to the Rosetta it reads."""

from functools import cache
from pathlib import Path

import pytest
import yaml

import rosetta_to_linkml as conv

ROOT = Path(__file__).parent.parent
SCHEMA_DIR = ROOT / "src" / "common_domain_model" / "schema"


@cache
def built():
    return conv.build()


@cache
def model():
    return conv.read_model()[0]


@cache
def elements() -> dict[str, dict]:
    out = {"classes": {}, "enums": {}, "types": {}}
    for path in SCHEMA_DIR.glob("*.yaml"):
        doc = yaml.safe_load(path.read_text(encoding="utf-8"))
        for kind in out:
            out[kind].update(doc.get(kind) or {})
    return out


def test_the_modules_are_what_rosetta_gives():
    """A Rosetta change, or an edit by hand, without a rerun of the converter fails here."""
    modules, lint, _ = built()
    on_disk = {p.name: p.read_text(encoding="utf-8") for p in SCHEMA_DIR.glob("*.yaml")}
    assert on_disk == modules
    assert (ROOT / ".linkmllint.yaml").read_text(encoding="utf-8") == lint


def test_every_declaration_has_an_element():
    m = model()
    els = elements()
    for d in m.decls.values():
        if d.kind in ("type", "choice"):
            assert d.lname in els["classes"], d.lname
        elif d.kind == "enum":
            assert d.lname in els["enums"], d.lname
        else:
            assert d.lname in els["types"] or d.lname in els["enums"], d.lname
    total = sum(len(v) for v in els.values())
    assert total == len(m.decls)


def test_the_header_names_the_pinned_edition():
    pin = yaml.safe_load((ROOT / "upstream" / "pin.yaml").read_text())
    head = yaml.safe_load((SCHEMA_DIR / "common_domain_model.yaml").read_text())
    assert head["version"] == pin["edition"]
    assert head["source"].endswith(pin["tag"])
    assert head["annotations"]["upstream_commit"] == pin["commit"]


def test_a_shared_name_is_qualified_by_its_namespace():
    """LinkML merges imports into one namespace, so a name two namespaces declare is qualified."""
    els = elements()
    for name in (
        "CsaAdditionalTerminationEvent",
        "IsdaAdditionalTerminationEvent",
        "AssetFloatingRateIndex",
    ):
        assert name in els["classes"], name
        assert els["classes"][name]["aliases"]
    assert "CodelistFloatingRateIndex" in els["enums"]


def test_enum_values_are_written_as_rune_serialises_them():
    """A value with a display name serialises as that name, so the value is keyed by it."""
    pvs = elements()["enums"]["DayCountFractionEnum"]["permissible_values"]
    assert "ACT/360" in pvs and pvs["ACT/360"]["aliases"] == ["ACT_360"]
    assert "ACT_360" not in pvs


def test_an_extended_enum_repeats_its_parents_values():
    m = model()
    extended = [d for d in m.decls.values() if d.kind == "enum" and d.extends]
    for d in extended:
        child = set(elements()["enums"][d.lname]["permissible_values"])
        parent = set(elements()["enums"][d.extends]["permissible_values"])
        assert parent <= child, d.lname


def test_a_code_list_alias_holds_the_code_list():
    """FpMLCodingScheme(domain: ...) checks a code against FINOS's code list, so it is an enum."""
    bc = elements()["enums"]["BusinessCenter"]
    assert bc["enum_uri"] == "http://www.fpml.org/coding-scheme/business-center"
    assert bc["see_also"] == ["http://www.fpml.org/coding-scheme/business-center-9-3"]
    # FpML publishes no IRI for a code, so a value is the code and nothing more.
    assert bc["permissible_values"]["GBLO"] == {}


def test_every_choice_holds_exactly_one_option():
    for d in model().decls.values():
        if d.kind != "choice":
            continue
        cls = elements()["classes"][d.lname]
        exprs = [e for e in cls["all_of"] if "exactly_one_of" in e]
        options = {a.name for a in d.attrs}
        assert any(
            {next(iter(b["slot_conditions"])) for b in e["exactly_one_of"]} == options
            for e in exprs
        ), d.lname


def test_every_condition_is_stated_or_named():
    """Each Rosetta condition is a class expression or rule, or a comment says it is not stated."""
    els = elements()
    for d in model().decls.values():
        if d.kind not in ("type", "choice"):
            continue
        cls = els["classes"][d.lname]
        stated = " ".join(
            e["description"]
            for e in cls.get("all_of", [])
            + cls.get("none_of", [])
            + cls.get("rules", [])
        )
        unstated = " ".join(cls.get("comments", []))
        for c in d.conditions:
            if c.name:
                assert c.name in stated or f"condition {c.name} " in unstated, (
                    d.lname,
                    c.name,
                )


# The translation of each condition shape, read from Rosetta written here.

SAMPLE = """namespace test.sample
version "1"

enum ColourEnum:
    Red
    Green displayName "green"

typeAlias Count: int(min: 0)

type Thing:
    a string (0..1)
    b string (0..1)
    n int (0..1)
    m Count (1..1)
    flag boolean (0..1)
    colour ColourEnum (0..1)

    condition Choose:
        required choice a, b
    condition AtMostOne:
        optional choice a, b
    condition Positive:
        n > 0
    condition PositiveM:
        m > 0
    condition GreenNeedsA:
        if colour = ColourEnum -> Green then a exists else a is absent
    condition Bare:
        if colour = Red then b exists
    condition Path:
        a -> b exists
    condition NotRed:
        colour <> ColourEnum -> Red
    condition NotRedWithA:
        colour <> Red and a exists
    condition NotRedOrA:
        colour <> Red or a exists
    condition RedUnlessA:
        if a exists then colour <> ColourEnum -> Red
    condition Flagged:
        flag = True
    condition Ordered:
        a <= b

type Sub extends Thing:
    c string (0..1)

    condition Exactly:
        one-of
"""


@pytest.fixture
def sample(tmp_path):
    path = tmp_path / "sample.rosetta"
    path.write_text(SAMPLE)
    decls = conv.Parser(path).parse()
    resolver = conv.Resolver(decls)
    for d in decls:
        if d.extends:
            d.extends = resolver.resolve(d, d.extends)
        for a in d.attrs:
            a.type = resolver.resolve(d, a.type)
        if d.kind == "alias" and d.alias_base not in conv.BASIC_TYPES:
            d.alias_base = resolver.resolve(d, d.alias_base)
    m = conv.Model({d.lname: d for d in decls})
    m.resolver = resolver
    return m


def translate(m, type_name, cond_name, owner=None):
    """The statements a condition becomes; one statement is returned on its own."""
    d = m.decls[type_name]
    o = m.decls[owner] if owner else d
    c = next(c for c in o.conditions if c.name == cond_name)
    found = conv.Translator(m, d, o).translate(c)
    return found[0] if len(found) == 1 else found


RED = {
    "slot_conditions": {"colour": {"equals_string": "Red", "value_presence": "PRESENT"}}
}


def test_required_choice_is_exactly_one(sample):
    assert translate(sample, "Thing", "Choose") == (
        "class",
        {"exactly_one_of": [conv.present("a"), conv.present("b")]},
    )


def test_optional_choice_allows_neither(sample):
    where, expr = translate(sample, "Thing", "AtMostOne")
    assert expr["exactly_one_of"][-1] == {
        "all_of": [conv.absent("a"), conv.absent("b")]
    }


def test_a_comparison_on_an_optional_attribute_requires_it(sample):
    """Rune reads `null > 0` as false, so the bound alone would be too lax."""
    assert translate(sample, "Thing", "Positive") == (
        "class",
        {"slot_conditions": {"n": {"minimum_value": 1, "value_presence": "PRESENT"}}},
    )


def test_a_strict_bound_on_a_required_alias_of_int_becomes_inclusive(sample):
    assert translate(sample, "Thing", "PositiveM") == (
        "class",
        {"slot_conditions": {"m": {"minimum_value": 1}}},
    )


def test_if_then_else_is_a_rule_on_the_display_name(sample):
    where, rule = translate(sample, "Thing", "GreenNeedsA")
    assert where == "rule"
    assert rule["preconditions"] == {
        "slot_conditions": {
            "colour": {"equals_string": "green", "value_presence": "PRESENT"}
        }
    }
    assert rule["elseconditions"] == conv.absent("a")


def test_a_bare_enum_value_is_read_against_the_attribute(sample):
    _, rule = translate(sample, "Thing", "Bare")
    assert rule["preconditions"] == RED


def test_a_path_into_another_type_is_not_stated(sample):
    with pytest.raises(conv.Unstated):
        translate(sample, "Thing", "Path")


def test_not_equal_at_class_level_is_the_classes_none_of(sample):
    """`null <> X` is true in Rune, so `a <> X` denies a present value equal to X."""
    assert translate(sample, "Thing", "NotRed") == ("none_of", RED)


def test_not_equal_anded_with_an_atom_splits_into_two_statements(sample):
    assert translate(sample, "Thing", "NotRedWithA") == [
        ("none_of", RED),
        ("class", conv.present("a")),
    ]


def test_not_equal_inside_or_nests_where_it_stands(sample):
    assert translate(sample, "Thing", "NotRedOrA") == (
        "class",
        {"any_of": [{"none_of": [RED]}, conv.present("a")]},
    )


def test_not_equal_inside_a_rule_is_a_nested_none_of(sample):
    _, rule = translate(sample, "Thing", "RedUnlessA")
    assert rule["postconditions"] == {"none_of": [RED]}


def test_equality_with_a_boolean_is_not_stated(sample):
    with pytest.raises(conv.Unstated, match="equality with a boolean"):
        translate(sample, "Thing", "Flagged")


def test_a_comparison_of_two_attributes_is_not_stated(sample):
    with pytest.raises(conv.Unstated, match="comparison of two attributes"):
        translate(sample, "Thing", "Ordered")


def test_one_of_covers_the_stating_types_attributes(sample):
    _, expr = translate(sample, "Sub", "Exactly")
    names = [next(iter(b["slot_conditions"])) for b in expr["exactly_one_of"]]
    assert names == ["a", "b", "n", "m", "flag", "colour", "c"]
