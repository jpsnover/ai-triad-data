#!/usr/bin/env bash
# t/3851 node-removal guard (commit-msg): 15 arms. Every arm through a REAL `git commit` (production's
# GIT_INDEX_FILE, not a harness's -- e/243#4). Covers BOTH index paths.
#
# v1 harness bug, fixed here: under WARN_ONLY a firing commit still SUCCEEDS,
# so `reset --hard HEAD` pinned the tree to the post-removal state and later
# arms silently no-op'd with "nothing to commit". Every arm now reseeds from a
# fixed SHA, and each arm ASSERTS it actually produced a commit attempt.
#
# $1 = 1 (warn-only) | 0 (blocking). Run both.
set -uo pipefail

MODE="${1:?usage: gv-commit-msg.sh <1=warn|0=blocking>}"
# Hook under test: $HOOK_SRC if set, else this repo's .githooks (the directory above tests/).
SRC="${HOOK_SRC:-$(cd "$(dirname "$0")/.." && pwd)}"
echo "hook under test: $SRC"
T="$(mktemp -d)"; cd "$T" || exit 1
git init -q .; git config user.email t@t.t; git config user.name t
git config advice.ignoredHook false
mkdir -p taxonomy/Origin .githooks
cp "$SRC/taxonomy_node_removal_verdict.py" .githooks/
sed "s/^WARN_ONLY=1$/WARN_ONLY=$MODE/" "$SRC/commit-msg" > .githooks/commit-msg
chmod +x .githooks/commit-msg; git config core.hooksPath .githooks
grep -q "^WARN_ONLY=$MODE$" .githooks/commit-msg \
  || { echo "FATAL: WARN_ONLY not set to $MODE in hook copy"; exit 1; }

seed_files () {
  cat > taxonomy/Origin/accelerationist.json <<'EOF'
{ "nodes": [ { "id": "acc-001" }, { "id": "acc-002" }, { "id": "acc-003" } ] }
EOF
  cat > taxonomy/Origin/situations.json <<'EOF'
{ "nodes": [ { "id": "sit-001", "linked_nodes": ["acc-002"] },
             { "id": "sit-002", "linked_nodes": ["acc-003"] } ] }
EOF
  cat > taxonomy/Origin/edges.json <<'EOF'
{ "edges": [ { "source": "acc-002", "target": "acc-001", "type": "SUPPORTS" },
             { "source": "acc-003", "target": "acc-002", "type": "REFUTES" },
             { "source": "acc-001", "target": "acc-003", "type": "SUPPORTS" } ] }
EOF
  for f in safetyist skeptic; do
    printf '{ "nodes": [ { "id": "%s-001" } ] }\n' "$f" > "taxonomy/Origin/$f.json"
  done
  echo original > README.md
}
seed_files; git add -A >/dev/null 2>&1; git commit -qm seed 2>/dev/null
SEED="$(git rev-parse HEAD)"

reseed () { git reset -q --hard "$SEED" 2>/dev/null; git clean -qfd 2>/dev/null; }
remove_acc002 () {
  cat > taxonomy/Origin/accelerationist.json <<'EOF'
{ "nodes": [ { "id": "acc-001" }, { "id": "acc-003" } ] }
EOF
}

arm () { echo; echo "################ $1"; }
run () { # $1=msg, rest=commit args.  Asserts a real attempt happened.
  local m="$1"; shift
  local before; before="$(git rev-parse HEAD)"
  local out rc
  out="$(git commit -m "$m" "$@" 2>&1)"; rc=$?
  if grep -q "nothing to commit" <<<"$out"; then
    echo "    *** HARNESS ERROR: nothing staged — this arm tested NOTHING ***"
    return 9
  fi
  grep -vE "^(warning: in the working copy|\[master|\s*[0-9]+ file|\s*(create|delete) mode)" <<<"$out" | sed 's/^/    /'
  local after; after="$(git rev-parse HEAD)"
  if [ "$before" = "$after" ]; then echo "    => rc=$rc  COMMIT REFUSED"
  else echo "    => rc=$rc  COMMIT CREATED"; fi
}

