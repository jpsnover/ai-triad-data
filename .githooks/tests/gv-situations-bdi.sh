#!/usr/bin/env bash
# t/3892 Gate Verification: situation-BDI pre-commit, every arm through REAL `git commit`.
# $1 = 1 (warn-only) | 0 (blocking)
set -uo pipefail
MODE="${1:?usage: gv-situations-bdi.sh <1=warn|0=blocking>}"
HOOKS="${HOOK_SRC:-$(cd "$(dirname "$0")/.." && pwd)}"   # this repo's .githooks
# The rule is read from the CODE repo's ${AI_TRIAD_CHECKER_REF:-origin/main} blob, so a code
# checkout (with that ref fetched) is required. The harness runs in a temp repo, so set it explicitly.
: "${AI_TRIAD_CODE_ROOT:?set AI_TRIAD_CODE_ROOT to an ai-triad-research checkout}"
export AI_TRIAD_CODE_ROOT
command -v pwsh >/dev/null 2>&1 || { echo "FATAL: pwsh required (fixtures are PowerShell-written, BOM'd)"; exit 1; }
# Windows-form path for pwsh/python on Git-for-Windows; identity elsewhere (Linux CI).
wp () { if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else printf '%s' "$1"; fi; }

T="$(mktemp -d)"; cd "$T" || exit 1
git init -q .; git config user.email t@t.t; git config user.name t
mkdir -p .githooks taxonomy/Origin
# pre-commit = the REAL data-repo pre-commit with the planned insertion (before its edges early-exit)
cp "$HOOKS/pre-commit" .githooks/pre-commit   # the real pre-commit (already wired to the check)
sed "s/^WARN_ONLY=1$/WARN_ONLY=$MODE/" "$HOOKS/situations-bdi-check" > .githooks/situations-bdi-check
cp "$HOOKS/situations-bdi-runner.ps1" .githooks/
chmod +x .githooks/*; git config core.hooksPath .githooks
grep -q "^WARN_ONLY=$MODE$" .githooks/situations-bdi-check || { echo "FATAL: mode not set"; exit 1; }
grep -q "situations-bdi-check" .githooks/pre-commit || { echo "FATAL: not wired"; exit 1; }

GOOD='{ "belief": "b", "desire": "d", "intention": "i", "summary": "s" }'
node () { # id label kind   kind = good | flat | na | dep
  case "$3" in
    good) printf '{ "id": "%s", "label": "%s", "description": "x", "interpretations": { "accelerationist": %s, "safetyist": %s, "skeptic": %s } }' "$1" "$2" "$GOOD" "$GOOD" "$GOOD" ;;
    flat) printf '{ "id": "%s", "label": "%s", "description": "x", "interpretations": { "accelerationist": "prose a", "safetyist": "prose s", "skeptic": "prose k" } }' "$1" "$2" ;;
    na)   printf '{ "id": "%s", "label": "%s", "description": "x", "interpretations": { "accelerationist": { "belief": "N/A", "desire": "d", "intention": "i" }, "safetyist": %s, "skeptic": %s } }' "$1" "$2" "$GOOD" "$GOOD" ;;
    dep)  printf '{ "id": "%s", "label": "%s", "description": "[DEPRECATED] old", "interpretations": { "accelerationist": "flat", "safetyist": "flat", "skeptic": "flat" } }' "$1" "$2" ;;
  esac
}
# Write situations.json the way PRODUCTION does: PowerShell, utf8BOM.
write_sit () { # nodes-json-fragments...
  local body; body="{ \"nodes\": [ $(IFS=,; echo "$*") ] }"
  printf '%s' "$body" > "$T/.raw.json"
  pwsh -NoProfile -NonInteractive -Command "Set-Content -LiteralPath '$(wp "$T/taxonomy/Origin/situations.json")' -Value (Get-Content -Raw -LiteralPath '$(wp "$T/.raw.json")') -Encoding utf8BOM"
}
bom () { [ "$(git show "$1" 2>/dev/null | head -c3 | od -An -tx1 | tr -d ' ')" = efbbbf ] && echo BOM || echo no-BOM; }

SEED_FILES () { write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)"; echo seed > README.md; }
SEED_FILES; git add -A >/dev/null 2>&1; git commit -qm seed --no-verify; SEED="$(git rev-parse HEAD)"
echo "seed: situations.json at HEAD is $(bom HEAD:taxonomy/Origin/situations.json); contains live FLAT sit-900 + DEPRECATED flat sit-154"
reseed () { git reset -q --hard "$SEED"; git clean -qfd; }

# Execution record (t/3892#6): the hook appends one JSON line per run. Point it at a
# harness-owned file and print what THIS run wrote, so the assert can check result/action.
# OUTSIDE the temp repo: every arm's reseed runs `git clean -fd`, which would delete it.
TELEM_DIR="$(mktemp -d)"; export AI_TRIAD_HOOK_TELEMETRY="$TELEM_DIR/hook-telemetry.jsonl"
: > "$AI_TRIAD_HOOK_TELEMETRY"
telemetry_since () {  # $1 = line count before the run
  local now; now="$(wc -l < "$AI_TRIAD_HOOK_TELEMETRY" | tr -d ' ')"
  if [ "$now" -gt "$1" ]; then
    tail -n 1 "$AI_TRIAD_HOOK_TELEMETRY" | sed -n 's/.*"result":"\([a-z]*\)","action":"\([a-z]*\)".*/    telemetry: \1\/\2/p'
    [ "$(( now - $1 ))" -gt 1 ] && echo "    telemetry: MULTIPLE RECORDS ($(( now - $1 )))"
  else
    echo "    telemetry: (none)"
  fi
}

