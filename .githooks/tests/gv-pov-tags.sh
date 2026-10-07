#!/usr/bin/env bash
# t/3970 Gate Verification: pov-tags pre-commit, every arm through REAL `git commit`.
# $1 = 1 (warn-only) | 0 (blocking)
#
# The live registry (lib/debate/soul-docs/pov-tags.json on origin/main) is EMPTY today
# (t/3962 hasn't started writing tags yet), so arms that need a REGISTERED tag id build
# their own fixture code-repo rather than depending on live content that could change
# registry population independently of this hook's correctness:
#   FIXTURE = a throwaway git repo, nested INSIDE the real ai-triad-research checkout
#   (AI_TRIAD_CODE_ROOT) so node's upward node_modules walk still finds the real
#   checkout's installed zod -- containing the REAL lib/schema/{povTags,pov-tags-cli}.ts
#   and lib/flight-recorder/*.ts (copied verbatim: the RULE under test must be the real
#   rule, never a reimplementation) plus a FIXTURE lib/debate/soul-docs/pov-tags.json
#   with one controlled tag, "tag-a", registered for accelerationist only.
set -uo pipefail
HOOKS="${HOOK_SRC:-$(cd "$(dirname "$0")/.." && pwd)}"   # this repo's .githooks
: "${AI_TRIAD_CODE_ROOT:?set AI_TRIAD_CODE_ROOT to an ai-triad-research checkout with node_modules installed}"
REAL_CODE_ROOT="$AI_TRIAD_CODE_ROOT"
command -v node >/dev/null 2>&1 || { echo "FATAL: node required"; exit 1; }
wp () { if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else printf '%s' "$1"; fi; }

MODE="${1:?usage: gv-pov-tags.sh <1=warn|0=blocking>}"

T="$(mktemp -d)"; cd "$T" || exit 1
git init -q .; git config user.email t@t.t; git config user.name t
mkdir -p .githooks taxonomy/Origin

