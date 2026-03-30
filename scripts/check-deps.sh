#!/usr/bin/env bash
set -euo pipefail

required=(op tofu kubectl helm gcloud just)
missing=()

for cmd in "${required[@]}"; do
  if command -v "$cmd" &>/dev/null; then
    printf "  %-10s %s\n" "$cmd" "$(command -v "$cmd")"
  else
    printf "  %-10s MISSING\n" "$cmd"
    missing+=("$cmd")
  fi
done

echo ""

if [ ${#missing[@]} -gt 0 ]; then
  echo "Missing tools: ${missing[*]}"
  exit 1
else
  echo "All dependencies found."
fi
