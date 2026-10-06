#!/usr/bin/env bash
# t/3892 live-fire (usage: livefire-situations-bdi.sh [ref]): the DEPLOYED situation-BDI hook, in the REAL ai-triad-data repo
# (real core.hooksPath, real 5.7 MB situations.json), through real `git commit`.
# Throwaway worktree off origin/main; commits are local only and are discarded. NEVER pushed.
set -uo pipefail
# The data repo's MAIN checkout, from the common git dir (works from any worktree).
DATA="$(dirname "$(git -C "$(dirname "$0")" rev-parse --path-format=absolute --git-common-dir)")"
REF="${1:-origin/main}"   # commit whose .githooks to live-fire (default: origin/main)
WT="$DATA/.worktrees/tl-livefire-3892b"
BR="tl/livefire-3892-DO-NOT-PUSH-b"
SIT="taxonomy/Origin/situations.json"
# Windows-form path for pwsh/python on Git-for-Windows; identity elsewhere (Linux CI).
wp () { if command -v cygpath >/dev/null 2>&1; then cygpath -w "$1"; else printf '%s' "$1"; fi; }

cd "$DATA" || exit 1
git fetch -q origin
BASE="$(git rev-parse "$REF")"
git worktree add -q -b "$BR" "$WT" "$BASE" || exit 1
trap 'cd "$DATA"; git worktree remove --force "$WT" 2>/dev/null; git branch -q -D "$BR" 2>/dev/null; rm -f "${TELEM:-}"; echo "[cleanup] worktree + branch removed; nothing pushed"' EXIT
cd "$WT" || exit 1
echo "base=$(git rev-parse --short "$BASE")  hooksPath=$(git config --get core.hooksPath)  hook mode=$(git ls-tree HEAD .githooks/situations-bdi-check | cut -c1-6)"

mutate () {  # $1 = flat | relabel
  python - "$1" "$(wp "$WT/$SIT")" <<'PY'
import json, sys
mode, p = sys.argv[1], sys.argv[2]
raw = open(p, encoding="utf-8-sig").read()
d = json.loads(raw)
if mode == "flat":
    d["nodes"].append({"id": "sit-livefire-001", "label": "TL live-fire probe (never pushed)",
        "description": "probe", "interpretations": {"accelerationist": "flat prose a",
        "safetyist": "flat prose s", "skeptic": "flat prose k"}})
elif mode == "relabel":
    n = next(n for n in d["nodes"] if n["id"] == "sit-001"); n["label"] += " (probe)"
open(p, "w", encoding="utf-8", newline="\n").write(json.dumps(d, indent=2, ensure_ascii=False) + "\n")
PY
}
# Probe records go to a temp file, never the real warn-cycle log (t/3892#6).
TELEM="$(mktemp)"; export AI_TRIAD_HOOK_TELEMETRY="$TELEM"
run () {  # label, then git commit args
  local label="$1"; shift; local before t0 t1 out rc n0 n1
  before="$(git rev-parse HEAD)"; t0=$(date +%s%N); n0="$(wc -l < "$TELEM" | tr -d ' ')"
  out="$(git commit "$@" 2>&1)"; rc=$?; t1=$(date +%s%N); n1="$(wc -l < "$TELEM" | tr -d ' ')"
  echo; echo "### $label   (rc=$rc, $(( (t1-t0)/1000000 )) ms, commit $([ "$before" = "$(git rev-parse HEAD)" ] && echo REFUSED || echo CREATED))"
  printf '%s\n' "$out" | grep -E '\[situation-bdi\]|^\s+sit-|COULD NOT|not BDI' | sed 's/^/    /'
  printf '%s\n' "$out" | grep -qE '\[situation-bdi\]' || echo "    (no [situation-bdi] output)"
  if [ "$n1" -gt "$n0" ]; then
    # t/3970: pre-commit also runs pov-tags-check now, appending its OWN record to this
    # same shared file -- filter to "situation-bdi"'s lines specifically (never just the
    # last line) so a sibling hook's record can't be mistaken for this one's.
    local new_lines sbd_count; new_lines="$(tail -n "$(( n1 - n0 ))" "$TELEM")"
    sbd_count="$(printf '%s\n' "$new_lines" | grep -c '"hook":"situation-bdi"')"
    printf '%s\n' "$new_lines" | grep '"hook":"situation-bdi"' | tail -n 1 \
      | sed -n 's/.*"result":"\([a-z]*\)","action":"\([a-z]*\)".*"worktree":\([a-z]*\).*/    telemetry: \1\/\2 worktree=\3/p'
    [ "$sbd_count" -eq 0 ] && echo "    telemetry: (none for situation-bdi)"
  else
    echo "    telemetry: (none)"
  fi
}
reset_to_base () { git reset -q --hard "$BASE"; }

mutate flat;    git add -- "$SIT"; run "A  flat situation added (bare commit) -> expect WARNING naming sit-livefire-001" -m "probe A"
reset_to_base
mutate relabel; git add -- "$SIT"; run "B  valid relabel of decomposed sit-001 -> expect silent"             -m "probe B"
reset_to_base
mutate flat;                       run "C  flat situation, PATHSPEC commit (temp index) -> expect WARNING"   -m "probe C" -- "$SIT"
reset_to_base
mutate flat; git add -- "$SIT"; AI_TRIAD_CODE_ROOT="C:/nonexistent/code" run "D  override honoured: bogus AI_TRIAD_CODE_ROOT -> expect COULD NOT VERIFY naming C:/nonexistent/code" -m "probe D"
echo; echo "origin/main still $(git rev-parse --short origin/main) (not pushed: $( [ "$(git rev-parse origin/main)" = "$(git -C "$DATA" rev-parse origin/main)" ] && echo yes || echo NO))"
