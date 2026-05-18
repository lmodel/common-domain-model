#!/usr/bin/env python3
"""Parse Rosetta DSL (.rosetta) files and generate enriched LinkML YAML schema.

Usage:
    python scripts/rosetta_to_linkml.py \
        --rosetta-dir rosetta-source/src/main/rosetta \
        --output-dir src/common_domain_model/schema \
        --codelist-dir rosetta-source/src/main/resources/codelist/json \
        --sssom-out src/common_domain_model/mappings/rosetta_to_linkml.sssom.tsv \
        --ext-sssom-out src/common_domain_model/mappings/common-domain-model-mappings.sssom.tsv \
        --ecosystem-mappings-dir src/common_domain_model/mappings

This script:
1. Parses all *-type.rosetta and *-enum.rosetta files
2. Loads codelist JSONs for enum value meaning URIs
3. Parses synonym files for external system mappings
4. Loads manually-curated SSSOM TSVs (cdm-*.sssom.tsv) for ecosystem alignment
5. Generates modular LinkML YAML schema per Rosetta namespace
6. Applies enrichment: exact_mappings, close/broad/narrow/related_mappings,
   meaning, deprecated, annotations, notes
7. Generates a root common_domain_model.yaml that imports all modules
8. Generates construct-level SSSOM (rosetta_to_linkml.sssom.tsv)
9. Generates external mapping SSSOM (common-domain-model-mappings.sssom.tsv)
"""

from __future__ import annotations

import argparse
import json
import keyword
import re
import sys
import textwrap
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional

# https://github.com/linkml/linkml/pull/3317
import yaml

# Reserved names that conflict with code generation or documentation tools
RESERVED_NAMES = {
    # Python keywords
    *keyword.kwlist,
    # mkdocs reserved names (doc generation creates {name}.md for slots/classes)
    "index",  # mkdocs treats index.md as directory index
}


def safe_slot_name(name: str) -> str:
    """Return a LinkML-safe slot name, appending '_' to reserved names.

    Reserved names include Python keywords and mkdocs doc generation names.
    """
    return name + "_" if name in RESERVED_NAMES else name

# https://github.com/linkml/linkml/pull/3317

# ---------------------------------------------------------------------------
# Data structures
# ---------------------------------------------------------------------------


@dataclass
class DocReference:
    """A structured [docReference ...] annotation."""

    body: str  # ISDA, ICMA, ISO
    corpus: str  # CSA_IM_2018, GMRA, FpML_Coding_Scheme, etc.
    segment_type: str = ""  # schemeLocation, namingConvention, paragraph, section
    segment_value: str = ""  # URI, naming convention name, paragraph number
    clause: str = ""
    name: str = ""
    provision: str = ""


@dataclass
class CodelistInfo:
    """A loaded FpML codelist JSON."""

    canonical_uri: str
    canonical_version_uri: str
    short_name: str
    codes: dict[str, str] = field(default_factory=dict)  # value -> description


@dataclass
class RosettaAttribute:
    name: str
    type_name: str
    cardinality: str  # e.g. "0..1", "1..1", "0..*", "1..*"
    description: str = ""
    metadata: list[str] = field(default_factory=list)  # e.g. ["key", "reference", "scheme"]
    doc_references: list[DocReference] = field(default_factory=list)
    deprecated: bool = False


@dataclass
class RosettaCondition:
    """A parsed condition with name, description, and body expression."""

    name: str
    description: str = ""
    body: str = ""  # raw Rosetta expression text
    kind: str = ""  # required_choice, optional_choice, one_of, if_then, exists, comparison, other


@dataclass
class RosettaFuncParam:
    """A function input or output parameter."""

    name: str
    type_name: str
    cardinality: str = "1..1"
    description: str = ""


@dataclass
class RosettaFunction:
    """A parsed Rosetta func definition."""

    name: str
    namespace: str
    description: str = ""
    inputs: list[RosettaFuncParam] = field(default_factory=list)
    output: Optional[RosettaFuncParam] = None
    is_code_implementation: bool = False  # [codeImplementation] — no body


@dataclass
class RosettaType:
    name: str
    namespace: str
    description: str = ""
    extends: str = ""
    attributes: list[RosettaAttribute] = field(default_factory=list)
    conditions: list[RosettaCondition] = field(default_factory=list)
    metadata: list[str] = field(default_factory=list)  # type-level: "key", "rootType"
    is_root_type: bool = False
    deprecated: bool = False
    doc_references: list[DocReference] = field(default_factory=list)


@dataclass
class RosettaEnumValue:
    name: str
    display_name: str = ""
    description: str = ""


@dataclass
class RosettaEnum:
    name: str
    namespace: str
    description: str = ""
    extends: str = ""
    values: list[RosettaEnumValue] = field(default_factory=list)
    deprecated: bool = False
    doc_references: list[DocReference] = field(default_factory=list)


@dataclass
class RosettaChoice:
    """A Rosetta 'choice' is a union type — exactly one alternative must be selected."""

    name: str
    namespace: str
    description: str = ""
    alternatives: list[RosettaAttribute] = field(default_factory=list)
    metadata: list[str] = field(default_factory=list)


@dataclass
class RosettaTypeAlias:
    name: str
    namespace: str
    base_type: str = "string"
    domain: str = ""


@dataclass
class RosettaModule:
    namespace: str
    description: str = ""
    imports: list[str] = field(default_factory=list)
    types: list[RosettaType] = field(default_factory=list)
    enums: list[RosettaEnum] = field(default_factory=list)
    type_aliases: list[RosettaTypeAlias] = field(default_factory=list)
    choices: list[RosettaChoice] = field(default_factory=list)
    functions: list[RosettaFunction] = field(default_factory=list)
    body_corpus_comments: list[str] = field(default_factory=list)


# ---------------------------------------------------------------------------
# DocReference parser
# ---------------------------------------------------------------------------


def parse_doc_reference_text(text: str) -> Optional[DocReference]:
    """Parse collected [docReference ...] text into a DocReference."""
    text = text.strip()
    if text.startswith("["):
        text = text[1:]
    if text.endswith("]"):
        text = text[:-1]
    text = text.strip()
    if not text.startswith("docReference"):
        return None
    text = text[len("docReference") :].strip()

    # Extract body and corpus (first two tokens before any keyword)
    tokens = text.split(None, 2)
    if len(tokens) < 2:
        return None
    body = tokens[0]
    corpus = tokens[1]
    rest = tokens[2] if len(tokens) > 2 else ""

    dr = DocReference(body=body, corpus=corpus)

    # Parse key-value segments (order matters: first match wins for segment_type)
    for key in ("schemeLocation", "namingConvention", "paragraph", "section"):
        m = re.search(rf'{key}\s+"([^"]*)"', rest)
        if m:
            dr.segment_type = key
            dr.segment_value = m.group(1)
            break

    m = re.search(r'clause\s+"([^"]*)"', rest)
    if m:
        dr.clause = m.group(1)
    m = re.search(r'name\s+"([^"]*)"', rest)
    if m:
        dr.name = m.group(1)
    m = re.search(r'provision\s+"([^"]*)"', rest)
    if m:
        dr.provision = m.group(1)

    return dr


def collect_annotation_text(lines: list[str], start: int) -> tuple[str, int]:
    """Collect the full text of a [...] annotation starting at `start`.

    Handles multi-line annotations (e.g. ICMA provisions).
    Returns (full_text, next_line_index).
    """
    text = lines[start].strip()
    i = start + 1
    # If the annotation doesn't have a closing ], collect continuation lines
    if "]" not in text:
        while i < len(lines):
            cont = lines[i].strip()
            text += " " + cont
            i += 1
            if "]" in cont:
                break
    return text, i


def format_doc_ref_comment(dr: DocReference) -> str:
    """Format a DocReference as a human-readable string for notes."""
    parts = [f"{dr.body} {dr.corpus}"]
    if dr.segment_type and dr.segment_value:
        parts.append(f"{dr.segment_type} \"{dr.segment_value}\"")
    if dr.clause:
        parts.append(f"clause \"{dr.clause}\"")
    if dr.name:
        parts.append(f"name \"{dr.name}\"")
    return " ".join(parts)


# ---------------------------------------------------------------------------
# Condition classification & rule building
# ---------------------------------------------------------------------------


def _classify_condition(body: str) -> str:
    """Classify a Rosetta condition body into a kind."""
    if not body:
        return "other"
    if "required choice" in body:
        return "required_choice"
    if "optional choice" in body:
        return "optional_choice"
    if body.strip() == "one-of" or body.startswith("one-of"):
        return "one_of"
    if body.startswith("if "):
        return "if_then"
    if "exists" in body:
        return "exists"
    if any(op in body for op in ("<=", ">=", "<>", "< ", "> ", "= ")):
        return "comparison"
    return "other"


def _parse_choice_slots(body: str, prefix: str) -> list[str]:
    """Extract slot names from 'required choice a, b, c' or 'optional choice a, b'."""
    m = re.match(rf"{prefix}\s+choice\s+(.*)", body)
    if m:
        return [s.strip() for s in m.group(1).split(",") if s.strip()]
    return []


def _parse_exists_absent_list(text: str) -> Optional[dict]:
    """Parse 'slot1 exists and slot2 is absent and ...' into slot_conditions.

    Returns dict of {slot: {required: bool}} or None if unparseable.
    Only handles simple slot names (no path traversal).
    """
    parts = re.split(r"\s+and\s+", text.strip())
    result: dict[str, dict] = {}
    for part in parts:
        pm = re.match(r"(\w+)\s+(exists|is absent)\s*$", part.strip())
        if pm:
            result[pm.group(1)] = {"required": pm.group(2) == "exists"}
        else:
            return None
    return result if result else None


def _parse_or_exists_list(text: str) -> Optional[list[str]]:
    """Parse 'slot1 exists or slot2 exists or ...' into a list of slot names.

    Returns list of slot names or None if unparseable.
    """
    parts = re.split(r"\s+or\s+", text.strip())
    slots = []
    for part in parts:
        pm = re.match(r"(\w+)\s+exists\s*$", part.strip())
        if pm:
            slots.append(pm.group(1))
        else:
            return None
    return slots if slots else None


def _parse_postcondition_clauses(text: str) -> Optional[dict]:
    """Parse a then-clause with 'and'-joined slot exists/absent checks.

    Handles: slot exists, slot is absent, slot = Value, slot = True/False,
    bare slot name (treated as slot = True for boolean slots).
    Returns slot_conditions dict or None.
    """
    parts = re.split(r"\s+and\s+", text.strip())
    result: dict[str, dict] = {}
    for part in parts:
        part = part.strip()
        pm = re.match(r"(\w+)\s+exists\s*$", part)
        if pm:
            result[pm.group(1)] = {"required": True}
            continue
        pm = re.match(r"(\w+)\s+is absent\s*$", part)
        if pm:
            result[pm.group(1)] = {"required": False}
            continue
        pm = re.match(r"(\w+)\s+=\s+(True|False)\s*$", part)
        if pm:
            result[pm.group(1)] = {"equals_string": pm.group(2)}
            continue
        pm = re.match(r"(\w+)\s+=\s+(\w+Enum)\s+->\s+(\w+)\s*$", part)
        if pm:
            result[pm.group(1)] = {"equals_string": pm.group(3)}
            continue
        pm = re.match(r"(\w+)\s+=\s+(\w+)\s*$", part)
        if pm:
            result[pm.group(1)] = {"equals_string": pm.group(2)}
            continue
        # Bare slot name (boolean true): isExchangeListed -> equals True
        pm = re.match(r"(\w+)\s*$", part)
        if pm and not any(kw in part for kw in ("exists", "absent", "=", "<", ">")):
            result[pm.group(1)] = {"equals_string": "True"}
            continue
        # Clause too complex
        return None
    return result if result else None


def _has_path_traversal(text: str) -> bool:
    """Check if text contains Rosetta path traversal '->'."""
    return "->" in text


def _has_func_call(text: str) -> bool:
    """Check if text contains a function call pattern."""
    return bool(re.search(r"\w+\(", text))


def _split_top_level_or(text: str) -> Optional[list[str]]:
    """Split text on top-level ' or ' respecting parentheses.

    Returns list of parts or None if no top-level OR found.
    """
    parts = []
    depth = 0
    current = []
    tokens = text.split()
    i = 0
    while i < len(tokens):
        tok = tokens[i]
        if tok == "or" and depth == 0:
            parts.append(" ".join(current))
            current = []
        else:
            depth += tok.count("(") - tok.count(")")
            current.append(tok)
        i += 1
    if current:
        parts.append(" ".join(current))
    return parts if len(parts) > 1 else None


def _func_to_annotation(func: "RosettaFunction") -> dict:
    """Convert a RosettaFunction into a structured annotation dict.

    Produces a dict with keys: name, description (if any), inputs (list),
    output (dict), and code_implementation (if True).
    """
    entry: dict = {"name": func.name}
    if func.description:
        entry["description"] = func.description
    if func.inputs:
        entry["inputs"] = [
            {
                "name": p.name,
                "type": p.type_name,
                "cardinality": p.cardinality,
            }
            for p in func.inputs
        ]
    if func.output:
        entry["output"] = {
            "name": func.output.name,
            "type": func.output.type_name,
            "cardinality": func.output.cardinality,
        }
    if func.is_code_implementation:
        entry["code_implementation"] = True
    return entry


def _condition_to_rule(cond: "RosettaCondition") -> Optional[dict]:
    """Convert a RosettaCondition into a LinkML rules: entry where possible.

    Returns a dict for a LinkML rule, or None if the condition is too complex.

    Handles these patterns:
      required_choice, optional_choice, one_of  — choice constraints
      if_then — if/then with exists, absent, enum eq, bool eq, neq, value checks
      exists  — simple slot exists / mixed exists+absent
      comparison — simple slot comparisons and equality
      other   — trivial absent checks
    """
    body = cond.body
    desc = cond.description or cond.name

    if cond.kind == "required_choice":
        # required choice a, b, c -> exactly_one_of with slot_conditions
        slots = _parse_choice_slots(body, "required")
        if slots:
            return {
                "description": desc,
                "postconditions": {
                    "exactly_one_of": [
                        {"slot_conditions": {s: {"required": True}}}
                        for s in slots
                    ]
                },
            }

    elif cond.kind == "optional_choice":
        # optional choice a, b -> at most one—any_of includes none
        slots = _parse_choice_slots(body, "optional")
        if slots:
            return {
                "description": desc,
                "postconditions": {
                    "any_of": [
                        {"slot_conditions": {s: {"required": True}}}
                        for s in slots
                    ]
                },
            }

    elif cond.kind == "one_of":
        # one-of (all slots) — indicates exactly one slot must be set
        return {
            "description": desc,
            "comments": ["Rosetta one-of: exactly one slot must be present."],
        }

    elif cond.kind == "if_then":
        return _if_then_to_rule(body, desc)

    elif cond.kind == "exists":
        return _exists_to_rule(body, desc)

    elif cond.kind == "comparison":
        return _comparison_to_rule(body, desc)

    elif cond.kind == "other":
        return _other_to_rule(body, desc)

    return None


