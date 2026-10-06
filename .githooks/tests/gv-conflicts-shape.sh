#!/usr/bin/env bash
# t/3953 Gate Verification: conflicts-shape pre-commit, every arm through REAL `git commit`.
# $1 = 1 (warn-only) | 0 (blocking)
#
# Self-contained, like gv-pov-tags.sh: this harness writes its OWN minimal pre-commit calling
# ONLY conflicts-shape-check, so it never needs updating when a FUTURE sibling hook is added to
# the real pre-commit (the regression class t/3953 itself had to fix in gv-situations-bdi.sh,
# because THAT harness copies the real pre-commit wholesale).
set -uo pipefail
HOOKS="${HOOK_SRC:-$(cd "$(dirname "$0")/.." && pwd)}"   # this repo's .githooks
: "${AI_TRIAD_CODE_ROOT:?set AI_TRIAD_CODE_ROOT to an ai-triad-research checkout with node_modules installed}"
REAL_CODE_ROOT="$AI_TRIAD_CODE_ROOT"
command -v node >/dev/null 2>&1 || { echo "FATAL: node required"; exit 1; }
command -v tar >/dev/null 2>&1 || { echo "FATAL: tar required"; exit 1; }

MODE="${1:?usage: gv-conflicts-shape.sh <1=warn|0=blocking>}"

T="$(mktemp -d)"; cd "$T" || exit 1
git init -q .; git config user.email t@t.t; git config user.name t
mkdir -p .githooks conflicts

