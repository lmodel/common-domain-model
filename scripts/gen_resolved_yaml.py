#!/usr/bin/env python3

# workaround linkml PR backlog 
from pathlib import Path
import sys

from linkml.generators.yamlgen import YAMLGenerator
from linkml_runtime.dumpers import yaml_dumper


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: gen_resolved_yaml.py <source-schema> <output-yaml>", file=sys.stderr)
        return 2

    source_schema = sys.argv[1]
    output_yaml = Path(sys.argv[2])
    output_yaml.parent.mkdir(parents=True, exist_ok=True)

    generator = YAMLGenerator(source_schema)
    output_yaml.write_text(yaml_dumper.dumps(generator.schema), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())