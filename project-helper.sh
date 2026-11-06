#!/bin/bash
set -e

PROJECT_NAME="${1-}"
REPORT_DIR="reports"
OUTPUT_FILE="$REPORT_DIR/result.txt"

if [ -z "$PROJECT_NAME" ]; then
  echo "Укажи имя проекта: ./project-helper.sh demo"
  exit 1
fi

create_structure() {
  for dir in data "$REPORT_DIR" output; do
    mkdir -p "$dir"
  done
  printf '%s\n' "$PROJECT_NAME" > data/project.txt
}

write_report() {
  echo "Проект: $PROJECT_NAME" > "$OUTPUT_FILE"
  echo "Дата: $(date '+%d.%m.%Y %H:%M')" >> "$OUTPUT_FILE"
  echo 'Файлы проекта:' >> "$OUTPUT_FILE"
  find . -type f | sort >> "$OUTPUT_FILE"
}

create_structure
write_report
cat "$OUTPUT_FILE"