cp "$HOOKS/conflicts-shape-build-input.mjs" .githooks/
sed "s/^WARN_ONLY=1$/WARN_ONLY=$MODE/" "$HOOKS/conflicts-shape-check" > .githooks/conflicts-shape-check
chmod +x .githooks/*
printf '#!/usr/bin/env bash\nset -uo pipefail\n"$(dirname "$0")/conflicts-shape-check"\n' > .githooks/pre-commit
chmod +x .githooks/pre-commit
git config core.hooksPath .githooks
grep -q "^WARN_ONLY=$MODE$" .githooks/conflicts-shape-check || { echo "FATAL: mode not set"; exit 1; }

# AI_TRIAD_CODE_ROOT / AI_TRIAD_CHECKER_REF point straight at the real checkout and this
# session's own working branch -- conflict-shape-cli.ts and its import closure (lib,
# taxonomy-editor/src/renderer/utils/validation.ts, tsconfig) are read via `git archive` from
# there, exactly as the deployed hook does. No fixture code-repo is needed here (unlike
# gv-pov-tags.sh, which had to build one because the live tag registry is empty) -- the rule
# under test, conflictFileSchema, is already real and already has real registered-vs-not
# semantics that don't depend on any mutable registry content.
export AI_TRIAD_CODE_ROOT="$REAL_CODE_ROOT"
export AI_TRIAD_CHECKER_REF="${AI_TRIAD_CHECKER_REF:-HEAD}"

write_conflict () {  # relpath json-fragment
  printf '%s\n' "$2" > "$T/$1"
}
SEED_FILES () {
  write_conflict conflicts/seed.json '{ "claim_id":"seed","claim_label":"L","description":"D","status":"open","linked_taxonomy_nodes":["acc-beliefs-seed"],"instances":[],"human_notes":[] }'
  echo seed > README.md
}
SEED_FILES; git add -A >/dev/null 2>&1; git commit -qm seed --no-verify; SEED="$(git rev-parse HEAD)"
reseed () { git reset -q --hard "$SEED"; git clean -qfd >/dev/null 2>&1; }

TELEM_DIR="$(mktemp -d)"; export AI_TRIAD_HOOK_TELEMETRY="$TELEM_DIR/hook-telemetry.jsonl"
: > "$AI_TRIAD_HOOK_TELEMETRY"
telemetry_since () {
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
  grep -E "conflicts-shape|linked_taxonomy_nodes" <<<"$out" | sed 's/^/    /'
  telemetry_since "$n0"
  after="$(git rev-parse HEAD)"
  [ "$before" = "$after" ] && r=REFUSED || r=CREATED
  echo "    => rc=$rc COMMIT $r   ($(( (t1-t0)/1000000 )) ms)"
}

echo "================ t/3953 GV — WARN_ONLY=$MODE ================"

arm "1 NESTED array (the t/3948 bug) → FIRES, naming the path"
reseed; write_conflict conflicts/nested.json '{ "claim_id":"c1","claim_label":"L","description":"D","status":"open","linked_taxonomy_nodes":[["acc-beliefs-001"]],"instances":[],"human_notes":[] }'
git add conflicts/nested.json; run "add nested"

arm "2 NON-STRING element → FIRES"
reseed; write_conflict conflicts/nonstring.json '{ "claim_id":"c2","claim_label":"L","description":"D","status":"open","linked_taxonomy_nodes":[123],"instances":[],"human_notes":[] }'
git add conflicts/nonstring.json; run "add nonstring"

arm "3 VALID file → silent"
reseed; write_conflict conflicts/valid.json '{ "claim_id":"c3","claim_label":"L","description":"D","status":"open","linked_taxonomy_nodes":["acc-beliefs-003"],"instances":[],"human_notes":[] }'
git add conflicts/valid.json; run "add valid"

arm "4 UNRELATED file staged → skip"
reseed; echo y >> README.md; git add README.md; run "docs"

arm "5 DELETED conflict file → pass (nothing to validate)"
reseed; git rm -q conflicts/seed.json; run "delete seed"

arm "6 T/3948 REPLAY: the real c034f34b incident files → FIRES on all 3"
reseed
git -C "$REAL_CODE_ROOT/../ai-triad-data" show c034f34b:conflicts/conflict-following-the-1995-oklahoma-city-bombing-do-ai-ri.json > conflicts/incident1.json 2>/dev/null \
  || git show c034f34b:conflicts/conflict-following-the-1995-oklahoma-city-bombing-do-ai-ri.json > conflicts/incident1.json 2>/dev/null
git -C "$REAL_CODE_ROOT/../ai-triad-data" show c034f34b:conflicts/conflict-the-federal-government-previously-impose-do-ai-ri.json > conflicts/incident2.json 2>/dev/null \
  || git show c034f34b:conflicts/conflict-the-federal-government-previously-impose-do-ai-ri.json > conflicts/incident2.json 2>/dev/null
git -C "$REAL_CODE_ROOT/../ai-triad-data" show c034f34b:conflicts/conflict-us-macroeconomic-indicators-show-that-gd-do-ai-ri.json > conflicts/incident3.json 2>/dev/null \
  || git show c034f34b:conflicts/conflict-us-macroeconomic-indicators-show-that-gd-do-ai-ri.json > conflicts/incident3.json 2>/dev/null
if [ ! -s conflicts/incident1.json ]; then
  echo "    HARNESS ERROR: could not read the t/3948 incident commit c034f34b from the data repo"
else
  git add conflicts/incident1.json conflicts/incident2.json conflicts/incident3.json
  run "t3948 replay"
fi

arm "7 COULD NOT VERIFY: tsx unreachable → reported, not silent"
reseed; write_conflict conflicts/tsxtest.json '{ "claim_id":"c7","claim_label":"L","description":"D","status":"open","linked_taxonomy_nodes":["acc-beliefs-007"],"instances":[],"human_notes":[] }'
git add conflicts/tsxtest.json
REAL_TSX="$REAL_CODE_ROOT/node_modules/.bin/tsx"
NOTSX_PATH="$(printf '%s' "$PATH" | tr ':' '\n' | while read -r d; do
  [ -x "$d/tsx" ] || [ -x "$d/tsx.CMD" ] || [ -x "$d/tsx.cmd" ] || printf '%s:' "$d"
done)"
if PATH="$NOTSX_PATH" command -v tsx >/dev/null 2>&1; then
  echo "    HARNESS ERROR: tsx still visible on stripped PATH -- arm 7 would not test 'tsx unreachable'"; exit 1
fi
mv "$REAL_TSX" "$REAL_TSX.disabled"
PATH="$NOTSX_PATH" run "no tsx"
mv "$REAL_TSX.disabled" "$REAL_TSX"

cd /
rm -rf "$T" "$TELEM_DIR"