def _if_then_to_rule(body: str, desc: str) -> Optional[dict]:
    """Convert an if-then condition body into a LinkML rule."""

    # Strip inline comments (// ...)
    body = re.sub(r"\s*//.*", "", body).strip()
    if not body:
        return None

    # Skip conditions with path traversal or function calls — too complex
    # for flat slot_conditions.  We handle them only when the then-clause
    # is still expressible as flat slot references.
    then_part = ""
    if " then " in body:
        then_part = body.split(" then ", 1)[1]
        # Allow else to be split off
        if " else " in then_part:
            then_part = then_part.split(" else ", 1)[0]

    # ── Pattern 1: if <slot> exists then <slot> exists ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(\w+)\s+exists\s*$", body
    )
    if m:
        return {
            "description": desc,
            "preconditions": {
                "slot_conditions": {m.group(1): {"required": True}}
            },
            "postconditions": {
                "slot_conditions": {m.group(2): {"required": True}}
            },
        }

    # ── Pattern 2: if <slot> is absent then <slot(s)> exists/absent ──
    m = re.match(
        r"if\s+(\w+)\s+is absent\s+then\s+([\w\s]+(?:exists|is absent)(?:\s+and\s+[\w\s]+(?:exists|is absent))*)\s*$",
        body,
    )
    if m:
        pre_slot = m.group(1)
        postconds = _parse_exists_absent_list(m.group(2))
        if postconds:
            return {
                "description": desc,
                "preconditions": {
                    "slot_conditions": {pre_slot: {"required": False}}
                },
                "postconditions": {"slot_conditions": postconds},
            }

    # ── Pattern 3: if <slot> = EnumType -> Value then <slot> = <digit> ──
    m = re.match(
        r"if\s+(\w+)\s+=\s+(\w+)\s+->\s+(\w+)\s+then\s+(\w+)\s+=\s+(\d+)\s*$",
        body,
    )
    if m:
        return {
            "description": desc,
            "preconditions": {
                "slot_conditions": {
                    m.group(1): {
                        "equals_string": f"{m.group(2)}.{m.group(3)}"
                    }
                }
            },
            "postconditions": {
                "slot_conditions": {
                    m.group(4): {"equals_string": m.group(5)}
                }
            },
        }

    # ── Pattern 4: if <slot> = EnumType -> Value then <slots> exists/absent ──
    m = re.match(
        r"if\s+(\w+)\s+=\s+(\w+Enum)\s+->\s+(\w+)\s+then\s+(.+)$", body
    )
    if m and not _has_path_traversal(m.group(4)) and not _has_func_call(m.group(4)):
        then_text = m.group(4)
        # Handle "then X exists else Y is absent" by trimming else
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        postconds = _parse_postcondition_clauses(then_text)
        if postconds:
            return {
                "description": desc,
                "preconditions": {
                    "slot_conditions": {
                        m.group(1): {"equals_string": m.group(3)}
                    }
                },
                "postconditions": {"slot_conditions": postconds},
            }

    # ── Pattern 5: if <slot> = True/False then <slots> exists/absent ──
    m = re.match(
        r"if\s+(\w+)\s+=\s+(True|False)\s+then\s+(.+)$", body
    )
    if m and not _has_path_traversal(m.group(3)) and not _has_func_call(m.group(3)):
        then_text = m.group(3)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        postconds = _parse_postcondition_clauses(then_text)
        if postconds:
            return {
                "description": desc,
                "preconditions": {
                    "slot_conditions": {
                        m.group(1): {"equals_string": m.group(2)}
                    }
                },
                "postconditions": {"slot_conditions": postconds},
            }
        # Try OR postconditions: slot1 exists or slot2 exists
        or_parts = re.split(r"\s+or\s+", then_text.strip())
        if len(or_parts) > 1:
            or_postconds = []
            for part in or_parts:
                pm = re.match(r"(\w+)\s+exists\s*$", part.strip().strip("()"))
                if pm:
                    or_postconds.append(
                        {"slot_conditions": {pm.group(1): {"required": True}}}
                    )
                else:
                    or_postconds = []
                    break
            if or_postconds:
                return {
                    "description": desc,
                    "preconditions": {
                        "slot_conditions": {
                            m.group(1): {"equals_string": m.group(2)}
                        }
                    },
                    "postconditions": {"any_of": or_postconds},
                }

    # ── Pattern 6: if <slot> <> Value then <slots> is absent ──
    m = re.match(
        r"if\s+(\w+)\s+<>\s+(\w+(?:Enum\s+->\s+\w+)?)\s+then\s+(.+)$", body
    )
    if m and not _has_path_traversal(m.group(3)) and not _has_func_call(m.group(3)):
        then_text = m.group(3)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        postconds = _parse_postcondition_clauses(then_text)
        if postconds:
            # Extract the enum value for the precondition
            neq_val = m.group(2)
            neq_match = re.match(r"(\w+Enum)\s+->\s+(\w+)", neq_val)
            if neq_match:
                neq_val = neq_match.group(2)
            return {
                "description": desc,
                "comments": [
                    f"Rosetta negation: {m.group(1)} <> {m.group(2)}"
                ],
                "preconditions": {
                    "slot_conditions": {
                        m.group(1): {
                            # Use equals_string_in (not equals_string)
                            # to work around gen-owl crash on enum-ranged
                            # slots where is_literal is None.
                            "none_of": [{"equals_string_in": [neq_val]}]
                        }
                    }
                },
                "postconditions": {"slot_conditions": postconds},
            }

    # ── Pattern 7: if <slot> exists then <slot> >= N  (value check) ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(\w+)\s*(>=|<=|>|<)\s*(-?[\d.]+)\s*$",
        body,
    )
    if m:
        slot_pre = m.group(1)
        slot_post = m.group(2)
        op = m.group(3)
        val = m.group(4)
        post_cond: dict = {}
        try:
            num_val = int(val) if "." not in val else float(val)
        except ValueError:
            num_val = val
        if op == ">=":
            post_cond = {"minimum_value": num_val}
        elif op == "<=":
            post_cond = {"maximum_value": num_val}
        elif op == ">":
            post_cond = {"minimum_value": num_val,
                         "comments": ["Rosetta: strictly greater than"]}
        elif op == "<":
            post_cond = {"maximum_value": num_val,
                         "comments": ["Rosetta: strictly less than"]}
        if post_cond:
            return {
                "description": desc,
                "preconditions": {
                    "slot_conditions": {slot_pre: {"required": True}}
                },
                "postconditions": {
                    "slot_conditions": {slot_post: post_cond}
                },
            }

    # ── Pattern 8: if <slot> exists then <slot> >= N and <slot> <= M ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(\w+)\s*(>=|>)\s*(-?[\d.]+)\s+and\s+(\w+)\s*(<=|<)\s*(-?[\d.]+)\s*$",
        body,
    )
    if m:
        slot_pre = m.group(1)
        post_cond_slot = {}
        try:
            lo = int(m.group(4)) if "." not in m.group(4) else float(m.group(4))
        except ValueError:
            lo = m.group(4)
        try:
            hi = int(m.group(7)) if "." not in m.group(7) else float(m.group(7))
        except ValueError:
            hi = m.group(7)
        post_cond_slot["minimum_value"] = lo
        post_cond_slot["maximum_value"] = hi
        return {
            "description": desc,
            "preconditions": {
                "slot_conditions": {slot_pre: {"required": True}}
            },
            "postconditions": {
                "slot_conditions": {m.group(2): post_cond_slot}
            },
        }

    # ── Pattern 9: if <slot> exists then <slot2> exists (with and-chaining) ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(.+)$", body
    )
    if m and not _has_path_traversal(m.group(2)) and not _has_func_call(m.group(2)):
        then_text = m.group(2)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        postconds = _parse_postcondition_clauses(then_text)
        if postconds:
            return {
                "description": desc,
                "preconditions": {
                    "slot_conditions": {m.group(1): {"required": True}}
                },
                "postconditions": {"slot_conditions": postconds},
            }

    # ── Pattern 10: if <slot> = <non-enum> then <slots> ──
    m = re.match(
        r'if\s+(\w+)\s+=\s+"([^"]+)"\s+then\s+(.+)$', body
    )
    if not m:
        m = re.match(
            r"if\s+(\w+)\s+=\s+(\w+)\s+then\s+(.+)$", body
        )
    if m and not _has_path_traversal(body) and not _has_func_call(body):
        then_text = m.group(3)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        postconds = _parse_postcondition_clauses(then_text)
        if postconds:
            return {
                "description": desc,
                "preconditions": {
                    "slot_conditions": {
                        m.group(1): {"equals_string": m.group(2)}
                    }
                },
                "postconditions": {"slot_conditions": postconds},
            }

    # ── Pattern 11: if <slot> is absent or <slot> is absent then <slots> ──
    m = re.match(
        r"if\s+(\w+)\s+is absent\s+or\s+(\w+)\s+is absent\s+then\s+(.+)$",
        body,
    )
    if m and not _has_path_traversal(m.group(3)) and not _has_func_call(m.group(3)):
        then_text = m.group(3)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        postconds = _parse_postcondition_clauses(then_text)
        if postconds:
            return {
                "description": desc,
                "preconditions": {
                    "any_of": [
                        {"slot_conditions": {m.group(1): {"required": False}}},
                        {"slot_conditions": {m.group(2): {"required": False}}},
                    ]
                },
                "postconditions": {"slot_conditions": postconds},
            }

    # ── Pattern 12: if <slot> exists then <slot> or <slot> (OR postconditions) ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(.+)$", body
    )
    if m and not _has_path_traversal(m.group(2)) and not _has_func_call(m.group(2)):
        then_text = m.group(2)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        # Try parsing as OR-exists postconditions
        or_parts = re.split(r"\s+or\s+", then_text.strip())
        if len(or_parts) > 1:
            or_postconds = []
            for part in or_parts:
                part = part.strip().strip("()")
                pm = re.match(r"(\w+)\s+exists\s*$", part)
                if pm:
                    or_postconds.append(
                        {"slot_conditions": {pm.group(1): {"required": True}}}
                    )
                else:
                    or_postconds = []
                    break
            if or_postconds:
                return {
                    "description": desc,
                    "preconditions": {
                        "slot_conditions": {m.group(1): {"required": True}}
                    },
                    "postconditions": {"any_of": or_postconds},
                }

    # ── Pattern 13: if <bare_bool_slot> then <slot> exists ──
    m = re.match(r"if\s+(\w+)\s+then\s+(.+)$", body)
    if m and not _has_path_traversal(body) and not _has_func_call(body):
        then_text = m.group(2)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        postconds = _parse_postcondition_clauses(then_text)
        if postconds:
            return {
                "description": desc,
                "preconditions": {
                    "slot_conditions": {
                        m.group(1): {"equals_string": "True"}
                    }
                },
                "postconditions": {"slot_conditions": postconds},
            }

    # ── Pattern 14: if (slot1 exists and slot2 exists) then slot1 < slot2 ──
    m = re.match(
        r"if\s+\(?(\w+)\s+exists\s+and\s+(\w+)\s+exists\)?\s+then\s+(\w+)\s*(<=|>=|<|>)\s*(\w+)\s*$",
        body,
    )
    if m and not _has_path_traversal(body):
        return {
            "description": desc,
            "preconditions": {
                "slot_conditions": {
                    m.group(1): {"required": True},
                    m.group(2): {"required": True},
                }
            },
            "comments": [
                f"Rosetta comparison: {m.group(3)} {m.group(4)} {m.group(5)}"
            ],
        }

    # ── Pattern 14b: if <slot> exists then <slot> >= <other_slot> ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(\w+)\s*(>=|<=|>|<)\s*(\w+)\s*$",
        body,
    )
    if m and not _has_path_traversal(body) and not m.group(4).replace(".", "").isdigit():
        return {
            "description": desc,
            "preconditions": {
                "slot_conditions": {m.group(1): {"required": True}}
            },
            "comments": [
                f"Rosetta comparison: {m.group(2)} {m.group(3)} {m.group(4)}"
            ],
        }

    # ── Pattern 15: if <slot> exists then <slot> <> Value (negation) ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(\w+)\s+<>\s+(-?[\d.]+|\w+)\s*$",
        body,
    )
    if m and not _has_path_traversal(body):
        return {
            "description": desc,
            "preconditions": {
                "slot_conditions": {m.group(1): {"required": True}}
            },
            "postconditions": {
                "slot_conditions": {
                    m.group(2): {
                        # Use equals_string_in (not equals_string)
                        # to work around gen-owl crash on enum-ranged
                        # slots where is_literal is None.
                        "none_of": [{"equals_string_in": [m.group(3)]}]
                    }
                }
            },
        }

    # ── Pattern 16: if <slot> is absent then <slot> exists or <slot> exists ──
    m = re.match(
        r"if\s+(\w+)\s+is absent\s+then\s+(.+)$", body
    )
    if m and not _has_path_traversal(m.group(2)) and not _has_func_call(m.group(2)):
        then_text = m.group(2)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        or_parts = re.split(r"\s+or\s+", then_text)
        if len(or_parts) > 1:
            or_postconds = []
            for part in or_parts:
                pm = re.match(r"(\w+)\s+exists\s*$", part.strip())
                if pm:
                    or_postconds.append(
                        {"slot_conditions": {pm.group(1): {"required": True}}}
                    )
                else:
                    or_postconds = []
                    break
            if or_postconds:
                return {
                    "description": desc,
                    "preconditions": {
                        "slot_conditions": {
                            m.group(1): {"required": False}
                        }
                    },
                    "postconditions": {"any_of": or_postconds},
                }

    # ── Pattern 17: Compound with 'and if' or 'or if': two joined if-then ──
    compound_and = re.match(
        r"if\s+(.+?)\s+and\s+if\s+(.+)$", body
    )
    compound_or = re.match(
        r"if\s+(.+?)\s+or\s+if\s+(.+)$", body
    )
    compound = compound_and or compound_or
    if compound and not _has_path_traversal(body) and not _has_func_call(body):
        # Try to parse the first if-then sub-rule
        first_body = "if " + compound.group(1).strip()
        first_rule = _if_then_to_rule(first_body, desc)
        if first_rule:
            return first_rule  # Return just the first; the second is a separate constraint

    # ── Pattern 18: if <slot> exists then <slot> >= N and <slot2> >= M (multi-value) ──
    m = re.match(
        r"if\s+(\w+)\s+exists\s+then\s+(.+)$", body
    )
    if m and not _has_path_traversal(m.group(2)) and not _has_func_call(m.group(2)):
        then_text = m.group(2)
        if " else " in then_text:
            then_text = then_text.split(" else ", 1)[0]
        # Parse AND-chained value checks: slot >= N and slot <= M ...
        and_parts = re.split(r"\s+and\s+", then_text)
        if all(re.match(r"\w+\s*(>=|<=|>|<)\s*-?[\d.]+\s*$", p.strip()) for p in and_parts):
            postconds = {}
            for p in and_parts:
                vm = re.match(r"(\w+)\s*(>=|<=|>|<)\s*(-?[\d.]+)", p.strip())
                if vm:
                    slot = vm.group(1)
                    op = vm.group(2)
                    try:
                        val = int(vm.group(3)) if "." not in vm.group(3) else float(vm.group(3))
                    except ValueError:
                        val = vm.group(3)
                    if slot not in postconds:
                        postconds[slot] = {}
                    if op == ">=":
                        postconds[slot]["minimum_value"] = val
                    elif op == "<=":
                        postconds[slot]["maximum_value"] = val
                    elif op == ">":
                        postconds[slot]["minimum_value"] = val
                        postconds[slot].setdefault("comments", []).append("Rosetta: strictly greater than")
                    elif op == "<":
                        postconds[slot]["maximum_value"] = val
                        postconds[slot].setdefault("comments", []).append("Rosetta: strictly less than")
            if postconds:
                return {
                    "description": desc,
                    "preconditions": {
                        "slot_conditions": {m.group(1): {"required": True}}
                    },
                    "postconditions": {"slot_conditions": postconds},
                }

    # Complex if-then: cannot map
    return None


