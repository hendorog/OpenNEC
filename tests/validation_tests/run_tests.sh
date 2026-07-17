#!/bin/sh
# run_tests.sh - execute all validation decks and display results

set -e

# assume this script lives under tests/validation_tests
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
ONEC="$ROOT/onec"
DECK_DIR="$(cd "$(dirname "$0")" && pwd)"

printf "Running validation decks in %s\n" "$DECK_DIR"
for d in "$DECK_DIR"/*.deck; do
  printf "\n=== %s ===\n" "$d"
  "$ONEC" -t -n "$d" 2>&1 || true
done
