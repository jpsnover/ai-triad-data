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

arm "8 COULD NOT VERIFY: checker fails to load (t/4022) → reported as unverified, NEVER violation"
# t/4022: node ALSO exits 1 on an uncaught load error (module not found, syntax error), which
# collides with the CLI's own exit-1 "invalid shape" verdict. Needs extraction to SUCCEED and
# tsx to then THROW AT RUNTIME -- distinct from arm 7 above (tsx unreachable entirely, caught
# before it ever runs). Mirrors gv-pov-tags.sh's own t/4022 arm: a throwaway fixture repo
# under $REAL_CODE_ROOT/tmp/ (never the shared checkout) with a conflict-shape-cli.ts whose
# first line is a bad import -- `git archive` + tar extraction succeed (the file exists),
# tsx runs it, and it throws before ever reaching the real logic.
reseed; write_conflict conflicts/loadfail.json '{ "claim_id":"c8","claim_label":"L","description":"D","status":"open","linked_taxonomy_nodes":["acc-beliefs-008"],"instances":[],"human_notes":[] }'
git add conflicts/loadfail.json
BREAK_FIXTURE="$(mktemp -d "$REAL_CODE_ROOT/tmp/gv-conflicts-shape-break.XXXXXX")"
mkdir -p "$BREAK_FIXTURE/lib" "$BREAK_FIXTURE/taxonomy-editor/src/renderer/utils" "$BREAK_FIXTURE/operations/devops"
: > "$BREAK_FIXTURE/lib/.keep"
: > "$BREAK_FIXTURE/taxonomy-editor/src/renderer/utils/validation.ts"
: > "$BREAK_FIXTURE/taxonomy-editor/tsconfig.json"
printf "import './this-module-does-not-exist.js';\n" > "$BREAK_FIXTURE/operations/devops/conflict-shape-cli.ts"
# tsx wrapper execing the REAL binary by absolute path (gv-pov-tags.sh's same lesson): the
# hook's PRIMARY `[ -x "$TSX" ]` branch must find it directly, never the `command -v tsx`
# PATH fallback, which mis-resolves a `/c/...`-style PATH entry under MSYS_NO_PATHCONV=1.
#
# t/4027: re-exec'ing the REAL `.bin/tsx` shim from inside this wrapper breaks under
# MSYS_NO_PATHCONV=1 IF the embedded CODE_ROOT is a true POSIX-style path (`/c/...`) --
# the shim's own internal path resolution gets it unconverted and mangles it to
# `C:\c\Users\...` (harness-only; the real hooks invoke `.bin/tsx` directly with no
# re-exec layer and are unaffected, TL t/4021#5). Skip the shim: invoke tsx's entry
# point via `node`, with the path winpath-converted at wrapper-creation time -- a
# function, not an inline block, so arm 9 can rebuild the SAME real wrapper from a
# different root form and prove the fix, rather than a copy that could drift from it.
build_tsx_wrapper () {  # $1 = code root (either path form)  $2 = dest wrapper path
  local cli="$1/node_modules/tsx/dist/cli.mjs"
  if command -v cygpath >/dev/null 2>&1; then cli="$(cygpath -w "$cli")"; fi
  printf '#!/usr/bin/env bash\nexec node "%s" "$@"\n' "$cli" > "$2"
  chmod +x "$2"
}
mkdir -p "$BREAK_FIXTURE/node_modules/.bin"
build_tsx_wrapper "$REAL_CODE_ROOT" "$BREAK_FIXTURE/node_modules/.bin/tsx"
( cd "$BREAK_FIXTURE" && git init -q . && git config user.email t@t.t && git config user.name t \
    && git add -A && git commit -qm fixture )
AI_TRIAD_CODE_ROOT="$BREAK_FIXTURE" AI_TRIAD_CHECKER_REF=HEAD run "checker broken"
rm -rf "$BREAK_FIXTURE"

arm "9 VALID under MSYS_NO_PATHCONV=1 with a POSIX-form CODE_ROOT (t/4027) → silent, not COULD NOT VERIFY"
# t/4027: same bug and same fix as gv-pov-tags.sh's arm 11, here for conflicts-shape-
# check's own fixture wrapper. The wrapper is rebuilt via `build_tsx_wrapper` (the real
# subject code) from a `cygpath -u`-converted root, proving the fix for the one
# caller-format combination that actually broke it -- not a hand-copied duplicate that
# could silently drift from the real wrapper-creation logic.
reseed; write_conflict conflicts/posixroot.json '{ "claim_id":"c9","claim_label":"L","description":"D","status":"open","linked_taxonomy_nodes":["acc-beliefs-009"],"instances":[],"human_notes":[] }'
git add conflicts/posixroot.json
cp "$REAL_TSX" "$T/tsx-wrapper.orig"
# No cygpath on CI's ubuntu-latest (the whole POSIX-vs-Windows-path distinction is
# MSYS-specific) -- fall back to the unchanged root there, where it's a no-op and the
# arm still asserts a plain pass, rather than letting the command substitution fail
# and silently feed build_tsx_wrapper an empty string (t/4027 CI failure, found live).
POSIX_ROOT="$REAL_CODE_ROOT"
if command -v cygpath >/dev/null 2>&1; then POSIX_ROOT="$(cygpath -u "$REAL_CODE_ROOT")"; fi
build_tsx_wrapper "$POSIX_ROOT" "$REAL_TSX"
MSYS_NO_PATHCONV=1 run "valid, POSIX-form CODE_ROOT"
cp "$T/tsx-wrapper.orig" "$REAL_TSX"

cd /
rm -rf "$T" "$TELEM_DIR"