def _exists_to_rule(body: str, desc: str) -> Optional[dict]:
    """Convert an exists-kind condition body into a LinkML rule."""

    # Skip if path traversal or function calls present
    if _has_path_traversal(body) or _has_func_call(body):
        return None

    # ── Simple: slot exists (single or AND-chained) ──
    postconds = _parse_exists_absent_list(body)
    if postconds:
        return {
            "description": desc,
            "postconditions": {"slot_conditions": postconds},
        }

    # ── OR pattern: slot1 exists or slot2 exists ──
    or_slots = _parse_or_exists_list(body)
    if or_slots:
        return {
            "description": desc,
            "postconditions": {
                "any_of": [
                    {"slot_conditions": {s: {"required": True}}}
                    for s in or_slots
                ]
            },
        }

    # ── Mixed AND/OR with parentheses — try flat OR of exists ──
    # Strip outer parens and retry
    stripped = body.strip()
    if stripped.startswith("(") and stripped.endswith(")"):
        stripped = stripped[1:-1].strip()
        or_slots = _parse_or_exists_list(stripped)
        if or_slots:
            return {
                "description": desc,
                "postconditions": {
                    "any_of": [
                        {"slot_conditions": {s: {"required": True}}}
                        for s in or_slots
                    ]
                },
            }

    # ── Parenthesized mixed: (A exists and B exists) or C exists ──
    # Split top-level OR (respecting parens), each branch is AND-exists or single
    top_or_parts = _split_top_level_or(body)
    if top_or_parts and len(top_or_parts) > 1:
        any_of_items = []
        for part in top_or_parts:
            part = part.strip().strip("()")
            pc = _parse_exists_absent_list(part)
            if pc:
                any_of_items.append({"slot_conditions": pc})
            else:
                any_of_items = []
                break
        if any_of_items:
            return {
                "description": desc,
                "postconditions": {"any_of": any_of_items},
            }

    return None


def _comparison_to_rule(body: str, desc: str) -> Optional[dict]:
    """Convert a comparison-kind condition body into a LinkML rule."""

    # Skip if path traversal or function calls present
    if _has_path_traversal(body) or _has_func_call(body):
        return None

    # ── slot >= N (or <=, >, <) ──
    m = re.match(r"(\w+)\s*(>=|<=|>|<)\s*(-?[\d.]+)\s*$", body)
    if m:
        slot = m.group(1)
        op = m.group(2)
        try:
            val = int(m.group(3)) if "." not in m.group(3) else float(m.group(3))
        except ValueError:
            val = m.group(3)
        cond_dict: dict = {}
        if op == ">=":
            cond_dict = {"minimum_value": val}
        elif op == "<=":
            cond_dict = {"maximum_value": val}
        elif op == ">":
            cond_dict = {"minimum_value": val,
                         "comments": ["Rosetta: strictly greater than"]}
        elif op == "<":
            cond_dict = {"maximum_value": val,
                         "comments": ["Rosetta: strictly less than"]}
        return {
            "description": desc,
            "postconditions": {"slot_conditions": {slot: cond_dict}},
        }

    # ── slot >= N and slot <= M (range) ──
    m = re.match(
        r"(\w+)\s*(>=|>)\s*(-?[\d.]+)\s+and\s+(\w+)\s*(<=|<)\s*(-?[\d.]+)\s*$",
        body,
    )
    if m:
        try:
            lo = int(m.group(3)) if "." not in m.group(3) else float(m.group(3))
        except ValueError:
            lo = m.group(3)
        try:
            hi = int(m.group(6)) if "." not in m.group(6) else float(m.group(6))
        except ValueError:
            hi = m.group(6)
        return {
            "description": desc,
            "postconditions": {
                "slot_conditions": {
                    m.group(1): {"minimum_value": lo, "maximum_value": hi}
                }
            },
        }

    # ── slot = Value (equality, no enum arrow) ──
    m = re.match(r"(\w+)\s+=\s+(\w+)\s*$", body)
    if m:
        return {
            "description": desc,
            "postconditions": {
                "slot_conditions": {
                    m.group(1): {"equals_string": m.group(2)}
                }
            },
        }

    # ── Two-slot comparison: startDate <= endDate ──
    m = re.match(r"(\w+)\s*(<=|>=|<|>)\s*(\w+)\s*$", body)
    if m:
        return {
            "description": desc,
            "comments": [
                f"Rosetta comparison: {m.group(1)} {m.group(2)} {m.group(3)}"
            ],
        }

    # ── Chained comparisons: a <= b and b <= c ──
    chain_parts = re.split(r"\s+and\s+", body)
    if len(chain_parts) > 1 and all(
        re.match(r"\w+\s*(<=|>=|<|>)\s*\w+\s*$", p.strip())
        for p in chain_parts
    ):
        comments = []
        for p in chain_parts:
            cm = re.match(r"(\w+)\s*(<=|>=|<|>)\s*(\w+)", p.strip())
            if cm:
                comments.append(
                    f"Rosetta comparison: {cm.group(1)} {cm.group(2)} {cm.group(3)}"
                )
        return {
            "description": desc,
            "comments": comments,
        }

    return None


def _other_to_rule(body: str, desc: str) -> Optional[dict]:
    """Convert an other-kind condition body into a LinkML rule if trivial."""

    # Skip if path traversal or function calls present
    if _has_path_traversal(body) or _has_func_call(body):
        return None

    # Skip commented-out conditions
    if body.strip().startswith("//"):
        return None

    # ── slot is absent (single or AND-chained) ──
    postconds = _parse_exists_absent_list(body)
    if postconds:
        return {
            "description": desc,
            "postconditions": {"slot_conditions": postconds},
        }

    return None


# ---------------------------------------------------------------------------
# Codelist loader
# ---------------------------------------------------------------------------


def load_codelists(codelist_dir: Path) -> dict[str, CodelistInfo]:
    """Load all codelist JSON files. Returns dict keyed by canonicalUri."""
    codelists: dict[str, CodelistInfo] = {}
    if not codelist_dir.is_dir():
        return codelists
    for f in sorted(codelist_dir.glob("*.json")):
        try:
            with open(f, encoding="utf-8") as fh:
                data = json.load(fh)
            ident = data.get("identification", {})
            canon_uri = ident.get("canonicalUri", "")
            if not canon_uri:
                continue
            codes: dict[str, str] = {}
            for code in data.get("codes", []):
                val = code.get("value", "")
                if val:
                    codes[val] = code.get("description", "")
            codelists[canon_uri] = CodelistInfo(
                canonical_uri=canon_uri,
                canonical_version_uri=ident.get(
                    "canonicalVersionUri", canon_uri
                ),
                short_name=ident.get("shortName", ""),
                codes=codes,
            )
        except (json.JSONDecodeError, KeyError, OSError):
            continue
    return codelists


# ---------------------------------------------------------------------------
# Synonym parser
# ---------------------------------------------------------------------------

# Map synonym source names to CURIE prefixes
SYNONYM_PREFIX_MAP = {
    "FpML_5_10": "fpml_5_10",
    "FpML": "fpml_5_10",
    "ORE_1_0_39": "ore",
    "ORE": "ore",
    "FIS": "fis",
    "FIS_BASE": "fis",
    "CreateiQ_1_0": "createiq",
    "CreateiQ": "createiq",
    "AcadiaSoft_AM_1_0": "acadiasoft",
    "FIX_5_0_SP2": "fix",
    "ISDA_Taxonomy_v1": "isda_tax",
    "ISDA_Taxonomy_v2": "isda_tax",
    "ISO20022": "iso20022",
}


def parse_desc_files(rosetta_dir: Path) -> dict[str, list[str]]:
    """Parse *-desc.rosetta files for body/corpus/segment declarations.

    Returns: {namespace: [comment_strings]}
    """
    result: dict[str, list[str]] = {}
    for f in sorted(rosetta_dir.glob("*-desc.rosetta")):
        text = f.read_text(encoding="utf-8")
        namespace = ""
        comments: list[str] = []
        for line in text.splitlines():
            m = re.match(r'^namespace\s+([\w.]+)', line)
            if m:
                namespace = m.group(1)
                continue
            # body Organisation NAME <"desc">
            m = re.match(r'^body\s+\w+\s+(\w+)(?:\s+<"([^"]*)">\s*)?', line)
            if m:
                body_name = m.group(1)
                body_desc = m.group(2) or ""
                if body_desc:
                    comments.append(f"Standard body: {body_name} — {body_desc}")
                else:
                    comments.append(f"Standard body: {body_name}")
                continue
            # corpus Type "Full Name" ShortName <"desc">
            m = re.match(
                r'^corpus\s+\w+\s+(?:"[^"]*"\s+)?(\w+)(?:\s+<"([^"]*)">\s*)?',
                line,
            )
            if m:
                corpus_name = m.group(1)
                corpus_desc = m.group(2) or ""
                if corpus_desc:
                    comments.append(f"Corpus: {corpus_name} — {corpus_desc}")
                else:
                    comments.append(f"Corpus: {corpus_name}")
                continue
            # segment type
            m = re.match(r'^segment\s+(\w+)', line)
            if m:
                comments.append(f"Segment type: {m.group(1)}")
                continue
        if namespace and comments:
            result[namespace] = comments
    return result


def parse_synonym_types(rosetta_dir: Path) -> dict[str, dict[str, str]]:
    """Parse synonym files for CDM type -> external source mappings.

    Returns: {synonym_source_name: {cdm_type_name: cdm_type_name}}
    """
    result: dict[str, dict[str, str]] = {}
    for f in sorted(rosetta_dir.glob("mapping-*-synonym.rosetta")):
        text = f.read_text(encoding="utf-8")
        current_source = ""
        for line in text.splitlines():
            # "synonym source X extends Y {"
            m = re.match(r"^synonym source (\w+)\s+extends\s+\w+", line)
            if m:
                current_source = m.group(1)
                if current_source not in result:
                    result[current_source] = {}
                continue
            # Type line "    TypeName:"
            m = re.match(r"^\s{4}(\w+):\s*$", line)
            if m and current_source:
                result[current_source][m.group(1)] = m.group(1)
                continue
    return result


def parse_synonym_slots(
    rosetta_dir: Path,
) -> dict[str, dict[str, list[str]]]:
    """Parse synonym files for CDM type.attr -> external attribute mappings.

    Returns: {synonym_source: {CDMType: [attr_name, ...]}}
    """
    result: dict[str, dict[str, list[str]]] = {}
    for f in sorted(rosetta_dir.glob("mapping-*-synonym.rosetta")):
        text = f.read_text(encoding="utf-8")
        current_source = ""
        current_type = ""
        for line in text.splitlines():
            m = re.match(r"^synonym source (\w+)\s+extends\s+\w+", line)
            if m:
                current_source = m.group(1)
                if current_source not in result:
                    result[current_source] = {}
                continue
            m = re.match(r"^\s{4}(\w+):\s*$", line)
            if m and current_source:
                current_type = m.group(1)
                if current_type not in result[current_source]:
                    result[current_source][current_type] = []
                continue
            m = re.match(r"^\s{8}\+\s+(\w+)", line)
            if m and current_source and current_type:
                attr_name = m.group(1)
                if attr_name not in result[current_source][current_type]:
                    result[current_source][current_type].append(attr_name)
                continue
    return result


# ---------------------------------------------------------------------------
# Ecosystem SSSOM mapping loader
# ---------------------------------------------------------------------------

# SKOS predicate -> LinkML class/enum mapping slot
SSSOM_PREDICATE_TO_LINKML_SLOT: dict[str, str] = {
    "skos:exactMatch": "exact_mappings",
    "skos:closeMatch": "close_mappings",
    "skos:broadMatch": "broad_mappings",
    "skos:narrowMatch": "narrow_mappings",
    "skos:relatedMatch": "related_mappings",
}

# Stable prefix URI map. Authoritative source: the curie_map comment block in
# each cdm-*.sssom.tsv. Listed here so the generator can declare prefixes on
# the modules and root schema that actually use them.
ECOSYSTEM_PREFIX_URIS: dict[str, str] = {
    "gist": "https://w3id.org/lmodel/gist/",
    "oscal": "https://w3id.org/lmodel/oscal/",
    "iso29100": "https://w3id.org/lmodel/iso29100/",
    "spdx": "https://spdx.org/rdf/3.0.1/terms/",
}


@dataclass
class EcosystemMappings:
    """Loaded SSSOM mappings indexed for fast lookup during YAML generation."""

    # subject_local_name -> mapping-slot -> ordered list of object CURIEs
    by_name: dict[str, dict[str, list[str]]] = field(default_factory=dict)
    # prefixes referenced by any object CURIE
    used_prefixes: set[str] = field(default_factory=set)

    def add(self, name: str, slot: str, curie: str) -> None:
        slot_map = self.by_name.setdefault(name, {})
        existing = slot_map.setdefault(slot, [])
        if curie not in existing:
            existing.append(curie)
        prefix = curie.split(":", 1)[0] if ":" in curie else ""
        if prefix:
            self.used_prefixes.add(prefix)

    def prefixes_for(self, name: str) -> set[str]:
        """Return the set of prefixes referenced by mappings on `name`."""
        prefixes: set[str] = set()
        for curies in self.by_name.get(name, {}).values():
            for c in curies:
                if ":" in c:
                    prefixes.add(c.split(":", 1)[0])
        return prefixes


def parse_sssom_tsv(path: Path) -> list[dict[str, str]]:
    """Parse an SSSOM TSV file. Returns a list of row dicts.

    Skips comment lines (starting with '#') and uses the first non-comment
    line as the header.
    """
    rows: list[dict[str, str]] = []
    with open(path, "r", encoding="utf-8") as fh:
        header: Optional[list[str]] = None
        for line in fh:
            line = line.rstrip("\n")
            if not line or line.startswith("#"):
                continue
            fields = line.split("\t")
            if header is None:
                header = fields
                continue
            row = {header[i]: fields[i] for i in range(min(len(header), len(fields)))}
            rows.append(row)
    return rows


# Subject CURIEs in ecosystem SSSOM files use this prefix.
_CDM_SUBJECT_PREFIX = "common_domain_model:"


def load_ecosystem_mappings(mappings_dir: Path) -> EcosystemMappings:
    """Load curated cdm-<ecosystem>.sssom.tsv files and index by subject name.

    Reads one file per ecosystem prefix declared in ``ECOSYSTEM_PREFIX_URIS``
    (e.g. ``cdm-gist.sssom.tsv``, ``cdm-oscal.sssom.tsv``). Files not matching
    a known ecosystem prefix (notably the generated ``cdm-mappings.sssom.tsv``
    and ``rosetta_to_linkml.sssom.tsv`` outputs) are ignored so the loader is
    idempotent against its own output.

    Only rows whose subject is a CDM class/enum (prefixed
    ``common_domain_model:``) are loaded; predicates outside
    ``SSSOM_PREDICATE_TO_LINKML_SLOT`` are ignored.
    """
    out = EcosystemMappings()
    if not mappings_dir.is_dir():
        return out
    for prefix in sorted(ECOSYSTEM_PREFIX_URIS):
        path = mappings_dir / f"cdm-{prefix}.sssom.tsv"
        if not path.is_file():
            continue
        for row in parse_sssom_tsv(path):
            subject = row.get("subject_id", "")
            if not subject.startswith(_CDM_SUBJECT_PREFIX):
                continue
            predicate = row.get("predicate_id", "")
            slot = SSSOM_PREDICATE_TO_LINKML_SLOT.get(predicate)
            if not slot:
                continue
            obj = row.get("object_id", "")
            if not obj:
                continue
            name = subject[len(_CDM_SUBJECT_PREFIX):]
            out.add(name, slot, obj)
    return out


# ---------------------------------------------------------------------------
# Rosetta DSL parser
# ---------------------------------------------------------------------------


