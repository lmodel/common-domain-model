"""Lets a test import tests/rune_json.py and scripts/rosetta_to_linkml.py by name."""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent.parent / "scripts"))