arm () { echo; echo "################ $1"; }
run () { local m="$1"; shift; local before after out rc t0 t1 n0
  before="$(git rev-parse HEAD)"; t0=$(date +%s%N)
  n0="$(wc -l < "$AI_TRIAD_HOOK_TELEMETRY" | tr -d ' ')"
  out="$(git commit -m "$m" "$@" 2>&1)"; rc=$?; t1=$(date +%s%N)
  grep -q "nothing to commit" <<<"$out" && { echo "    *** HARNESS ERROR: nothing staged ***"; return; }
  grep -E "situation-bdi|^\s+sit-" <<<"$out" | sed 's/^/    /'
  telemetry_since "$n0"
  after="$(git rev-parse HEAD)"
  [ "$before" = "$after" ] && r=REFUSED || r=CREATED
  echo "    => rc=$rc COMMIT $r   ($(( (t1-t0)/1000000 )) ms)"
}

echo "================ t/3892 GV — WARN_ONLY=$MODE ================"

arm "1 CLEAN: situations.json not in commit → silent"
reseed; echo x >> README.md; git add README.md; run "docs"

arm "2 VALID new situation (bare) → silent"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-002 new good)"
git add taxonomy/Origin/situations.json; echo "    staged blob: $(bom :taxonomy/Origin/situations.json)"; run "add valid"

arm "3 FLAT new situation (bare) → FIRES"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-003 newflat flat)"
git add taxonomy/Origin/situations.json; run "add flat"

arm "4 SENTINEL 'N/A' belief (bare) → FIRES"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-004 na na)"
git add taxonomy/Origin/situations.json; run "add N/A"

arm "5 CHANGED-ONLY: untouched LIVE flat sit-900 + valid edit to sit-001 → silent"
reseed; write_sit "$(node sit-001 a-relabelled good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)"
git add taxonomy/Origin/situations.json; run "relabel sit-001"

arm "6 INDEX NOT DISK: valid change staged, FLAT edit left unstaged on disk → silent"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-005 ok good)"
git add taxonomy/Origin/situations.json
write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-005 ok good)" "$(node sit-006 unstagedflat flat)"
echo "    disk has sit-006 (flat, unstaged); index does not"; run "staged valid only"
echo "    -> sit-006 in commit? $(git show HEAD:taxonomy/Origin/situations.json | grep -c sit-006) (0 = correct)"