class RosettaParser:
    """Parse Rosetta DSL files into structured data."""

    # Patterns
    RE_NAMESPACE = re.compile(
        r'^namespace\s+([\w.]+)\s*(?::\s*<"([^"]*)">\s*)?$'
    )
    RE_VERSION = re.compile(r'^version\s+"[^"]*"')
    RE_IMPORT = re.compile(r"^import\s+([\w.*]+)")
    RE_TYPE = re.compile(
        r'^type\s+(\w+)(?:\s+extends\s+(\w+))?\s*:\s*(?:<"([^"]*)">\s*)?$'
    )
    RE_TYPE_NO_DESC = re.compile(
        r"^type\s+(\w+)(?:\s+extends\s+(\w+))?\s*:\s*$"
    )
    RE_TYPE_EMPTY = re.compile(
        r'^type\s+(\w+)(?:\s+extends\s+(\w+))?\s*(?::\s*(?:<"([^"]*)">\s*)?)?(?://.*)?$'
    )
    RE_ATTRIBUTE = re.compile(
        r'^\s{4}(\w+)\s+(\w+)\s+\((\d+\.\.\*|\d+\.\.\d+)\)\s*(?:<"([^"]*)">\s*)?(?://.*)?$'
    )
    RE_CONDITION = re.compile(
        r'^\s{4}condition\s+(\w+)\s*:\s*(?:<"([^"]*)">\s*)?$'
    )
    RE_METADATA = re.compile(r"^\s{8}\[metadata\s+(\w+)\]")
    RE_TYPE_METADATA = re.compile(r"^\s{4}\[(\w+)\]")
    RE_ROOT_TYPE = re.compile(r"^\s{4}\[rootType\]")
    RE_DOC_REF = re.compile(r"^\s{4,8}\[docReference\s+")
    RE_ENUM = re.compile(
        r'^enum\s+(\w+)(?:\s+extends\s+(\w+))?\s*:\s*(?:<"([^"]*)">\s*)?(?://.*)?$'
    )
    RE_ENUM_VALUE = re.compile(
        r'^\s{4}(\w+)\s*(?:displayName\s+"([^"]*)")?\s*(?:<"([^"]*)">\s*)?$'
    )
    RE_ENUM_DEPRECATED = re.compile(r"^\s{4}\[deprecated\]")
    RE_CHOICE = re.compile(r'^choice\s+(\w+)\s*:\s*(?:<"([^"]*)">\s*)?$')
    RE_CHOICE_ALT = re.compile(r'^\s{4}(\w+)\s*(?:<"([^"]*)">\s*)?$')
    RE_TYPEALIAS = re.compile(
        r'^typeAlias\s+(\w+)(?:\(.*\))?\s*:\s*(?:FpMLCodingScheme\(domain:\s*"([^"]*)"\))?\s*$'
    )
    RE_TYPEALIAS_SIMPLE = re.compile(
        r'^typeAlias\s+(\w+)\s*:\s*FpMLCodingScheme\(domain:\s*"([^"]*)"\)\s*$'
    )
    RE_TYPEALIAS_GENERIC = re.compile(
        r"^typeAlias\s+(\w+)\(([^)]*)\)\s*:\s*$"
    )
    RE_FUNC = re.compile(
        r'^func\s+(\w+)\s*:\s*(?:<"([^"]*)">\s*)?$'
    )
    RE_FUNC_PARAM = re.compile(
        r'^\s{8}(\w+)\s+(\w+)\s+\((\d+\.\.\*|\d+\.\.\d+)\)\s*(?:<"([^"]*)">\s*)?$'
    )

    @staticmethod
    def _join_multiline_descriptions(lines: list[str]) -> list[str]:
        """Join lines where a <"..."> description spans multiple lines."""
        result = []
        i = 0
        while i < len(lines):
            line = lines[i]
            # Check if line has an opening <" without a closing ">
            if '<"' in line and '">' not in line:
                # Join subsequent lines until we find the closing ">
                joined = line
                i += 1
                while i < len(lines):
                    joined += " " + lines[i].strip()
                    if '">' in lines[i]:
                        break
                    i += 1
                result.append(joined)
            else:
                result.append(line)
            i += 1
        return result

    def parse_file(self, path: Path) -> Optional[RosettaModule]:
        """Parse a single .rosetta file into a RosettaModule."""
        text = path.read_text(encoding="utf-8")
        lines = self._join_multiline_descriptions(text.splitlines())
        # Strip inline block comments /* ... */ (but not inside <"..."> strings)
        lines = [re.sub(r'/\*.*?\*/', '', l) for l in lines]

        namespace = ""
        ns_desc = ""
        imports: list[str] = []
        types: list[RosettaType] = []
        enums: list[RosettaEnum] = []
        type_aliases: list[RosettaTypeAlias] = []
        choices: list[RosettaChoice] = []
        functions: list[RosettaFunction] = []

        i = 0
        while i < len(lines):
            line = lines[i]

            # Namespace
            m = self.RE_NAMESPACE.match(line)
            if m:
                namespace = m.group(1)
                ns_desc = m.group(2) or ""
                i += 1
                continue

            # Version (skip)
            if self.RE_VERSION.match(line):
                i += 1
                continue

            # Import
            m = self.RE_IMPORT.match(line)
            if m:
                imports.append(m.group(1))
                i += 1
                continue

            # Choice (must check before Type since 'choice' is a keyword)
            m = self.RE_CHOICE.match(line)
            if m:
                choice, i = self._parse_choice(lines, i, m, namespace)
                if choice:
                    choices.append(choice)
                continue

            # Type
            m = self.RE_TYPE_EMPTY.match(line)
            if m and not line.strip().startswith("typeAlias"):
                typ, i = self._parse_type(lines, i, m, namespace)
                if typ:
                    types.append(typ)
                continue

            # Enum
            m = self.RE_ENUM.match(line)
            if m:
                enum, i = self._parse_enum(lines, i, m, namespace)
                if enum:
                    enums.append(enum)
                continue

            # TypeAlias (simple form)
            m = self.RE_TYPEALIAS_SIMPLE.match(line)
            if m:
                ta = RosettaTypeAlias(
                    name=m.group(1),
                    namespace=namespace,
                    base_type="string",
                    domain=m.group(2),
                )
                type_aliases.append(ta)
                i += 1
                continue

            # TypeAlias (generic/parameterised form)
            m = self.RE_TYPEALIAS_GENERIC.match(line)
            if m:
                ta = RosettaTypeAlias(
                    name=m.group(1),
                    namespace=namespace,
                    base_type="string",
                    domain="",
                )
                type_aliases.append(ta)
                # skip body
                i += 1
                while i < len(lines) and (
                    lines[i].startswith("    ") or lines[i].strip() == ""
                ):
                    i += 1
                continue

            # Function
            m = self.RE_FUNC.match(line)
            if m:
                func, i = self._parse_function(lines, i, m, namespace)
                if func:
                    functions.append(func)
                continue

            # TypeAlias (one-liner without parentheses pointing to
            # FpMLCodingScheme on next line)
            if line.strip().startswith("typeAlias "):
                ta_match = re.match(r"^typeAlias\s+(\w+)\s*:\s*$", line)
                if ta_match:
                    # peek next non-blank line
                    j = i + 1
                    while j < len(lines) and lines[j].strip() == "":
                        j += 1
                    if j < len(lines):
                        fpml_match = re.match(
                            r'\s*FpMLCodingScheme\(domain:\s*"([^"]*)"\)',
                            lines[j],
                        )
                        if fpml_match:
                            ta = RosettaTypeAlias(
                                name=ta_match.group(1),
                                namespace=namespace,
                                base_type="string",
                                domain=fpml_match.group(1),
                            )
                            type_aliases.append(ta)
                            i = j + 1
                            continue
                i += 1
                continue

            i += 1

        if not namespace:
            return None

        return RosettaModule(
            namespace=namespace,
            description=ns_desc,
            imports=imports,
            types=types,
            enums=enums,
            type_aliases=type_aliases,
            choices=choices,
            functions=functions,
        )

    def _parse_type(
        self, lines: list[str], start: int, m: re.Match, namespace: str
    ) -> tuple[Optional[RosettaType], int]:
        """Parse a type definition starting at line `start`."""
        name = m.group(1)
        extends = m.group(2) or ""
        desc = m.group(3) or ""

        typ = RosettaType(
            name=name,
            namespace=namespace,
            description=desc,
            extends=extends,
        )

        i = start + 1
        while i < len(lines):
            line = lines[i]

            # End of type: next top-level declaration
            if line and not line[0].isspace() and line.strip():
                break

            # Blank line (might be within type still)
            if not line.strip():
                i += 1
                continue

            # Type-level metadata annotations
            rm = re.match(r"^\s{4}\[rootType\]", line)
            if rm:
                typ.is_root_type = True
                typ.metadata.append("rootType")
                i += 1
                continue

            km = re.match(r"^\s{4}\[metadata\s+(\w+)\]", line)
            if km:
                typ.metadata.append(km.group(1))
                i += 1
                continue

            # Type-level deprecated
            dm = re.match(r"^\s{4}\[deprecated\]", line)
            if dm:
                typ.deprecated = True
                i += 1
                continue

            # Type-level docReference
            dr_m = re.match(r"^\s{4}\[docReference\s+", line)
            if dr_m:
                ref_text, i = collect_annotation_text(lines, i)
                dr = parse_doc_reference_text(ref_text)
                if dr:
                    typ.doc_references.append(dr)
                continue

            # Attribute
            am = self.RE_ATTRIBUTE.match(line)
            if am:
                attr = RosettaAttribute(
                    name=am.group(1),
                    type_name=am.group(2),
                    cardinality=am.group(3),
                    description=am.group(4) or "",
                )
                i += 1
                # Peek for attribute-level metadata, deprecated, and docReferences
                while i < len(lines):
                    ml = lines[i]
                    meta_m = re.match(r"^\s{8}\[metadata\s+(\w+)\]", ml)
                    depr_m = re.match(r"^\s{8}\[deprecated\]", ml)
                    doc_m = re.match(r"^\s{8}\[docReference\s+", ml)
                    if meta_m:
                        attr.metadata.append(meta_m.group(1))
                        i += 1
                    elif depr_m:
                        attr.deprecated = True
                        i += 1
                    elif doc_m:
                        ref_text, i = collect_annotation_text(lines, i)
                        dr = parse_doc_reference_text(ref_text)
                        if dr:
                            attr.doc_references.append(dr)
                    else:
                        break
                typ.attributes.append(attr)
                continue

            # Condition
            cm = self.RE_CONDITION.match(line)
            if cm:
                cond_name = cm.group(1)
                cond_desc = cm.group(2) or ""
                i += 1
                # Collect condition body lines
                body_lines: list[str] = []
                while i < len(lines) and lines[i].startswith("        "):
                    stripped = lines[i].strip()
                    if stripped:
                        body_lines.append(stripped)
                    i += 1
                body = " ".join(body_lines)
                # Classify the condition kind
                kind = _classify_condition(body)
                typ.conditions.append(
                    RosettaCondition(
                        name=cond_name,
                        description=cond_desc,
                        body=body,
                        kind=kind,
                    )
                )
                continue

            i += 1

        return typ, i

    def _parse_enum(
        self, lines: list[str], start: int, m: re.Match, namespace: str
    ) -> tuple[Optional[RosettaEnum], int]:
        """Parse an enum definition starting at line `start`."""
        name = m.group(1)
        extends = m.group(2) or ""
        desc = m.group(3) or ""

        enum = RosettaEnum(
            name=name,
            namespace=namespace,
            description=desc,
            extends=extends,
        )

        i = start + 1
        while i < len(lines):
            line = lines[i]

            # End of enum
            if line and not line[0].isspace() and line.strip():
                break

            if not line.strip():
                i += 1
                continue

            # deprecated marker
            if re.match(r"^\s{4}\[deprecated\]", line):
                enum.deprecated = True
                i += 1
                continue

            # docReference — capture structured data
            if re.match(r"^\s{4}\[docReference\s+", line):
                ref_text, i = collect_annotation_text(lines, i)
                dr = parse_doc_reference_text(ref_text)
                if dr:
                    enum.doc_references.append(dr)
                continue

            # enum value
            vm = self.RE_ENUM_VALUE.match(line)
            if vm and not line.strip().startswith("["):
                ev = RosettaEnumValue(
                    name=vm.group(1),
                    display_name=vm.group(2) or "",
                    description=vm.group(3) or "",
                )
                enum.values.append(ev)
                i += 1
                continue

            i += 1

        return enum, i

    def _parse_choice(
        self, lines: list[str], start: int, m: re.Match, namespace: str
    ) -> tuple[Optional[RosettaChoice], int]:
        """Parse a choice definition starting at line `start`.

        Rosetta 'choice' is a union type — exactly one alternative must be
        selected. Maps to an abstract LinkML class.
        """
        name = m.group(1)
        desc = m.group(2) or ""

        choice = RosettaChoice(
            name=name,
            namespace=namespace,
            description=desc,
        )

        i = start + 1
        while i < len(lines):
            line = lines[i]

            # End of choice
            if line and not line[0].isspace() and line.strip():
                break

            if not line.strip():
                i += 1
                continue

            # metadata (e.g. [metadata key])
            km = re.match(r"^\s{4}\[metadata\s+(\w+)\]", line)
            if km:
                choice.metadata.append(km.group(1))
                i += 1
                continue

            # Skip docReference / other annotations
            if re.match(r"^\s{4,8}\[", line):
                _, i = collect_annotation_text(lines, i)
                continue

            # Alternative: just a name with optional description
            am = self.RE_CHOICE_ALT.match(line)
            if am and not line.strip().startswith("["):
                alt = RosettaAttribute(
                    name=am.group(1),
                    type_name=am.group(1),  # alternative name IS the type
                    cardinality="0..1",
                    description=am.group(2) or "",
                )
                choice.alternatives.append(alt)
                i += 1
                # Skip any following metadata/address annotations
                while i < len(lines) and re.match(r"^\s{8}\[", lines[i]):
                    i += 1
                continue

            i += 1

        return choice, i

    def _parse_function(
        self, lines: list[str], start: int, m: re.Match, namespace: str
    ) -> tuple[Optional[RosettaFunction], int]:
        """Parse a func definition starting at line `start`."""
        name = m.group(1)
        desc = m.group(2) or ""

        func = RosettaFunction(
            name=name,
            namespace=namespace,
            description=desc,
        )

        i = start + 1
        section = ""  # "inputs" or "output"
        while i < len(lines):
            line = lines[i]

            # End of func: next top-level declaration
            if line and not line[0].isspace() and line.strip():
                break

            if not line.strip():
                i += 1
                continue

            stripped = line.strip()

            # [codeImplementation]
            if stripped == "[codeImplementation]":
                func.is_code_implementation = True
                i += 1
                continue

            # Section headers
            if stripped == "inputs:":
                section = "inputs"
                i += 1
                continue
            if stripped.startswith("output:"):
                section = "output"
                i += 1
                continue

            # Parameter line (indented under inputs/output)
            pm = self.RE_FUNC_PARAM.match(line)
            if pm and section:
                param = RosettaFuncParam(
                    name=pm.group(1),
                    type_name=pm.group(2),
                    cardinality=pm.group(3),
                    description=pm.group(4) or "",
                )
                if section == "inputs":
                    func.inputs.append(param)
                elif section == "output":
                    func.output = param
                i += 1
                continue

            # Skip body lines (set, alias, add, condition, etc.)
            i += 1

        return func, i


# ---------------------------------------------------------------------------
# LinkML schema generator
# ---------------------------------------------------------------------------

# Rosetta primitive types -> LinkML built-in ranges
ROSETTA_TYPE_MAP = {
    "string": "string",
    "int": "integer",
    "number": "decimal",
    "boolean": "boolean",
    "date": "date",
    "time": "time",
    "dateTime": "datetime",
    "zonedDateTime": "datetime",
    "calculation": "string",  # Rosetta computed attribute — no data representation
}

# FpML codelist domain -> canonical URI prefix
FPML_SCHEME_URI = "http://www.fpml.org/coding-scheme/"


def namespace_to_module_name(ns: str) -> str:
    """Convert a Rosetta namespace to a LinkML module filename stem.

    cdm.base.datetime -> cdm_base_datetime
    """
    return ns.replace(".", "_")


def namespace_to_import(ns: str) -> str:
    """Convert a Rosetta namespace to a LinkML import path.

    cdm.base.datetime -> ./cdm_base_datetime
    """
    return f"./{namespace_to_module_name(ns)}"