cp "$HOOKS/pov-tags-diff.mjs" .githooks/
sed "s/^WARN_ONLY=1$/WARN_ONLY=$MODE/" "$HOOKS/pov-tags-check" > .githooks/pov-tags-check
chmod +x .githooks/*
printf '#!/usr/bin/env bash\nset -uo pipefail\n"$(dirname "$0")/pov-tags-check"\n' > .githooks/pre-commit
chmod +x .githooks/pre-commit
git config core.hooksPath .githooks
grep -q "^WARN_ONLY=$MODE$" .githooks/pov-tags-check || { echo "FATAL: mode not set"; exit 1; }

# ---- build the fixture code-repo (real rule + controlled registry), nested so the real
# checkout's node_modules is still found by the upward walk. ----
# Lead review (t/4022): the fixture used to live at a bare `.gv-pov-tags-fixture.<pid>/` at
# CODE_ROOT's own root -- NOT gitignored, so it showed up as untracked drift in the shared
# checkout for the whole run (caught live: `.gv-pov-tags-fixture.11967/` visible mid-run).
# CODE_ROOT/tmp/ is already gitignored at the repo root and is the same location
# conflicts-shape-check uses for its own scratch dir (t/3953) -- same fix, same place.
mkdir -p "$REAL_CODE_ROOT/tmp" || { echo "FATAL: could not create $REAL_CODE_ROOT/tmp"; exit 1; }
FIXTURE="$(mktemp -d "$REAL_CODE_ROOT/tmp/gv-pov-tags-fixture.XXXXXX")" || { echo "FATAL: could not create a fixture dir under $REAL_CODE_ROOT/tmp"; exit 1; }
trap 'cd "$T" 2>/dev/null; rm -rf "$T" "$FIXTURE" "${TELEM_DIR:-}"' EXIT
mkdir -p "$FIXTURE/lib/schema" "$FIXTURE/lib/flight-recorder" "$FIXTURE/lib/debate/soul-docs"
for p in lib/schema/povTags.ts lib/schema/pov-tags-cli.ts \
         lib/flight-recorder/index.ts lib/flight-recorder/flightRecorder.ts lib/flight-recorder/dictionary.ts \
         lib/flight-recorder/ringBuffer.ts lib/flight-recorder/serializer.ts lib/flight-recorder/redact.ts \
         lib/flight-recorder/types.ts lib/flight-recorder/constants.ts; do
  cp "$REAL_CODE_ROOT/$p" "$FIXTURE/$p" || { echo "FATAL: missing $p in $REAL_CODE_ROOT"; exit 1; }
done
cat > "$FIXTURE/lib/debate/soul-docs/pov-tags.json" <<'EOF'
{
  "version": 1,
  "povs": {
    "accelerationist": [
      { "id": "tag-a", "label": "Tag A", "soul_doc": "accelerationist.tag-a", "description": "fixture tag for t/3970 GV" }
    ]
  }
}
EOF
# A tiny wrapper at $FIXTURE/node_modules/.bin/tsx, execing the REAL tsx by absolute path,
# so pov-tags-check's primary `[ -x "$TSX" ]` branch finds it directly -- NOT the
# `command -v tsx` PATH fallback, which mis-resolves a `/c/...`-style PATH entry under
# MSYS_NO_PATHCONV=1 (confirmed empirically: the entry comes out prefixed with the MSYS
# install root instead of the intended drive path). This wrapper is a harness-only
# artifact of simulating "fixture has no node_modules of its own" cleanly; production
# CODE_ROOT always has a real node_modules/.bin/tsx and never takes the PATH branch at all.
#
# t/4027: the wrapper used to `exec "$REAL_TSX" "$@"`, re-execing the REAL CODE_ROOT's
# own `.bin/tsx` shim from inside this wrapper script. Under MSYS_NO_PATHCONV=1, that
# shim's OWN internal path resolution breaks IF the embedded CODE_ROOT is a true
# POSIX-style path (`/c/...`): node receives it unconverted, misreads the leading `/`
# as "current drive root", and resolves to a mangled `C:\c\Users\...` -- harness-only
# (the REAL hooks invoke `.bin/tsx` directly, with no extra re-exec layer, and are
# unaffected: TL t/4021#5). Fix: skip the shim entirely and invoke tsx's own entry
# point via `node`, with the entry-point path winpath-converted at WRAPPER-CREATION
# time (not left as whatever form the caller's CODE_ROOT happens to be) so node, a
# native binary, never receives an unconverted POSIX argument. A function, not an
# inline block, so arm 11 can rebuild the SAME real wrapper from a different root
# form and prove the fix, rather than re-deriving a copy that could drift from it.
build_tsx_wrapper () {  # $1 = code root (either path form)  $2 = dest wrapper path
  local cli="$1/node_modules/tsx/dist/cli.mjs"
  if command -v cygpath >/dev/null 2>&1; then cli="$(cygpath -w "$cli")"; fi
  printf '#!/usr/bin/env bash\nexec node "%s" "$@"\n' "$cli" > "$2"
  chmod +x "$2"
}
mkdir -p "$FIXTURE/node_modules/.bin"
build_tsx_wrapper "$REAL_CODE_ROOT" "$FIXTURE/node_modules/.bin/tsx"
( cd "$FIXTURE" && git init -q . && git config user.email t@t.t && git config user.name t \
    && git add -A && git commit -qm fixture )
export AI_TRIAD_CODE_ROOT="$FIXTURE"
export AI_TRIAD_CHECKER_REF=HEAD

node () { # id file pov_tags-json-or-string   writes a taxonomy node fragment
  printf '{ "id": "%s", "label": "x" %s }' "$1" "$2"
}
write_file () { # relpath nodes-json-fragments...
  local rel="$1"; shift
  printf '{ "nodes": [ %s ] }\n' "$(IFS=,; echo "$*")" > "$T/$rel"
}

SEED_ACC () { write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')"; }
SEED_SAF () { write_file taxonomy/Origin/safetyist.json "$(node saf-001 '')"; }
SEED_SIT () { write_file taxonomy/Origin/situations.json "$(node sit-001 '')"; }
SEED_FILES () { SEED_ACC; SEED_SAF; SEED_SIT; echo seed > README.md; }
SEED_FILES; git add -A >/dev/null 2>&1; git commit -qm seed --no-verify; SEED="$(git rev-parse HEAD)"
reseed () { git reset -q --hard "$SEED"; git clean -qfd >/dev/null 2>&1; }   # $FIXTURE lives under $REAL_CODE_ROOT/tmp/, never inside $T, so no exclusion is needed here

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
  grep -E "pov-tags|^\s+(acc|saf|sit)-" <<<"$out" | sed 's/^/    /'
  telemetry_since "$n0"
  after="$(git rev-parse HEAD)"
  [ "$before" = "$after" ] && r=REFUSED || r=CREATED
  echo "    => rc=$rc COMMIT $r   ($(( (t1-t0)/1000000 )) ms)"
}

echo "================ t/3970 GV — WARN_ONLY=$MODE ================"

arm "1 CLEAN: no watched file in commit → silent"
reseed; echo x >> README.md; git add README.md; run "docs"

arm "2 VALID: new tagged node, registered id, one-element array → silent"
reseed; write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-002 ', "pov_tags": ["tag-a"]')"
git add taxonomy/Origin/accelerationist.json; run "add valid tag"

arm "3 UNKNOWN id → FIRES"
reseed; write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-003 ', "pov_tags": ["not-a-real-tag"]')"
git add taxonomy/Origin/accelerationist.json; run "add unknown tag"

arm "4 DUPLICATE id → FIRES"
reseed; write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-004 ', "pov_tags": ["tag-a", "tag-a"]')"
git add taxonomy/Origin/accelerationist.json; run "add duplicate tag"

arm "5 WRONG-POV id: safetyist node using an accelerationist-only tag → FIRES"
reseed; write_file taxonomy/Origin/safetyist.json "$(node saf-001 '')" "$(node saf-002 ', "pov_tags": ["tag-a"]')"
git add taxonomy/Origin/safetyist.json; run "add wrong-pov tag"

arm "6 SCALAR pov_tags (not an array) → FIRES"
reseed; write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-005 ', "pov_tags": "tag-a"')"
git add taxonomy/Origin/accelerationist.json; run "add scalar tag"

arm "7 TAGS ON A SITUATION → FIRES"
reseed; write_file taxonomy/Origin/situations.json "$(node sit-001 '')" "$(node sit-002 ', "pov_tags": ["tag-a"]')"
git add taxonomy/Origin/situations.json; run "add situation tag"

arm "8 UNRELATED file staged while a peer's bad tag sits unstaged on disk → silent"
reseed
write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-006 ', "pov_tags": "unstaged-scalar"')"
echo y >> README.md; git add README.md
run "docs by peer" -- README.md
echo "    -> files in commit: $(git show --name-only --format= HEAD | tr '\n' ' ')"

arm "9 COULD NOT VERIFY: tsx unreachable (no fixture wrapper, not on PATH) → reported, not silent"
reseed; write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-007 ', "pov_tags": ["tag-a"]')"
git add taxonomy/Origin/accelerationist.json
mv "$FIXTURE/node_modules/.bin/tsx" "$FIXTURE/node_modules/.bin/tsx.disabled"
NOTSX_PATH="$(printf '%s' "$PATH" | tr ':' '\n' | while read -r d; do
  [ -x "$d/tsx" ] || [ -x "$d/tsx.CMD" ] || [ -x "$d/tsx.cmd" ] || printf '%s:' "$d"
done)"
if PATH="$NOTSX_PATH" command -v tsx >/dev/null 2>&1; then
  echo "    HARNESS ERROR: tsx still visible on stripped PATH -- arm 9 would not test 'tsx absent'"; exit 1
fi
PATH="$NOTSX_PATH" run "no tsx"
mv "$FIXTURE/node_modules/.bin/tsx.disabled" "$FIXTURE/node_modules/.bin/tsx"

arm "10 COULD NOT VERIFY: checker fails to load (t/4022) → reported as unverified, NEVER violation"
# t/4022: node ALSO exits 1 on an uncaught load error (module not found, syntax error), which
# COLLIDES with the CLI's own exit-1 "invalid tags" verdict unless the hook parses the last
# line as real verdict JSON first. To exercise THIS specific code path (not the separate,
# already-correct "closure file missing -> unverified" extraction guard a few lines up), the
# extraction must SUCCEED and tsx must then THROW AT RUNTIME -- so this corrupts the CONTENT
# of an already-listed closure file (a bad import prepended to pov-tags-cli.ts) rather than
# deleting a file from the list. Every extracted file still exists; the CLI just can't load.
FIXTURE_CLI="$FIXTURE/lib/schema/pov-tags-cli.ts"
CLI_BACKUP="$T/pov-tags-cli.ts.orig"   # OUTSIDE $FIXTURE's tree -- `git add -A` inside the
                                        # fixture must never sweep this up, or resetting past
                                        # the break-commit deletes the backup along with it.
reseed; write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-008 ', "pov_tags": ["tag-a"]')"
git add taxonomy/Origin/accelerationist.json
cp "$FIXTURE_CLI" "$CLI_BACKUP"
printf "import './this-module-does-not-exist.js';\n%s" "$(cat "$FIXTURE_CLI")" > "$FIXTURE_CLI"
( cd "$FIXTURE" && git add -- lib/schema/pov-tags-cli.ts && git commit -qm "break loading" )
run "checker broken"
( cd "$FIXTURE" && git reset -q --hard HEAD~1 )
cp "$CLI_BACKUP" "$FIXTURE_CLI"

arm "11 VALID under MSYS_NO_PATHCONV=1 with a POSIX-form CODE_ROOT (t/4027) → silent, not COULD NOT VERIFY"
# t/4027: the actual trigger, found by direct reproduction, is narrower than "MSYS_NO_
# PATHCONV=1 is set" (arms 1-10 already run under that, via pov-tags-check's own
# unconditional `export MSYS_NO_PATHCONV=1`, and all pass) -- it needs the path fed into
# the wrapper's embedded tsx location to arrive as a TRUE POSIX-style path (`/c/...`),
# not the `C:/...` drive-letter form every other arm's wrapper was built from. Rebuild
# the SAME wrapper via `build_tsx_wrapper` (the real subject code, not a re-derived
# copy that could silently drift from it) from a POSIX-converted root, so this proves
# the fix for the one caller-format combination that actually broke it.
reseed; write_file taxonomy/Origin/accelerationist.json "$(node acc-001 '')" "$(node acc-011 ', "pov_tags": ["tag-a"]')"
git add taxonomy/Origin/accelerationist.json
# Backup goes to $T AFTER reseed, not before: reseed's `git clean -qfd` runs inside $T
# (the harness cd'd there at the top) and deletes any untracked file created earlier
# in $T's own working tree -- the exact cleanup bug already fixed once in arm 10
# (t/4022), here for the same backup-location reason.
cp "$FIXTURE/node_modules/.bin/tsx" "$T/tsx-wrapper.orig"
# No cygpath on CI's ubuntu-latest (the whole POSIX-vs-Windows-path distinction is
# MSYS-specific) -- fall back to the unchanged root there, where it's a no-op and the
# arm still asserts a plain pass, rather than letting the command substitution fail
# and silently feed build_tsx_wrapper an empty string (t/4027 CI failure, found live).
POSIX_ROOT="$REAL_CODE_ROOT"
if command -v cygpath >/dev/null 2>&1; then POSIX_ROOT="$(cygpath -u "$REAL_CODE_ROOT")"; fi
build_tsx_wrapper "$POSIX_ROOT" "$FIXTURE/node_modules/.bin/tsx"
MSYS_NO_PATHCONV=1 run "valid, POSIX-form CODE_ROOT"
cp "$T/tsx-wrapper.orig" "$FIXTURE/node_modules/.bin/tsx"

cd /
