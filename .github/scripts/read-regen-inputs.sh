#!/usr/bin/env bash
# Copyright (c) 2026 Jeffrey Snover. All rights reserved.
# Licensed under the MIT License. See LICENSE file in the project root.
#
# t/4064 (SO e/273#2, e/277#2): the ONE parser both citation-link-integrity.yml and
# source-index-regen.yml call for REGEN_INPUTS -- neither workflow parses the file inline, so a
# reintroduced literal shows up in review as dead code. This script OWNS the format:
#   - one path per line;
#   - blank lines and `#`-comment lines ignored;
#   - trailing `\r` stripped (a CRLF checkout must not silently drop the last path);
#   - every remaining line must match [A-Za-z0-9_./-]+ (no globs, no shell metacharacters);
#   - every listed path must exist in the checkout (`git ls-files --error-unmatch`, which also
#     resolves correctly for a directory entry like `summaries/`, per CL review).
#
# FAILS CLOSED, not open, on every violation: missing file, zero valid lines after parsing, an
# invalid-character line, or a listed path that isn't tracked -- all `::error::` + exit 1. An
# EMPTY pathspec is the dangerous failure mode here, not a missing one: `git diff -- <nothing>`
# diffs the WHOLE repo, which would make leg-c read "regen pending" on every push forever and
# mask the signal this file exists to keep deterministic (DevOps Lead review, t/4064#2 cond 1).
#
# Usage: REGEN_INPUTS="$(bash .github/scripts/read-regen-inputs.sh)" || exit 1
#        (invoked via `bash`, not directly -- avoids depending on the executable bit, which a
#        Windows-authored commit can silently drop under core.fileMode=false)
#        Prints one validated path per line on stdout; nothing on failure (errors go to stderr
#        via ::error::, never mixed into the captured output -- t/4060's swallowed-error lesson:
#        an echoed error inside a command-substitution-captured function is invisible in the log).
set -euo pipefail

FILE="${1:-.github/regen-inputs.txt}"

if [ ! -f "$FILE" ]; then
  echo "::error::read-regen-inputs.sh: $FILE is missing -- failing closed" >&2
  exit 1
fi

paths=()
while IFS= read -r raw || [ -n "$raw" ]; do
  line="${raw%$'\r'}"                                              # strip trailing CR
  trimmed="$(printf '%s' "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  [ -z "$trimmed" ] && continue                                     # blank line
  case "$trimmed" in '#'*) continue ;; esac                         # comment line
  if ! [[ "$trimmed" =~ ^[A-Za-z0-9_./-]+$ ]]; then
    echo "::error::read-regen-inputs.sh: invalid entry '$trimmed' in $FILE (allowed: [A-Za-z0-9_./-]) -- failing closed" >&2
    exit 1
  fi
  paths+=("$trimmed")
done < "$FILE"

if [ "${#paths[@]}" -eq 0 ]; then
  echo "::error::read-regen-inputs.sh: $FILE produced zero valid entries after parsing -- failing closed (an empty pathspec diffs the WHOLE repo, which would read every push as regen-pending forever)" >&2
  exit 1
fi

for p in "${paths[@]}"; do
  if ! git ls-files --error-unmatch -- "$p" > /dev/null 2>&1; then
    echo "::error::read-regen-inputs.sh: '$p' listed in $FILE does not exist in the checkout -- failing closed" >&2
    exit 1
  fi
done

printf '%s\n' "${paths[@]}"