class LinkMLGenerator:
    """Generate LinkML YAML schema from parsed Rosetta modules with enrichment."""

    CDM_PREFIX = "https://w3id.org/lmodel/common_domain_model/"
    CDM_ID = "https://w3id.org/lmodel/common-domain-model"
    FPML_PREFIX = "http://www.fpml.org/coding-scheme/"
    FPML_5_10_PREFIX = "https://www.fpml.org/spec/fpml-5-10#"
    ICMA_PREFIX = "https://www.icmagroup.org/market-practice-and-regulatory-policy/"
    ISDA_PREFIX = "https://www.isda.org/specifications/"

    def __init__(
        self,
        modules: dict[str, RosettaModule],
        codelists: Optional[dict[str, CodelistInfo]] = None,
        synonym_types: Optional[dict[str, dict[str, str]]] = None,
        synonym_slots: Optional[dict[str, dict[str, list[str]]]] = None,
        ecosystem_mappings: Optional[EcosystemMappings] = None,
    ):
        self.modules = modules  # keyed by namespace
        self.codelists = codelists or {}
        self.synonym_types = synonym_types or {}
        self.synonym_slots = synonym_slots or {}
        self.ecosystem_mappings = ecosystem_mappings or EcosystemMappings()

        # Collect all type names to resolve ranges
        self.all_type_names: set[str] = set()
        self.all_enum_names: set[str] = set()
        self.type_alias_names: set[str] = set()
        self.all_choice_names: set[str] = set()
        self._choice_alternatives: dict[str, list[str]] = {}
        for mod in modules.values():
            for t in mod.types:
                self.all_type_names.add(t.name)
            for e in mod.enums:
                self.all_enum_names.add(e.name)
            for ta in mod.type_aliases:
                self.type_alias_names.add(ta.name)
            for c in mod.choices:
                self.all_choice_names.add(c.name)
                self._choice_alternatives[c.name] = [
                    alt.type_name for alt in c.alternatives
                ]

        # Build mapping from Rosetta typeAlias name -> LinkML type name.
        # Append 'Type' suffix when the alias name collides with a class or
        # enum to avoid LinkML's shared element namespace conflict.
        self._alias_linkml_name: dict[str, str] = {}
        for ta_name in self.type_alias_names:
            if ta_name in self.all_type_names or ta_name in self.all_enum_names:
                self._alias_linkml_name[ta_name] = ta_name + "Type"
            else:
                self._alias_linkml_name[ta_name] = ta_name

        # Build heuristic codelist index: shortName base -> CodelistInfo
        # e.g. "assetClassScheme" -> strip "Scheme" -> "assetClass" -> key
        self._codelist_by_shortname: dict[str, CodelistInfo] = {}
        for cl in self.codelists.values():
            if cl.short_name:
                base = cl.short_name.replace("Scheme", "")
                self._codelist_by_shortname[base] = cl

        # Pre-compute global slot ownership and canonical definitions.
        # Each slot name is defined ONCE in the first module (alphabetically)
        # that uses it.  Other modules use slot_usage for overrides.
        self._slot_owner: dict[str, str] = {}  # slot_name -> namespace
        self._canonical_slots: dict[str, dict] = {}  # slot_name -> slot_def

        # Detect slots that have an enum range in *any* usage.  These must
        # not carry inlined_as_list on the canonical definition because
        # LinkML gen-project rejects inlined enumerations even when a
        # slot_usage overrides it to false.
        self._slots_with_enum_range: set[str] = set()
        for mod in modules.values():
            for t in mod.types:
                for attr in t.attributes:
                    resolved = self._resolve_range(attr.type_name)
                    if resolved in self.all_enum_names:
                        self._slots_with_enum_range.add(attr.name)

        for ns, mod in sorted(self.modules.items()):
            for t in mod.types:
                for attr in t.attributes:
                    safe = safe_slot_name(attr.name)
                    if safe not in self._slot_owner:
                        self._slot_owner[safe] = ns
                        self._canonical_slots[safe] = (
                            self._build_slot_def(attr, t)
                        )

    def _resolve_range(self, type_name: str) -> str:
        """Resolve a Rosetta type name to a LinkML range."""
        if type_name in ROSETTA_TYPE_MAP:
            return ROSETTA_TYPE_MAP[type_name]
        if type_name in self.all_type_names:
            return type_name
        if type_name in self.all_enum_names:
            return type_name
        if type_name in self.type_alias_names:
            return self._alias_linkml_name[type_name]
        if type_name in self.all_choice_names:
            return type_name  # choice is an abstract class
        return type_name  # assume it's a class defined elsewhere

    def _compute_module_imports(self, mod: RosettaModule) -> list[str]:
        """Compute the LinkML import list for a module."""
        linkml_imports = ["linkml:types"]

        # Collect referenced types to see which modules we need
        referenced_types: set[str] = set()
        for t in mod.types:
            if t.extends:
                referenced_types.add(t.extends)
            for attr in t.attributes:
                if attr.type_name not in ROSETTA_TYPE_MAP:
                    referenced_types.add(attr.type_name)
        for c in mod.choices:
            for alt in c.alternatives:
                if alt.type_name not in ROSETTA_TYPE_MAP:
                    referenced_types.add(alt.type_name)

        # Map referenced types to their source namespaces
        needed_ns: set[str] = set()
        for ref_type in referenced_types:
            for ns, other_mod in self.modules.items():
                if ns == mod.namespace:
                    continue
                for t in other_mod.types:
                    if t.name == ref_type:
                        needed_ns.add(ns)
                for e in other_mod.enums:
                    if e.name == ref_type:
                        needed_ns.add(ns)
                for ta in other_mod.type_aliases:
                    if ta.name == ref_type:
                        needed_ns.add(ns)
                for ch in other_mod.choices:
                    if ch.name == ref_type:
                        needed_ns.add(ns)

        for ns in sorted(needed_ns):
            linkml_imports.append(namespace_to_import(ns))

        return linkml_imports

    def _enum_scheme_uris(self, e: RosettaEnum) -> list[str]:
        """Extract schemeLocation URIs from enum docReferences."""
        return [
            dr.segment_value
            for dr in e.doc_references
            if dr.segment_type == "schemeLocation" and dr.segment_value
        ]

    def _build_enum_notes(self, e: RosettaEnum) -> list[str]:
        """Build notes list from non-scheme docReferences."""
        return [
            format_doc_ref_comment(dr)
            for dr in e.doc_references
            if dr.segment_type != "schemeLocation"
        ]

    def _match_codelist(self, scheme_uri: str) -> Optional[CodelistInfo]:
        """Find a codelist matching the given scheme URI."""
        return self.codelists.get(scheme_uri)

    def _match_codelist_heuristic(self, enum_name: str) -> Optional[CodelistInfo]:
        """Heuristically match an enum to a codelist by shortName.

        Strip 'Enum' suffix and convert first char to lowercase to get
        the base key (e.g. AssetClassEnum -> assetClass), then look up
        in the shortName index.
        """
        base = enum_name.replace("Enum", "")
        if base:
            camel = base[0].lower() + base[1:]
            return self._codelist_by_shortname.get(camel)
        return None

    def _type_close_mappings(self, type_name: str) -> list[str]:
        """Build close_mappings from synonym sources for a type."""
        mappings: list[str] = []
        for source, type_map in sorted(self.synonym_types.items()):
            if type_name in type_map:
                prefix = SYNONYM_PREFIX_MAP.get(source, source.lower())
                mappings.append(f"{prefix}:{type_name}")
        return mappings

    def _apply_ecosystem_mappings(self, name: str, defn: dict) -> None:
        """Merge ecosystem SSSOM mappings into a class/enum definition in place.

        For each predicate present in the loaded mapping set, the target CURIEs
        are appended (de-duplicated) to the corresponding LinkML mapping slot
        (e.g. ``close_mappings``). Existing entries are preserved.
        """
        slot_map = self.ecosystem_mappings.by_name.get(name)
        if not slot_map:
            return
        for slot, curies in slot_map.items():
            existing = defn.get(slot)
            if existing is None:
                defn[slot] = list(curies)
            else:
                for c in curies:
                    if c not in existing:
                        existing.append(c)

    def _module_ecosystem_prefixes(self, mod: RosettaModule) -> set[str]:
        """Return the set of ecosystem prefixes referenced by classes/enums in a module."""
        prefixes: set[str] = set()
        for t in mod.types:
            prefixes |= self.ecosystem_mappings.prefixes_for(t.name)
        for e in mod.enums:
            prefixes |= self.ecosystem_mappings.prefixes_for(e.name)
        return prefixes

    # ------------------------------------------------------------------
    # Slot definition helpers (global dedup)
    # ------------------------------------------------------------------

    PRIMITIVE_RANGES = frozenset({
        "string", "integer", "decimal", "boolean",
        "date", "time", "datetime", "float",
    })

    def _build_slot_def(
        self, attr: RosettaAttribute, t: RosettaType
    ) -> dict:
        """Build a canonical schema-level slot definition from an attribute."""
        range_val = self._resolve_range(attr.type_name)
        slot_def: dict = {"range": range_val}
        if attr.description:
            slot_def["description"] = attr.description

        # When range is a choice/union type, add any_of so that
        # gen-json-schema emits anyOf refs for each alternative.
        alts = self._choice_alternatives.get(range_val)
        if alts:
            slot_def["any_of"] = [{"range": a} for a in alts]

        min_card, max_card = self._parse_cardinality(attr.cardinality)
        if min_card >= 1:
            slot_def["required"] = True
        is_multi = max_card == "*" or (max_card.isdigit() and int(max_card) > 1)
        if is_multi:
            slot_def["multivalued"] = True
            if (
                range_val not in self.PRIMITIVE_RANGES
                and range_val not in self.all_enum_names
                and attr.name not in self._slots_with_enum_range
            ):
                slot_def["inlined_as_list"] = True

        if "key" in t.metadata and attr.name in ("id", "identifier"):
            slot_def["identifier"] = True

        if attr.deprecated:
            slot_def["deprecated"] = "Deprecated in CDM"

        # annotations
        slot_annot: dict = {}
        if "scheme" in attr.metadata:
            slot_annot["metadata_scheme"] = True
        if "reference" in attr.metadata:
            slot_annot["metadata_reference"] = True
        if slot_annot:
            slot_def["annotations"] = slot_annot

        # related_mappings from ICMA
        related: list[str] = []
        for dr in attr.doc_references:
            if dr.segment_type == "namingConvention" and dr.segment_value:
                curie = (
                    f"icma:{dr.corpus}"
                    f"#{dr.segment_value.replace(' ', '_')}"
                )
                if curie not in related:
                    related.append(curie)
        if related:
            slot_def["related_mappings"] = related

        # notes from docReferences
        slot_notes: list[str] = []
        for dr in attr.doc_references:
            if dr.segment_type != "namingConvention":
                slot_notes.append(format_doc_ref_comment(dr))
        if slot_notes:
            slot_def["notes"] = slot_notes

        # close_mappings from synonym attribute-level mappings
        slot_close: list[str] = []
        for source, type_map in sorted(self.synonym_slots.items()):
            attrs = type_map.get(t.name, [])
            if attr.name in attrs:
                prefix = SYNONYM_PREFIX_MAP.get(source, source.lower())
                curie = f"{prefix}:{t.name}.{attr.name}"
                if curie not in slot_close:
                    slot_close.append(curie)
        if slot_close:
            slot_def["close_mappings"] = slot_close

        return slot_def

    def _build_slot_usage(
        self, attr: RosettaAttribute, canonical: dict
    ) -> dict:
        """Build a slot_usage override dict by diffing against the canonical."""
        range_val = self._resolve_range(attr.type_name)
        min_card, max_card = self._parse_cardinality(attr.cardinality)

        usage: dict = {}
        if range_val != canonical.get("range"):
            usage["range"] = range_val
            # When the canonical slot omits inlined_as_list (because some
            # usage has an enum range), restore it for class-range usages.
            if (
                not canonical.get("inlined_as_list")
                and canonical.get("multivalued")
                and range_val not in self.PRIMITIVE_RANGES
                and range_val not in self.all_enum_names
            ):
                usage["inlined_as_list"] = True
        if attr.description and attr.description != canonical.get("description"):
            usage["description"] = attr.description
        if min_card >= 1 and not canonical.get("required"):
            usage["required"] = True
        elif min_card == 0 and canonical.get("required"):
            usage["required"] = False
        is_multi = max_card == "*" or (max_card.isdigit() and int(max_card) > 1)
        if is_multi and not canonical.get("multivalued"):
            usage["multivalued"] = True
        elif not is_multi and canonical.get("multivalued"):
            usage["multivalued"] = False
        if attr.deprecated and not canonical.get("deprecated"):
            usage["deprecated"] = "Deprecated in CDM"
        return usage

    def generate_module(self, mod: RosettaModule) -> dict:
        """Generate a LinkML schema dict for a single module."""
        mod_name = namespace_to_module_name(mod.namespace)

        # Determine which enrichment prefixes are needed
        needs_icma = any(
            dr.body == "ICMA"
            for t in mod.types
            for dr in t.doc_references
        ) or any(
            dr.body == "ICMA"
            for t in mod.types
            for attr in t.attributes
            for dr in attr.doc_references
        )
        needs_isda = any(
            dr.body == "ISDA"
            for t in mod.types
            for dr in t.doc_references
        )
        needs_ore = any(
            t.name in self.synonym_types.get("ORE_1_0_39", {})
            or t.name in self.synonym_types.get("ORE", {})
            for t in mod.types
        )
        needs_createiq = any(
            t.name in self.synonym_types.get("CreateiQ_1_0", {})
            or t.name in self.synonym_types.get("CreateiQ", {})
            for t in mod.types
        )
        needs_fis = any(
            t.name in self.synonym_types.get("FIS", {})
            or t.name in self.synonym_types.get("FIS_BASE", {})
            or t.name in self.synonym_slots.get("FIS", {})
            or t.name in self.synonym_slots.get("FIS_BASE", {})
            for t in mod.types
        )
        needs_fpml_5_10 = any(
            t.name in self.synonym_types.get("FpML_5_10", {})
            or t.name in self.synonym_slots.get("FpML_5_10", {})
            for t in mod.types
        )

        prefixes: dict = {
            "common_domain_model": self.CDM_PREFIX,
            "linkml": "https://w3id.org/linkml/",
            "schema": "http://schema.org/",
            "fpml": self.FPML_PREFIX,
        }
        if needs_icma:
            prefixes["icma"] = self.ICMA_PREFIX
        if needs_isda:
            prefixes["isda"] = self.ISDA_PREFIX
        if needs_ore:
            prefixes["ore"] = "https://www.opensourcerisk.org/documentation/"
        if needs_createiq:
            prefixes["createiq"] = "https://www.isda.org/create-iq/"
        if needs_fis:
            prefixes["fis"] = "https://www.fisglobal.com/"
        if needs_fpml_5_10:
            prefixes["fpml_5_10"] = self.FPML_5_10_PREFIX
        # Ecosystem prefixes referenced by SSSOM mappings on this module
        for px in sorted(self._module_ecosystem_prefixes(mod)):
            if px not in prefixes and px in ECOSYSTEM_PREFIX_URIS:
                prefixes[px] = ECOSYSTEM_PREFIX_URIS[px]

        schema: dict = {
            "id": f"{self.CDM_ID}/{mod_name}",
            "name": mod_name,
            "description": mod.description
            or f"LinkML schema for {mod.namespace}",
            "license": "Apache-2.0",
            "see_also": ["https://cdm.finos.org/"],
            "prefixes": prefixes,
            "default_prefix": "common_domain_model",
            "default_range": "string",
            "imports": self._compute_module_imports(mod),
        }

        # --- Enrichment: schema-level comments (body/corpus + function sigs) ---
        # Built early so the key appears right after imports in the YAML.
        schema_comments: list[str] = list(mod.body_corpus_comments)
        if mod.functions:
            for func in mod.functions:
                sig = f"Rosetta func: {func.name}"
                if func.description:
                    sig += f" \u2014 {func.description}"
                parts = []
                if func.inputs:
                    inputs_str = ", ".join(
                        f"{p.name}: {p.type_name} ({p.cardinality})"
                        for p in func.inputs
                    )
                    parts.append(f"inputs({inputs_str})")
                if func.output:
                    parts.append(
                        f"output({func.output.name}: {func.output.type_name}"
                        f" ({func.output.cardinality}))"
                    )
                if parts:
                    sig += f" | {' | '.join(parts)}"
                schema_comments.append(sig)
        if schema_comments:
            schema["comments"] = schema_comments

        # --- Enrichment: structured function annotations (machine-readable) ---
        # Annotation values must be scalars (not arrays/objects) for linkml-lint
        # and linkml-runtime compatibility. Serialize as a JSON string.
        if mod.functions:
            func_annotations = [_func_to_annotation(f) for f in mod.functions]
            schema["annotations"] = {"rosetta_functions": json.dumps(func_annotations, separators=(',', ':'))}

        # Subsets — one subset per module, named after the module
        schema["subsets"] = {mod_name: {"description": f"Classes defined in the {mod_name} module."}}

        # Types (custom scalars from typeAliases)
        # Colliding names get a 'Type' suffix via _alias_linkml_name.
        if mod.type_aliases:
            types_dict = {}
            for ta in mod.type_aliases:
                linkml_name = self._alias_linkml_name[ta.name]
                ta_def: dict = {
                    "uri": "xsd:string",
                    "base": "str",
                }
                if ta.domain:
                    ta_def["description"] = (
                        f"FpML coding scheme constrained to domain '{ta.domain}'"
                    )
                    ta_def["see_also"] = [f"{self.FPML_PREFIX}{ta.domain}"]
                types_dict[linkml_name] = ta_def
            if types_dict:
                schema["types"] = types_dict

        # Enums (with enrichment)
        if mod.enums:
            enums_dict = {}
            for e in mod.enums:
                e_def: dict = {}
                if e.description:
                    e_def["description"] = e.description
                if e.extends:
                    e_def["inherits"] = [e.extends]
                if e.deprecated:
                    e_def["deprecated"] = (
                        "Deprecated in CDM — use codelist type aliases instead"
                    )

                # --- Enrichment: exact_mappings from schemeLocation ---
                scheme_uris = self._enum_scheme_uris(e)
                if scheme_uris:
                    e_def["exact_mappings"] = scheme_uris

                # --- Enrichment: notes from non-scheme docReferences ---
                enum_notes = self._build_enum_notes(e)
                if enum_notes:
                    e_def["notes"] = enum_notes

                # --- Build permissible_values with optional meaning ---
                # Find codelist: first try explicit schemeLocation, then heuristic
                matched_codelist: Optional[CodelistInfo] = None
                for uri in scheme_uris:
                    matched_codelist = self._match_codelist(uri)
                    if matched_codelist:
                        break
                if not matched_codelist:
                    matched_codelist = self._match_codelist_heuristic(e.name)
                    if matched_codelist and not scheme_uris:
                        # Add heuristic exact_mappings from codelist canonicalUri
                        if "exact_mappings" not in e_def:
                            e_def["exact_mappings"] = []
                        e_def["exact_mappings"].append(
                            matched_codelist.canonical_uri
                        )

                if e.values:
                    pvs: dict = {}
                    for v in e.values:
                        v_def: dict = {}
                        if v.description:
                            v_def["description"] = v.description
                        elif v.display_name:
                            v_def["description"] = v.display_name
                        if v.display_name:
                            v_def["aliases"] = [v.display_name]
                        # --- Enrichment: meaning from codelist ---
                        if (
                            matched_codelist
                            and v.name in matched_codelist.codes
                        ):
                            v_def["meaning"] = (
                                f"{matched_codelist.canonical_version_uri}"
                                f"#{v.name}"
                            )
                        pvs[v.name] = v_def if v_def else {}
                    e_def["permissible_values"] = pvs

                # --- Enrichment: ecosystem SSSOM mappings ---
                self._apply_ecosystem_mappings(e.name, e_def)

                enums_dict[e.name] = e_def
            schema["enums"] = enums_dict

        # Slots (schema-level) and Classes (with enrichment)
        slots_dict: dict = {}
        classes_dict: dict = {}

        if mod.types or mod.choices:

            for t in mod.types:
                cls_def: dict = {}
                if t.description:
                    cls_def["description"] = t.description
                if t.extends:
                    cls_def["is_a"] = t.extends
                if t.is_root_type:
                    cls_def["tree_root"] = True

                # --- Enrichment: deprecated ---
                if t.deprecated:
                    cls_def["deprecated"] = "Deprecated in CDM"

                # --- Enrichment: annotations from type metadata ---
                type_annotations: dict = {}
                if "key" in t.metadata:
                    type_annotations["metadata_key"] = True
                if type_annotations:
                    cls_def["annotations"] = type_annotations

                # --- Enrichment: notes from type docReferences ---
                type_notes = [
                    format_doc_ref_comment(dr)
                    for dr in t.doc_references
                    if dr.segment_type != "schemeLocation"
                ]
                if type_notes:
                    cls_def["notes"] = type_notes

                # --- Enrichment: see_also from ISDA/ICMA corpus references ---
                type_see_also: list[str] = []
                seen_corpus: set[str] = set()
                for dr in t.doc_references:
                    corpus_key = f"{dr.body}:{dr.corpus}"
                    if corpus_key not in seen_corpus:
                        seen_corpus.add(corpus_key)
                        if dr.body == "ISDA":
                            type_see_also.append(f"isda:{dr.corpus}")
                        elif dr.body == "ICMA":
                            type_see_also.append(f"icma:{dr.corpus}")
                if type_see_also:
                    cls_def["see_also"] = type_see_also

                # --- Enrichment: close_mappings from synonym sources ---
                close_maps = self._type_close_mappings(t.name)
                if close_maps:
                    cls_def["close_mappings"] = close_maps

                # --- Enrichment: ecosystem SSSOM mappings ---
                self._apply_ecosystem_mappings(t.name, cls_def)

                # --- Enrichment: conditions -> rules + comments ---
                cond_comments: list[str] = []
                if t.conditions:
                    rules: list[dict] = []
                    for cond in t.conditions:
                        rule = _condition_to_rule(cond)
                        if rule:
                            rules.append(rule)
                        # Always emit a comment with the full expression
                        label = f"Rosetta condition: {cond.name}"
                        if cond.body:
                            label += f" \u2014 {cond.body}"
                        cond_comments.append(label)
                    if rules:
                        # Ensure every rule has preconditions (even empty)
                        # to work around gen-doc template iterating over None.
                        for r in rules:
                            r.setdefault("preconditions", {})
                        cls_def["rules"] = rules

                # --- Enrichment: associated functions as comments ---
                associated_funcs: list[RosettaFunction] = []
                for func in mod.functions:
                    is_associated = (
                        any(p.type_name == t.name for p in func.inputs)
                        or (func.output and func.output.type_name == t.name)
                    )
                    if is_associated:
                        sig = f"Rosetta func: {func.name}"
                        if func.description:
                            sig += f" \u2014 {func.description}"
                        cond_comments.append(sig)
                        associated_funcs.append(func)

                if cond_comments:
                    cls_def["comments"] = cond_comments

                # --- Enrichment: structured function annotations on classes ---
                # Annotation values must be scalars for linkml-lint and
                # linkml-runtime compatibility. Serialize as a JSON string.
                if associated_funcs:
                    cls_annotations = cls_def.get("annotations", {})
                    cls_annotations["rosetta_functions"] = json.dumps(
                        [_func_to_annotation(f) for f in associated_funcs],
                        separators=(',', ':'),
                    )
                    cls_def["annotations"] = cls_annotations

                cls_slots: list[str] = []
                slot_usage: dict = {}

                for attr in t.attributes:
                    slot_name = safe_slot_name(attr.name)
                    is_owner = (
                        self._slot_owner.get(slot_name) == mod.namespace
                    )

                    if is_owner and slot_name not in slots_dict:
                        # This module owns the slot — define at schema level
                        slots_dict[slot_name] = self._canonical_slots[
                            slot_name
                        ]
                    else:
                        # Slot defined elsewhere or already in this module
                        canonical = self._canonical_slots.get(
                            slot_name, {}
                        )
                        usage = self._build_slot_usage(attr, canonical)
                        if usage:
                            slot_usage[slot_name] = usage

                    cls_slots.append(slot_name)

                if cls_slots:
                    cls_def["slots"] = cls_slots
                if slot_usage:
                    cls_def["slot_usage"] = slot_usage

                cls_def["in_subset"] = [mod_name]
                classes_dict[t.name] = cls_def

            # Choices -> abstract classes with union_of alternatives
            for c in mod.choices:
                cls_def = {
                    "abstract": True,
                    "description": c.description
                    or "Union type: exactly one alternative must be selected.",
                    "comments": [
                        "Generated from Rosetta 'choice' construct"
                        " — represents a union/one-of type."
                    ],
                }
                # List alternatives as union_of
                union_of = [alt.type_name for alt in c.alternatives]
                if union_of:
                    cls_def["union_of"] = union_of
                cls_def["in_subset"] = [mod_name]
                classes_dict[c.name] = cls_def

        if slots_dict:
            schema["slots"] = slots_dict
        if classes_dict:
            schema["classes"] = classes_dict

        # Add imports for modules that own slots referenced by this module
        for t in mod.types:
            for attr in t.attributes:
                owner_ns = self._slot_owner.get(attr.name)
                if owner_ns and owner_ns != mod.namespace:
                    imp = namespace_to_import(owner_ns)
                    if imp not in schema["imports"]:
                        schema["imports"].append(imp)

        return schema

    @staticmethod
    def _parse_cardinality(card: str) -> tuple[int, str]:
        """Parse '0..1' -> (0, '1'), '1..*' -> (1, '*')."""
        parts = card.split("..")
        min_c = int(parts[0])
        max_c = parts[1]
        return min_c, max_c

    def generate_root_schema(self) -> dict:
        """Generate the root common_domain_model.yaml that imports all modules with schema elements."""
        imports = ["linkml:types"]
        for ns, mod in sorted(self.modules.items()):
            if mod.types or mod.enums or mod.type_aliases or mod.choices or mod.body_corpus_comments:
                imports.append(namespace_to_import(ns))

        prefixes: dict[str, str] = {
            "common_domain_model": self.CDM_PREFIX,
            "linkml": "https://w3id.org/linkml/",
            "schema": "http://schema.org/",
            "fpml": self.FPML_PREFIX,
            "fpml_5_10": self.FPML_5_10_PREFIX,
            "isda": self.ISDA_PREFIX,
            "icma": self.ICMA_PREFIX,
        }
        # Ecosystem prefixes referenced by SSSOM mappings (anywhere)
        for px in sorted(self.ecosystem_mappings.used_prefixes):
            if px not in prefixes and px in ECOSYSTEM_PREFIX_URIS:
                prefixes[px] = ECOSYSTEM_PREFIX_URIS[px]

        return {
            "id": self.CDM_ID,
            "name": "common_domain_model",
            "description": "FINOS Common Domain Model (CDM) — LinkML schema",
            "license": "Apache-2.0",
            "see_also": [
                "https://cdm.finos.org/",
                "https://github.com/finos/common-domain-model",
            ],
            "prefixes": prefixes,
            "source": (
                "https://github.com/finos/common-domain-model/"
                "tree/master/rosetta-source/src/main/rosetta"
            ),
            "default_prefix": "common_domain_model",
            "default_range": "string",
            "imports": imports,
        }