echo "=================================================================="
echo " t/3851 arm set — WARN_ONLY=$MODE   (0=blocking, 1=advisory)"
echo "=================================================================="

arm "ARM 1 — CLEAN: taxonomy untouched (bare).  expect: silent, created"
reseed; echo "edit" > README.md; git add README.md; run "docs: readme"

arm "ARM 2 — FIRE, BARE: removal, no ack.  expect: fire + WHOLE-INDEX warning"
reseed; remove_acc002; git add taxonomy/Origin/accelerationist.json
run "fix: drop a node"

arm "ARM 3 — PASS, BARE: correct ack.  expect: OK line, created"
reseed; remove_acc002; git add taxonomy/Origin/accelerationist.json
run "fix: drop a node

Taxonomy-Node-Removal: acc-002"

arm "ARM 4 — FIRE: stale/wrong ack.  expect: spurious + unacked both named"
reseed; remove_acc002; git add taxonomy/Origin/accelerationist.json
run "fix: drop a node

Taxonomy-Node-Removal: acc-999"

arm "ARM 5 — PASS: addition only.  expect: silent, created"
reseed
cat > taxonomy/Origin/accelerationist.json <<'EOF'
{ "nodes": [ { "id": "acc-001" }, { "id": "acc-002" }, { "id": "acc-003" }, { "id": "acc-004" } ] }
EOF
git add taxonomy/Origin/accelerationist.json; run "feat: add a node"

arm "ARM 6 — COULD NOT VERIFY: malformed staged.  expect: refuse-to-guess"
reseed; echo '{ not json' > taxonomy/Origin/accelerationist.json
git add taxonomy/Origin/accelerationist.json; run "break it"

arm "ARM 7 — Q4 REPAIR ESCAPE: HEAD malformed, commit fixes it.  expect: permit"
reseed; echo '{ not json' > taxonomy/Origin/accelerationist.json
git add taxonomy/Origin/accelerationist.json
git commit -qm "chore: broken json" --no-verify >/dev/null 2>&1
BROKEN="$(git rev-parse HEAD)"
seed_files; git add taxonomy/Origin/accelerationist.json
run "fix: repair malformed accelerationist.json"
git reset -q --hard "$BROKEN" 2>/dev/null

arm "ARM 8 — PATHSPEC ISOLATION: peer's removal staged, B commits own file"
echo "    expect: SILENT (peer's removal invisible), README-only commit"
reseed
remove_acc002; git add taxonomy/Origin/accelerationist.json   # agent A stages
echo "B change" > README.md; git add README.md                 # agent B stages
run "docs: unrelated tweak by agent B" -- README.md
echo "    -> files in commit: $(git show --name-only --format= HEAD | tr '\n' ' ')"
# grep -o | wc -l, NOT grep -c: the JSON is one line, so grep -c returns 1
# regardless of node count and reads as a result. (Caught in the v1 run.)
_n=$(git show HEAD:taxonomy/Origin/accelerationist.json | grep -o '"id"' | wc -l | tr -d ' ')
echo "    -> nodes at that commit: $_n  (3 => peer's removal NOT swept in; 2 => it was)"

arm "ARM 9 — PATHSPEC, OWN removal.  expect: fire, trailer advice, NO whole-index warning"
reseed; remove_acc002
run "fix: drop a node via pathspec" -- taxonomy/Origin/accelerationist.json

arm "ARM 10 — PATHSPEC, OWN removal, acked.  expect: OK, created"
reseed; remove_acc002
run "fix: drop a node via pathspec

Taxonomy-Node-Removal: acc-002" -- taxonomy/Origin/accelerationist.json