arm "7 PATHSPEC commit of a flat situations.json → FIRES (temp index)"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-007 flat flat)"
run "pathspec flat" -- taxonomy/Origin/situations.json

arm "8 PATHSPEC of an unrelated file while a peer's FLAT situations.json is STAGED → silent"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-008 peerflat flat)"
git add taxonomy/Origin/situations.json; echo y >> README.md
run "docs by B" -- README.md
echo "    -> files in commit: $(git show --name-only --format= HEAD | tr '\n' ' ')"

arm "9 COULD NOT VERIFY: checker ref unreadable → reported, not silent"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-009 x flat)"
git add taxonomy/Origin/situations.json; AI_TRIAD_CHECKER_REF=refs/does-not-exist run "bad ref"

arm "10 COULD NOT VERIFY: pwsh absent from PATH → reported, not silent"
reseed; write_sit "$(node sit-001 a good)" "$(node sit-900 legacy flat)" "$(node sit-154 dep dep)" "$(node sit-010 x flat)"
git add taxonomy/Origin/situations.json
# Build a PATH with pwsh removed but every other tool intact (t/3913). Platform-split:
#  - Windows / Git-Bash: pwsh lives in its OWN directory (C:\Program Files\PowerShell\7), so
#    dropping the dirs that contain it loses nothing else. Kept as-is: Git-Bash `ln -s` silently
#    COPIES unless MSYS=winsymlinks:nativestrict (and native symlinks may need Developer Mode),
#    so the symlink approach below is not portable there.
#  - Linux/macOS: pwsh shares a dir with git/date/grep/sed (e.g. /usr/bin on Ubuntu), so dropping
#    that dir broke the harness itself (rc 127, the hook never ran). Instead, keep every dir that
#    does not hold pwsh, and replace each one that does with a temp bin of symlinks to everything
#    in it EXCEPT pwsh.
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*)
    NOPWSH_PATH="$(printf '%s' "$PATH" | tr ':' '\n' | while read -r d; do [ -x "$d/pwsh" ] || [ -x "$d/pwsh.exe" ] || printf '%s:' "$d"; done)"
    ;;
  *)
    NOPWSH_BIN="$T/nopwsh-bin"; mkdir -p "$NOPWSH_BIN"
    NOPWSH_PATH="$(printf '%s' "$PATH" | tr ':' '\n' | while read -r d; do
      [ -n "$d" ] && [ -d "$d" ] || continue
      if [ -x "$d/pwsh" ]; then
        for f in "$d"/*; do
          b="$(basename "$f")"
          case "$b" in pwsh|pwsh-*|pwsh.exe) continue ;; esac
          [ -e "$NOPWSH_BIN/$b" ] || ln -s "$f" "$NOPWSH_BIN/$b"
        done
        printf '%s:' "$NOPWSH_BIN"
      else
        printf '%s:' "$d"
      fi
    done)"
    ;;
esac
# Reachability assert (TL p/331#1846): the stripped PATH must still run git and must NOT find
# pwsh -- otherwise the arm below is testing a broken harness, not the hook. Fail LOUD, not as
# a mysterious rc 127.
if ! PATH="$NOPWSH_PATH" command -v git >/dev/null 2>&1; then
  echo "    HARNESS ERROR: stripped PATH lost git -- arm 10 cannot test the hook"; exit 1
fi
if PATH="$NOPWSH_PATH" command -v pwsh >/dev/null 2>&1; then
  echo "    HARNESS ERROR: pwsh still visible on stripped PATH -- arm 10 would not test 'pwsh absent'"; exit 1
fi
echo "    stripped PATH: git found, pwsh absent (reachability OK)"
PATH="$NOPWSH_PATH" run "no pwsh"

cd /; rm -rf "$T" "$TELEM_DIR"