# ---------------------------------------------------------------------------
# SSSOM TSV generators
# ---------------------------------------------------------------------------

CONSTRUCT_SSSOM_HEADER = """\
#curie_map:
#  cdm.rosetta: https://cdm.finos.org/rosetta/
#  common_domain_model: https://w3id.org/lmodel/common_domain_model/
#  linkml: https://w3id.org/linkml/
#  semapv: https://w3id.org/semapv/vocab/
"""

EXTERNAL_SSSOM_HEADER = """\
#curie_map:
#  common_domain_model: https://w3id.org/lmodel/common_domain_model/
#  fpml: http://www.fpml.org/coding-scheme/
#  isda: https://www.isda.org/specifications/
#  icma: https://www.icmagroup.org/market-practice-and-regulatory-policy/
#  iso: https://www.iso.org/standard/
#  ore: https://www.opensourcerisk.org/documentation/
#  createiq: https://www.isda.org/create-iq/
#  fis: https://www.fisglobal.com/
#  skos: http://www.w3.org/2004/02/skos/core#
#  semapv: https://w3id.org/semapv/vocab/
"""

SSSOM_COLUMNS = [
    "subject_id",
    "subject_label",
    "subject_source",
    "predicate_id",
    "object_id",
    "object_label",
    "object_source",
    "mapping_justification",
    "comment",
]


def generate_construct_sssom(
    modules: dict[str, RosettaModule],
) -> list[dict[str, str]]:
    """Generate SSSOM mapping rows from Rosetta -> LinkML constructs."""
    rows = []

    # Build alias rename map (same logic as LinkMLGenerator)
    all_type_names: set[str] = set()
    all_enum_names: set[str] = set()
    alias_names: set[str] = set()
    for m in modules.values():
        for t in m.types:
            all_type_names.add(t.name)
        for e in m.enums:
            all_enum_names.add(e.name)
        for ta in m.type_aliases:
            alias_names.add(ta.name)
    alias_linkml_name: dict[str, str] = {}
    for ta_name in alias_names:
        if ta_name in all_type_names or ta_name in all_enum_names:
            alias_linkml_name[ta_name] = ta_name + "Type"
        else:
            alias_linkml_name[ta_name] = ta_name

    for ns, mod in sorted(modules.items()):
        mod_name = namespace_to_module_name(ns)

        # Namespace -> module
        rows.append(
            {
                "subject_id": f"cdm.rosetta:{ns}",
                "subject_label": ns,
                "subject_source": "cdm.rosetta",
                "predicate_id": "skos:exactMatch",
                "object_id": f"common_domain_model:{mod_name}",
                "object_label": mod_name,
                "object_source": "common_domain_model",
                "mapping_justification": "semapv:ManualMappingCuration",
                "comment": "Rosetta namespace -> LinkML module",
            }
        )

        # Types -> classes
        for t in mod.types:
            rows.append(
                {
                    "subject_id": f"cdm.rosetta:{ns}.{t.name}",
                    "subject_label": f"type {t.name}",
                    "subject_source": "cdm.rosetta",
                    "predicate_id": "skos:exactMatch",
                    "object_id": f"common_domain_model:{t.name}",
                    "object_label": f"class {t.name}",
                    "object_source": "common_domain_model",
                    "mapping_justification": "semapv:ManualMappingCuration",
                    "comment": f"Rosetta type -> LinkML class in {mod_name}",
                }
            )

            # Attributes -> slots
            for attr in t.attributes:
                rows.append(
                    {
                        "subject_id": f"cdm.rosetta:{ns}.{t.name}.{attr.name}",
                        "subject_label": f"{t.name}.{attr.name}",
                        "subject_source": "cdm.rosetta",
                        "predicate_id": "skos:exactMatch",
                        "object_id": f"common_domain_model:{attr.name}",
                        "object_label": f"slot {attr.name}",
                        "object_source": "common_domain_model",
                        "mapping_justification": "semapv:ManualMappingCuration",
                        "comment": (
                            f"Rosetta attr ({attr.cardinality}) -> LinkML slot"
                        ),
                    }
                )

        # Enums
        for e in mod.enums:
            rows.append(
                {
                    "subject_id": f"cdm.rosetta:{ns}.{e.name}",
                    "subject_label": f"enum {e.name}",
                    "subject_source": "cdm.rosetta",
                    "predicate_id": "skos:exactMatch",
                    "object_id": f"common_domain_model:{e.name}",
                    "object_label": f"enum {e.name}",
                    "object_source": "common_domain_model",
                    "mapping_justification": "semapv:ManualMappingCuration",
                    "comment": f"Rosetta enum -> LinkML enum in {mod_name}",
                }
            )

        # TypeAliases -> types (renamed if colliding)
        for ta in mod.type_aliases:
            linkml_name = alias_linkml_name[ta.name]
            rows.append(
                {
                    "subject_id": f"cdm.rosetta:{ns}.{ta.name}",
                    "subject_label": f"typeAlias {ta.name}",
                    "subject_source": "cdm.rosetta",
                    "predicate_id": "skos:exactMatch",
                    "object_id": f"common_domain_model:{linkml_name}",
                    "object_label": f"type {linkml_name}",
                    "object_source": "common_domain_model",
                    "mapping_justification": "semapv:ManualMappingCuration",
                    "comment": f"Rosetta typeAlias -> LinkML custom type in {mod_name}",
                }
            )

        # Choices -> abstract classes
        for c in mod.choices:
            rows.append(
                {
                    "subject_id": f"cdm.rosetta:{ns}.{c.name}",
                    "subject_label": f"choice {c.name}",
                    "subject_source": "cdm.rosetta",
                    "predicate_id": "skos:exactMatch",
                    "object_id": f"common_domain_model:{c.name}",
                    "object_label": f"abstract class {c.name}",
                    "object_source": "common_domain_model",
                    "mapping_justification": "semapv:ManualMappingCuration",
                    "comment": f"Rosetta choice -> LinkML abstract class in {mod_name}",
                }
            )

    return rows


