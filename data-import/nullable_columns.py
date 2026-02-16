#!/usr/bin/env python3
"""Detect nullable columns in a CSV file.

Outputs a CSV with rows of:
column_name,nullable

Example usage:
	python nullable_columns.py \
		--csv-path movies.csv \
		--output-path output/nullable_columns
"""

import argparse
import ast
import csv
import json
import os
import sys
from typing import Dict

from tqdm import tqdm


def parse_args() -> argparse.Namespace:
	parser = argparse.ArgumentParser(
		description="Detect nullable columns in a CSV file."
	)
	parser.add_argument(
		"--csv-path",
		required=True,
		help="Path to the input CSV file.",
	)
	parser.add_argument(
		"--encoding",
		default="utf-8",
		help="CSV file encoding (default: utf-8).",
	)
	parser.add_argument(
		"--output-path",
		required=True,
		help="Path to the output folder.",
	)
	return parser.parse_args()


def is_null(value: str | None) -> bool:
	return value is None or value.strip() == ""


def parse_list_value(raw: str) -> list | None:
	if not raw or not raw.strip().startswith("["):
		return None
	try:
		parsed = json.loads(raw)
	except json.JSONDecodeError:
		parsed = None
	if parsed is None:
		try:
			parsed = ast.literal_eval(raw)
		except (SyntaxError, ValueError):
			return None
	if not isinstance(parsed, list):
		return None
	return parsed


def is_empty_list_value(raw: str) -> bool:
	parsed = parse_list_value(raw)
	if parsed is None:
		return False
	return all(str(item).strip() == "" for item in parsed)


def detect_nullable_columns(
	csv_path: str,
	encoding: str,
) -> Dict[str, tuple[bool, int | None, bool]]:
	with open(csv_path, "r", encoding=encoding, newline="") as handle:
		row_reader = csv.reader(handle)
		total_rows = sum(1 for _ in row_reader) - 1  # subtract header
		handle.seek(0)
		reader = csv.DictReader(handle)
		if not reader.fieldnames:
			raise ValueError("CSV has no header row.")

		nullable_flag = {name: False for name in reader.fieldnames}
		nullable_row = {name: None for name in reader.fieldnames}
		is_array = {name: False for name in reader.fieldnames}
		for row in tqdm(reader, total=total_rows):
			for name in reader.fieldnames:
				raw = row.get(name)
				if parse_list_value(raw or "") is not None:
					is_array[name] = True
				if not nullable_flag[name] and (is_null(raw) or is_empty_list_value(raw or "")):
					nullable_flag[name] = True
					nullable_row[name] = reader.line_num

		nullable = {
			name: (nullable_flag[name], nullable_row[name], is_array[name])
			for name in reader.fieldnames
		}

	return nullable


def main() -> int:
	args = parse_args()

	try:
		os.makedirs(args.output_path, exist_ok=True)
	except OSError as exc:
		print(f"Error: {exc}", file=sys.stderr)
		return 1

	try:
		nullable = detect_nullable_columns(args.csv_path, args.encoding)
	except (OSError, ValueError) as exc:
		print(f"Error: {exc}", file=sys.stderr)
		return 1

	output_file = os.path.join(args.output_path, os.path.basename(args.csv_path))
	try:
		with open(output_file, "w", encoding="utf-8", newline="") as handle:
			writer = csv.writer(handle)
			writer.writerow(["column_name", "nullable", "nullable_row", "is_array"])
			for name, (is_nullable, row_index, is_array) in nullable.items():
				row_value = "" if row_index is None else row_index
				writer.writerow(
					[name, str(is_nullable).lower(), row_value, str(is_array).lower()]
				)
	except OSError as exc:
		print(f"Error: {exc}", file=sys.stderr)
		return 1

	return 0


if __name__ == "__main__":
	raise SystemExit(main())