arm "ARM 11 — REACHABILITY: can the hook ever see an UNMERGED watched file?"
echo "    Pins the claim that justifies NOT handling 'U' in the hook. A conflicted"
echo "    path has no stage 0, so the hook WOULD misread it as a full-file removal"
echo "    -- but git aborts before any hook runs. If a future git changes that,"
echo "    this arm fails and the omission must be revisited."
reseed
git checkout -q -b sideA
cat > taxonomy/Origin/accelerationist.json <<'EOF'
{ "nodes": [ { "id": "acc-001" }, { "id": "acc-002" }, { "id": "acc-00A" } ] }
EOF
git commit -q --no-verify -m "A" -- taxonomy/Origin/accelerationist.json
git checkout -q master
cat > taxonomy/Origin/accelerationist.json <<'EOF'
{ "nodes": [ { "id": "acc-001" }, { "id": "acc-002" }, { "id": "acc-00B" } ] }
EOF
git commit -q --no-verify -m "B" -- taxonomy/Origin/accelerationist.json
git merge sideA >/dev/null 2>&1
echo "    staged status: $(git diff --cached --name-status -- taxonomy/Origin/accelerationist.json | tr -d '\n')"
echo "    unmerged?     $(git ls-files -u -- taxonomy/Origin/accelerationist.json | wc -l | tr -d ' ') stage entries"
out11="$(git commit -m "merge: resolve" 2>&1)"
out11b="$(git commit -m "partial" -- README.md 2>&1)"
grep -E "unmerged files|unresolved conflict|partial commit" <<<"$out11
$out11b" | sed 's/^/    git says: /'
if grep -q "node-removal-guard" <<<"$out11$out11b"; then
  echo "    *** REACHABLE: the hook RAN with an unmerged path — the 'U' omission"
  echo "        in commit-msg is now a real gap. Handle U explicitly. ***"
else
  echo "    OK: hook never ran (git aborted first) => 'U' is unreachable,"
  echo "        so omitting it from the hook is correct, not a gap."
fi
git merge --abort 2>/dev/null; git branch -qD sideA 2>/dev/null

arm "ARM 12 — WHOLE-FILE DELETION (staged 'D').  expect: all its nodes reported"
reseed; git rm -q taxonomy/Origin/skeptic.json
git diff --cached --name-status | sed 's/^/    staged: /'
run "chore: drop the skeptic file entirely"

# ---- BOM arms (DevOps, t/3851): PowerShell writes UTF-8 BOM'd JSON --------
bomify () { printf '\xef\xbb\xbf' | cat - "$1" > "$1.tmp" && mv "$1.tmp" "$1"; }
hasbom () { [ "$(head -c3 "$1" | od -An -tx1 | tr -d ' ')" = efbbbf ] && echo yes || echo NO; }

arm "ARM 13 — BOM in STAGED copy, no removal.  expect: SILENT, created (pre-fix: COULD NOT VERIFY)"
reseed; bomify taxonomy/Origin/accelerationist.json
echo "    staged copy has BOM: $(hasbom taxonomy/Origin/accelerationist.json)"
git add taxonomy/Origin/accelerationist.json; run "chore: re-save with BOM"

arm "ARM 14 — BOM at HEAD, staged plain + REMOVAL.  expect: FIRE (pre-fix: 'repair' escape SKIPPED it)"
reseed; bomify taxonomy/Origin/accelerationist.json
git add taxonomy/Origin/accelerationist.json; git commit -qm "bom at head" --no-verify
echo "    HEAD copy has BOM: $(git show HEAD:taxonomy/Origin/accelerationist.json | head -c3 | od -An -tx1 | tr -d ' ')"
remove_acc002; git add taxonomy/Origin/accelerationist.json
run "chore: strip BOM (and silently drop a node)"

arm "ARM 15 — BOM on BOTH sides + removal.  expect: FIRE, names acc-002"
reseed; bomify taxonomy/Origin/accelerationist.json
git add taxonomy/Origin/accelerationist.json; git commit -qm "bom at head" --no-verify
remove_acc002; bomify taxonomy/Origin/accelerationist.json
git add taxonomy/Origin/accelerationist.json; run "fix: drop a node, file still BOM'd"

echo
cd /; rm -rf "$T"