def _match_codelist_heuristic_standalone(
    enum_name: str, codelists: dict[str, CodelistInfo]
) -> Optional[CodelistInfo]:
    """Heuristic codelist match by shortName (standalone function version)."""
    base = enum_name.replace("Enum", "")
    if base:
        camel = base[0].lower() + base[1:]
        for cl in codelists.values():
            if cl.short_name:
                sn_base = cl.short_name.replace("Scheme", "")
                if sn_base == camel:
                    return cl
    return None


# ---------------------------------------------------------------------------
# Gap 2 helpers: External schema element mining
# ---------------------------------------------------------------------------

# Generic/ambiguous names to exclude from lexical matching
_GENERIC_NAMES = frozenset({
    "type", "id", "name", "value", "date", "amount", "currency",
    "description", "identifier", "index_", "source", "status",
    "period", "rate", "price", "unit", "global_",
})


def _snake_to_camel(name: str) -> str:
    """Convert snake_case to camelCase."""
    parts = name.split("_")
    return parts[0] + "".join(p.capitalize() for p in parts[1:])


def _parse_ore_xsd_elements(schema_dir: Path) -> dict[str, str]:
    """Parse ORE XSD files and extract element names with their parent type.

    Returns: {element_name: parent_complexType_name}
    """
    import xml.etree.ElementTree as ET

    ore_dir = schema_dir / "ore-1-0-39"
    if not ore_dir.is_dir():
        return {}

    XS = "{http://www.w3.org/2001/XMLSchema}"
    elements: dict[str, str] = {}  # elem_name -> parent_type

    for xsd_file in sorted(ore_dir.glob("*.xsd")):
        try:
            tree = ET.parse(xsd_file)
        except ET.ParseError:
            continue
        root = tree.getroot()

        # Top-level named elements
        for elem in root.findall(f"{XS}element"):
            name = elem.get("name")
            if name:
                elements.setdefault(name, "")

        # Elements inside complexTypes
        for ct in root.findall(f".//{XS}complexType"):
            ct_name = ct.get("name", "")
            for elem in ct.findall(f".//{XS}element"):
                name = elem.get("name")
                if name:
                    elements.setdefault(name, ct_name)

        # Elements inside groups
        for grp in root.findall(f".//{XS}group"):
            grp_name = grp.get("name", "")
            for elem in grp.findall(f".//{XS}element"):
                name = elem.get("name")
                if name:
                    elements.setdefault(name, grp_name)

    return elements


def _parse_createiq_json_fields(schema_dir: Path) -> set[str]:
    """Parse CreateiQ JSON Schema files and extract unique field names.

    Returns: set of field name strings.
    """
    createiq_dir = schema_dir / "createiq"
    if not createiq_dir.is_dir():
        return set()

    all_names: set[str] = set()

    def _collect_names(node: object) -> None:
        if isinstance(node, dict):
            n = node.get("name")
            if isinstance(n, str) and n:
                all_names.add(n)
            elif isinstance(n, dict):
                suffix = n.get("suffix", "")
                if isinstance(suffix, str) and suffix:
                    all_names.add(suffix.lstrip("_"))
            for v in node.values():
                _collect_names(v)
        elif isinstance(node, list):
            for item in node:
                _collect_names(item)

    for json_file in sorted(createiq_dir.glob("*.json")):
        try:
            with open(json_file, encoding="utf-8") as fh:
                data = json.load(fh)
        except (json.JSONDecodeError, UnicodeDecodeError):
            continue
        _collect_names(data)

    return all_names


def generate_external_sssom(
    modules: dict[str, RosettaModule],
    codelists: dict[str, CodelistInfo],
    synonym_types: dict[str, dict[str, str]],
    synonym_slots: Optional[dict[str, dict[str, list[str]]]] = None,
    schema_dir: Optional[Path] = None,
) -> list[dict[str, str]]:
    """Generate external mapping SSSOM rows (CDM <-> FpML/ISDA/ICMA/ORE/etc.)."""
    rows: list[dict[str, str]] = []

    # Build heuristic codelist index for standalone use
    codelist_by_shortname: dict[str, CodelistInfo] = {}
    for cl in codelists.values():
        if cl.short_name:
            base = cl.short_name.replace("Scheme", "")
            codelist_by_shortname[base] = cl

    for ns, mod in sorted(modules.items()):

        # ----- Enum -> FpML scheme exact mappings -----
        for e in mod.enums:
            for dr in e.doc_references:
                if dr.segment_type == "schemeLocation" and dr.segment_value:
                    rows.append(
                        {
                            "subject_id": f"common_domain_model:{e.name}",
                            "subject_label": e.name,
                            "subject_source": "common_domain_model",
                            "predicate_id": "skos:exactMatch",
                            "object_id": dr.segment_value,
                            "object_label": dr.corpus,
                            "object_source": dr.body,
                            "mapping_justification": "semapv:ManualMappingCuration",
                            "comment": f"CDM enum -> {dr.body} coding scheme",
                        }
                    )

                    # Per-value mappings from matched codelist
                    cl = codelists.get(dr.segment_value)
                    if cl:
                        for v in e.values:
                            if v.name in cl.codes:
                                rows.append(
                                    {
                                        "subject_id": f"common_domain_model:{e.name}.{v.name}",
                                        "subject_label": v.name,
                                        "subject_source": "common_domain_model",
                                        "predicate_id": "skos:exactMatch",
                                        "object_id": f"{cl.canonical_version_uri}#{v.name}",
                                        "object_label": v.name,
                                        "object_source": dr.body,
                                        "mapping_justification": "semapv:LexicalMatching",
                                        "comment": "CDM enum value -> FpML code",
                                    }
                                )

            # ----- Heuristic codelist matching for enums without schemeLocation -----
            has_scheme = any(
                dr.segment_type == "schemeLocation"
                for dr in e.doc_references
            )
            if not has_scheme:
                cl = _match_codelist_heuristic_standalone(e.name, codelists)
                if cl:
                    rows.append(
                        {
                            "subject_id": f"common_domain_model:{e.name}",
                            "subject_label": e.name,
                            "subject_source": "common_domain_model",
                            "predicate_id": "skos:exactMatch",
                            "object_id": cl.canonical_uri,
                            "object_label": cl.short_name,
                            "object_source": "FpML",
                            "mapping_justification": "semapv:LexicalMatching",
                            "comment": "CDM enum -> codelist (heuristic shortName match)",
                        }
                    )
                    for v in e.values:
                        if v.name in cl.codes:
                            rows.append(
                                {
                                    "subject_id": f"common_domain_model:{e.name}.{v.name}",
                                    "subject_label": v.name,
                                    "subject_source": "common_domain_model",
                                    "predicate_id": "skos:exactMatch",
                                    "object_id": f"{cl.canonical_version_uri}#{v.name}",
                                    "object_label": v.name,
                                    "object_source": "FpML",
                                    "mapping_justification": "semapv:LexicalMatching",
                                    "comment": "CDM enum value -> FpML code (heuristic)",
                                }
                            )

        # ----- Type -> ISDA/ICMA document references -----
        for t in mod.types:
            seen_corpus: set[str] = set()
            for dr in t.doc_references:
                corpus_key = f"{dr.body}:{dr.corpus}"
                if corpus_key in seen_corpus:
                    continue
                seen_corpus.add(corpus_key)
                rows.append(
                    {
                        "subject_id": f"common_domain_model:{t.name}",
                        "subject_label": t.name,
                        "subject_source": "common_domain_model",
                        "predicate_id": "skos:relatedMatch",
                        "object_id": f"isda:{dr.corpus}"
                        if dr.body == "ISDA"
                        else f"icma:{dr.corpus}",
                        "object_label": dr.corpus,
                        "object_source": dr.body,
                        "mapping_justification": "semapv:ManualMappingCuration",
                        "comment": format_doc_ref_comment(dr),
                    }
                )

            # ----- Attribute -> ICMA naming conventions -----
            for attr in t.attributes:
                for dr in attr.doc_references:
                    if (
                        dr.segment_type == "namingConvention"
                        and dr.segment_value
                    ):
                        rows.append(
                            {
                                "subject_id": f"common_domain_model:{attr.name}",
                                "subject_label": f"{t.name}.{attr.name}",
                                "subject_source": "common_domain_model",
                                "predicate_id": "skos:relatedMatch",
                                "object_id": f"icma:{dr.corpus}#{dr.segment_value.replace(' ', '_')}",
                                "object_label": f"{dr.corpus} {dr.segment_value}",
                                "object_source": dr.body,
                                "mapping_justification": "semapv:ManualMappingCuration",
                                "comment": f"CDM slot -> {dr.body} naming convention",
                            }
                        )

    # ----- Synonym source -> close_match -----
    for source, type_map in sorted(synonym_types.items()):
        prefix = SYNONYM_PREFIX_MAP.get(source, source.lower())
        for cdm_type in sorted(type_map.keys()):
            rows.append(
                {
                    "subject_id": f"common_domain_model:{cdm_type}",
                    "subject_label": cdm_type,
                    "subject_source": "common_domain_model",
                    "predicate_id": "skos:closeMatch",
                    "object_id": f"{prefix}:{cdm_type}",
                    "object_label": cdm_type,
                    "object_source": source,
                    "mapping_justification": "semapv:ManualMappingCuration",
                    "comment": f"CDM type -> {source} synonym mapping",
                }
            )

    # ----- Synonym slot-level -> close_match (Gap 1) -----
    if synonym_slots:
        for source, type_map in sorted(synonym_slots.items()):
            prefix = SYNONYM_PREFIX_MAP.get(source, source.lower())
            for cdm_type, attr_names in sorted(type_map.items()):
                for attr_name in sorted(attr_names):
                    rows.append(
                        {
                            "subject_id": f"common_domain_model:{attr_name}",
                            "subject_label": f"{cdm_type}.{attr_name}",
                            "subject_source": "common_domain_model",
                            "predicate_id": "skos:closeMatch",
                            "object_id": f"{prefix}:{cdm_type}.{attr_name}",
                            "object_label": f"{cdm_type}.{attr_name}",
                            "object_source": source,
                            "mapping_justification": "semapv:ManualMappingCuration",
                            "comment": f"CDM slot -> {source} attribute synonym",
                        }
                    )

    # ----- External schema element mining (Gap 2) -----
    if schema_dir and schema_dir.is_dir():
        # Build CDM name lookup sets for matching
        cdm_slots_lower: dict[str, str] = {}
        cdm_classes_lower: dict[str, str] = {}
        for mod in modules.values():
            for t in mod.types:
                cdm_classes_lower[t.name.lower()] = t.name
                for attr in t.attributes:
                    cdm_slots_lower[attr.name.lower()] = attr.name
            for ch in mod.choices:
                cdm_classes_lower[ch.name.lower()] = ch.name

        # Build set of already-covered synonym mappings (to avoid duplicates)
        covered_pairs: set[tuple[str, str]] = set()  # (source_prefix, object_local)
        for source, type_map in synonym_types.items():
            prefix = SYNONYM_PREFIX_MAP.get(source, source.lower())
            for cdm_type in type_map:
                covered_pairs.add((prefix, cdm_type))
        if synonym_slots:
            for source, type_map in synonym_slots.items():
                prefix = SYNONYM_PREFIX_MAP.get(source, source.lower())
                for cdm_type, attrs in type_map.items():
                    for attr_name in attrs:
                        covered_pairs.add((prefix, f"{cdm_type}.{attr_name}"))

        # --- ORE XSD elements ---
        ore_elements = _parse_ore_xsd_elements(schema_dir)
        if ore_elements:
            for elem_name, complex_type in sorted(ore_elements.items()):
                # Match element name against CDM slots (camelCase)
                elem_lower = elem_name.lower()
                if elem_lower in cdm_slots_lower:
                    cdm_name = cdm_slots_lower[elem_lower]
                    if cdm_name in _GENERIC_NAMES:
                        continue
                    obj_id = f"ore:{complex_type}.{elem_name}" if complex_type else f"ore:{elem_name}"
                    if ("ore", obj_id.split(":", 1)[1]) not in covered_pairs:
                        rows.append(
                            {
                                "subject_id": f"common_domain_model:{cdm_name}",
                                "subject_label": cdm_name,
                                "subject_source": "common_domain_model",
                                "predicate_id": "skos:closeMatch",
                                "object_id": obj_id,
                                "object_label": elem_name,
                                "object_source": "ORE_XSD",
                                "mapping_justification": "semapv:LexicalMatching",
                                "comment": "CDM slot -> ORE XSD element (name match)",
                            }
                        )
                # Match against CDM classes (PascalCase)
                if elem_lower in cdm_classes_lower:
                    cdm_name = cdm_classes_lower[elem_lower]
                    if cdm_name in _GENERIC_NAMES:
                        continue
                    obj_id = f"ore:{elem_name}"
                    if ("ore", elem_name) not in covered_pairs:
                        rows.append(
                            {
                                "subject_id": f"common_domain_model:{cdm_name}",
                                "subject_label": cdm_name,
                                "subject_source": "common_domain_model",
                                "predicate_id": "skos:closeMatch",
                                "object_id": obj_id,
                                "object_label": elem_name,
                                "object_source": "ORE_XSD",
                                "mapping_justification": "semapv:LexicalMatching",
                                "comment": "CDM class -> ORE XSD complexType (name match)",
                            }
                        )

        # --- CreateiQ JSON Schema fields ---
        createiq_fields = _parse_createiq_json_fields(schema_dir)
        if createiq_fields:
            for field_name in sorted(createiq_fields):
                field_lower = field_name.lower()
                camel = _snake_to_camel(field_name)
                camel_lower = camel.lower()
                matched_slot = None
                if field_lower in cdm_slots_lower:
                    matched_slot = cdm_slots_lower[field_lower]
                elif camel_lower in cdm_slots_lower:
                    matched_slot = cdm_slots_lower[camel_lower]
                if matched_slot and matched_slot not in _GENERIC_NAMES:
                    obj_id = f"createiq:{field_name}"
                    if ("createiq", field_name) not in covered_pairs:
                        rows.append(
                            {
                                "subject_id": f"common_domain_model:{matched_slot}",
                                "subject_label": matched_slot,
                                "subject_source": "common_domain_model",
                                "predicate_id": "skos:closeMatch",
                                "object_id": obj_id,
                                "object_label": field_name,
                                "object_source": "CreateiQ_JSON",
                                "mapping_justification": "semapv:LexicalMatching",
                                "comment": "CDM slot -> CreateiQ JSON schema field (name match)",
                            }
                        )

    return rows


