#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="${1:-sandbox/day3/app.log}"

mkdir -p "$(dirname "$LOG_FILE")"

for i in {1..10}; do
  ts="$(date '+%Y-%m-%d %H:%M:%S')"
  if (( i % 4 == 0 )); then
    echo "$ts ERROR simulated error #$i" >> "$LOG_FILE"
  else
    echo "$ts INFO  simulated info #$i" >> "$LOG_FILE"
  fi
  sleep 1
done