def write_sssom(
    rows: list[dict[str, str]],
    path: Path,
    header: str = CONSTRUCT_SSSOM_HEADER,
) -> None:
    """Write SSSOM TSV file."""
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(header)
        f.write("\t".join(SSSOM_COLUMNS) + "\n")
        for row in rows:
            f.write("\t".join(row.get(c, "") for c in SSSOM_COLUMNS) + "\n")


# ---------------------------------------------------------------------------
# YAML helpers
# ---------------------------------------------------------------------------


class _FlowStyleStr(str):
    """Marker for strings that should be flow-style in YAML."""


def _str_representer(dumper: yaml.Dumper, data: str) -> yaml.Node:
    """Use literal block style for multi-line, plain style for single-line."""
    if "\n" in data:
        return dumper.represent_scalar(
            "tag:yaml.org,2002:str", data, style="|"
        )
    return dumper.represent_scalar("tag:yaml.org,2002:str", data)


def _insert_blank_lines(text: str) -> str:
    """Insert blank lines between top-level YAML sections and between entries
    inside slots/enums/classes for human readability.

    Rules:
    - Blank line before each *major* top-level section key (``prefixes:``,
      ``imports:``, ``types:``, ``enums:``, ``slots:``, ``classes:``).
    - Blank line before each 2-space-indented key inside ``slots:``,
      ``enums:``, ``classes:``, and ``types:`` sections (i.e. between
      individual slot/enum/class/type definitions).
    - Scalar header keys (id, name, description, license, etc.) are NOT
      separated from each other.
    """
    lines = text.split("\n")
    result: list[str] = []
    # Track which top-level section we are in
    current_section = ""
    # Top-level keys that contain item-level entries we want to separate
    item_sections = {"slots:", "enums:", "classes:", "types:", "subsets:"}
    # Top-level keys that mark major section boundaries
    major_sections = {
        "prefixes:", "imports:", "comments:", "types:", "subsets:", "enums:",
        "slots:", "classes:", "rules:",
    }

    for i, line in enumerate(lines):
        # Detect top-level key (non-blank, no leading whitespace, has a colon)
        if line and not line[0].isspace() and ":" in line:
            key_token = line.split(":")[0] + ":"
            # Add blank line before major sections only
            if key_token in major_sections and result and result[-1] != "":
                result.append("")
            current_section = key_token
        # Detect 2-space-indented key (direct child of a top-level dict)
        elif (
            current_section in item_sections
            and line.startswith("  ")
            and not line.startswith("    ")
            and len(line) > 2
            and line[2] != " "
            and ":" in line
        ):
            # Add blank line between sibling entries, but not right after
            # the section header itself
            if result and result[-1] != "" and not result[-1].rstrip().endswith(":"):
                result.append("")

        result.append(line)

    return "\n".join(result)


def generate_functions_sidecar(
    modules_by_ns: dict[str, "RosettaModule"],
) -> dict:
    """Generate a standalone functions.yaml sidecar registry.

    Intent
    ------
    This file provides a *single-file* view of every Rosetta function across
    all CDM modules.  It complements — rather than replaces — the per-class
    ``annotations: {rosetta_functions}`` embedded in each module schema.

    Trade-offs vs. per-class annotations:

    * **Simpler external consumption** — downstream tooling (stub generators,
      SDK builders, documentation pipelines) can load one file instead of
      scanning 37 module YAMLs.
    * **Loses co-location** — the function ↔ class association is not visible
      when reading a single class definition; consumers must join on
      ``associated_classes``.
    * **Complementary** — both forms are generated from the same parser data,
      so they are always in sync.

    The file is *not* a LinkML schema — it is a plain YAML data file whose
    shape conforms to ``rosetta_metamodel.yaml`` (RosettaFunctionAnnotation).
    """
    functions: list[dict] = []

    # Collect all types keyed by name for association lookup
    all_type_names: dict[str, str] = {}  # type_name -> namespace
    for ns, mod in modules_by_ns.items():
        for t in mod.types:
            all_type_names[t.name] = ns

    for ns, mod in sorted(modules_by_ns.items()):
        for func in mod.functions:
            entry = _func_to_annotation(func)
            entry["namespace"] = ns
            entry["module"] = namespace_to_module_name(ns)

            # Compute associated classes (input/output type names that are CDM types)
            assoc: list[str] = []
            for p in func.inputs:
                if p.type_name in all_type_names and p.type_name not in assoc:
                    assoc.append(p.type_name)
            if func.output and func.output.type_name in all_type_names:
                if func.output.type_name not in assoc:
                    assoc.append(func.output.type_name)
            if assoc:
                entry["associated_classes"] = assoc

            functions.append(entry)

    return {
        "_comment": (
            "Sidecar registry of all Rosetta function signatures in the CDM. "
            "Generated by rosetta_to_linkml.py — do not edit manually. "
            "Shape conforms to rosetta_metamodel.yaml (RosettaFunctionAnnotation). "
            "Complements per-class annotations: {rosetta_functions} in module schemas."
        ),
        "functions": functions,
    }


def write_yaml(data: dict, path: Path) -> None:
    """Write a dict as YAML with sensible formatting and blank-line separation."""
    path.parent.mkdir(parents=True, exist_ok=True)
    dumper = yaml.Dumper
    dumper.add_representer(str, _str_representer)
    raw = yaml.dump(
        data,
        Dumper=dumper,
        default_flow_style=False,
        sort_keys=False,
        allow_unicode=True,
        width=120,
    )
    formatted = _insert_blank_lines(raw)
    with open(path, "w", encoding="utf-8") as f:
        f.write(formatted)


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Convert Rosetta DSL to enriched LinkML YAML schema"
    )
    parser.add_argument(
        "--rosetta-dir",
        type=Path,
        required=True,
        help="Path to rosetta-source/src/main/rosetta",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        required=True,
        help="Path to src/common_domain_model/schema",
    )
    parser.add_argument(
        "--codelist-dir",
        type=Path,
        default=None,
        help="Path to codelist JSON directory for enum meaning URIs",
    )
    parser.add_argument(
        "--sssom-out",
        type=Path,
        default=None,
        help="Path for construct-level SSSOM TSV output",
    )
    parser.add_argument(
        "--ext-sssom-out",
        type=Path,
        default=None,
        help="Path for external mapping SSSOM TSV output",
    )
    parser.add_argument(
        "--schema-dir",
        type=Path,
        default=None,
        help="Path to external schemas directory (ORE XSD, CreateiQ JSON)",
    )
    parser.add_argument(
        "--ecosystem-mappings-dir",
        type=Path,
        default=None,
        help=(
            "Directory containing cdm-*.sssom.tsv files with manually-curated "
            "mappings from CDM classes/enums to ecosystem schemas (gist, oscal, "
            "iso29100, spdx). Each row's SKOS predicate selects the LinkML "
            "mapping slot (exact_mappings, close_mappings, etc.)."
        ),
    )
    args = parser.parse_args()

    rosetta_dir: Path = args.rosetta_dir
    output_dir: Path = args.output_dir

    if not rosetta_dir.is_dir():
        print(f"Error: {rosetta_dir} is not a directory", file=sys.stderr)
        sys.exit(1)

    # ---- Parse Rosetta files ----
    rosetta_parser = RosettaParser()
    modules_by_ns: dict[str, RosettaModule] = {}

    rosetta_files = sorted(rosetta_dir.glob("*.rosetta"))
    relevant_suffixes = (
        "-type.rosetta",
        "-enum.rosetta",
        "-codelist-type.rosetta",
        "-func.rosetta",
    )
    relevant_files = [
        f
        for f in rosetta_files
        if any(f.name.endswith(s) for s in relevant_suffixes)
    ]

    print(f"Parsing {len(relevant_files)} Rosetta files...")
    for f in relevant_files:
        mod = rosetta_parser.parse_file(f)
        if mod is None:
            print(f"  SKIP: {f.name} (no namespace found)")
            continue

        if mod.namespace in modules_by_ns:
            # Merge into existing module
            existing = modules_by_ns[mod.namespace]
            existing.types.extend(mod.types)
            existing.enums.extend(mod.enums)
            existing.type_aliases.extend(mod.type_aliases)
            existing.choices.extend(mod.choices)
            existing.functions.extend(mod.functions)
            for imp in mod.imports:
                if imp not in existing.imports:
                    existing.imports.append(imp)
        else:
            modules_by_ns[mod.namespace] = mod

    print(f"Found {len(modules_by_ns)} modules:")
    for ns, mod in sorted(modules_by_ns.items()):
        print(
            f"  {ns}: {len(mod.types)} types, "
            f"{len(mod.enums)} enums, {len(mod.type_aliases)} aliases, "
            f"{len(mod.choices)} choices, {len(mod.functions)} funcs"
        )

    # ---- Load codelists for enum enrichment ----
    codelists: dict[str, CodelistInfo] = {}
    if args.codelist_dir:
        codelists = load_codelists(args.codelist_dir)
        print(f"Loaded {len(codelists)} codelist schemes")

    # ---- Parse synonym sources ----
    synonym_types = parse_synonym_types(rosetta_dir)
    syn_count = sum(len(v) for v in synonym_types.values())
    print(
        f"Found {syn_count} synonym type mappings "
        f"across {len(synonym_types)} sources"
    )

    # ---- Parse synonym attribute-level mappings ----
    synonym_slots = parse_synonym_slots(rosetta_dir)
    syn_slot_count = sum(
        len(attrs)
        for src in synonym_slots.values()
        for attrs in src.values()
    )
    print(
        f"Found {syn_slot_count} synonym attribute mappings "
        f"across {len(synonym_slots)} sources"
    )

    # ---- Parse desc files for body/corpus declarations ----
    desc_comments = parse_desc_files(rosetta_dir)
    for ns, comments in desc_comments.items():
        if ns in modules_by_ns:
            modules_by_ns[ns].body_corpus_comments = comments
        else:
            # Create a stub module to carry comments for parent namespaces
            modules_by_ns[ns] = RosettaModule(
                namespace=ns, body_corpus_comments=comments
            )
    if desc_comments:
        print(
            f"Parsed {sum(len(c) for c in desc_comments.values())} "
            f"body/corpus/segment declarations from {len(desc_comments)} desc files"
        )

    # ---- Count enrichment ----
    n_deprecated = sum(
        1
        for mod in modules_by_ns.values()
        for t in mod.types
        if t.deprecated
    ) + sum(
        1
        for mod in modules_by_ns.values()
        for e in mod.enums
        if e.deprecated
    ) + sum(
        1
        for mod in modules_by_ns.values()
        for t in mod.types
        for attr in t.attributes
        if attr.deprecated
    )
    n_docrefs = sum(
        len(t.doc_references)
        for mod in modules_by_ns.values()
        for t in mod.types
    ) + sum(
        len(e.doc_references)
        for mod in modules_by_ns.values()
        for e in mod.enums
    ) + sum(
        len(attr.doc_references)
        for mod in modules_by_ns.values()
        for t in mod.types
        for attr in t.attributes
    )
    n_scheme = sum(
        1
        for mod in modules_by_ns.values()
        for e in mod.enums
        for dr in e.doc_references
        if dr.segment_type == "schemeLocation"
    )
    print(
        f"Enrichment: {n_deprecated} deprecated, "
        f"{n_docrefs} docReferences captured, "
        f"{n_scheme} schemeLocation URIs"
    )

    # ---- Count conditions & functions ----
    n_conditions = sum(
        len(t.conditions)
        for mod in modules_by_ns.values()
        for t in mod.types
    )
    n_rules = sum(
        1
        for mod in modules_by_ns.values()
        for t in mod.types
        for c in t.conditions
        if c.kind in ("required_choice", "optional_choice", "one_of", "if_then", "comparison")
    )
    n_functions = sum(len(mod.functions) for mod in modules_by_ns.values())
    print(
        f"Conditions: {n_conditions} total, {n_rules} mappable to rules"
    )
    print(f"Functions: {n_functions} parsed")

    # ---- Load ecosystem SSSOM mappings (gist, oscal, iso29100, spdx, ...) ----
    ecosystem_mappings = EcosystemMappings()
    if args.ecosystem_mappings_dir:
        ecosystem_mappings = load_ecosystem_mappings(args.ecosystem_mappings_dir)
        n_subjects = len(ecosystem_mappings.by_name)
        n_links = sum(
            len(curies)
            for slot_map in ecosystem_mappings.by_name.values()
            for curies in slot_map.values()
        )
        print(
            f"Ecosystem mappings: {n_links} links across {n_subjects} CDM subjects "
            f"(prefixes: {', '.join(sorted(ecosystem_mappings.used_prefixes)) or 'none'})"
        )

    # ---- Generate LinkML ----
    gen = LinkMLGenerator(
        modules_by_ns,
        codelists=codelists,
        synonym_types=synonym_types,
        synonym_slots=synonym_slots,
        ecosystem_mappings=ecosystem_mappings,
    )

    # Module schemas — only generate for modules with schema elements
    # (func-only modules contribute comments to their parent module or are skipped)
    output_dir.mkdir(parents=True, exist_ok=True)
    schema_modules = {
        ns: mod for ns, mod in modules_by_ns.items()
        if mod.types or mod.enums or mod.type_aliases or mod.choices
            or mod.body_corpus_comments
    }

    # Merge functions from func-only modules into their nearest parent
    for ns, mod in sorted(modules_by_ns.items()):
        if ns not in schema_modules and mod.functions:
            # Find nearest parent module that has schema elements
            parts = ns.split(".")
            for depth in range(len(parts) - 1, 0, -1):
                parent_ns = ".".join(parts[:depth])
                if parent_ns in schema_modules:
                    schema_modules[parent_ns].functions.extend(mod.functions)
                    break

    for ns, mod in sorted(schema_modules.items()):
        mod_name = namespace_to_module_name(ns)
        schema_dict = gen.generate_module(mod)
        out_path = output_dir / f"{mod_name}.yaml"
        write_yaml(schema_dict, out_path)
        print(f"  Wrote {out_path}")

    # Root schema
    root_schema = gen.generate_root_schema()
    root_path = output_dir / "common_domain_model.yaml"
    write_yaml(root_schema, root_path)
    print(f"  Wrote {root_path}")

    # ---- Functions sidecar registry ----
    sidecar = generate_functions_sidecar(modules_by_ns)
    sidecar_path = output_dir.parent / "sidecar_functions.yaml"
    write_yaml(sidecar, sidecar_path)
    print(f"  Wrote {sidecar_path} ({len(sidecar['functions'])} functions)")

    # ---- Construct-level SSSOM ----
    if args.sssom_out:
        rows = generate_construct_sssom(modules_by_ns)
        write_sssom(rows, args.sssom_out, header=CONSTRUCT_SSSOM_HEADER)
        print(f"  Wrote {args.sssom_out} ({len(rows)} mappings)")

    # ---- External mapping SSSOM ----
    if args.ext_sssom_out:
        ext_rows = generate_external_sssom(
            modules_by_ns,
            codelists,
            synonym_types,
            synonym_slots=synonym_slots,
            schema_dir=args.schema_dir,
        )
        write_sssom(ext_rows, args.ext_sssom_out, header=EXTERNAL_SSSOM_HEADER)
        print(f"  Wrote {args.ext_sssom_out} ({len(ext_rows)} external mappings)")

    print("\nDone!")


if __name__ == "__main__":
    main()
