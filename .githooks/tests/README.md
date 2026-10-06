# Hook arm scripts

Gate Verification arms for the data-repo hooks. Every arm goes through a **real `git commit`**, so it exercises the same `GIT_INDEX_FILE` that production uses, on **both index paths** (a bare commit and a pathspec commit).

> **These scripts PRINT results; they do not ASSERT.** A CI job (t/3913) must compare each arm against the table below, checking **both** the commit outcome (`COMMIT CREATED` / `REFUSED`) **and** the hook's tagged output. In warn mode every commit succeeds, so "the commit was created" proves nothing (Sage #202). Only the printed warning distinguishes a firing arm from a silent one.

| Script | Hook | Runs in | Needs |
|---|---|---|---|
| `gv-commit-msg.sh <1\|0>` | `commit-msg` (node-removal guard, t/3851) | temp repo | bash, git, python3 |
| `gv-situations-bdi.sh <1\|0>` | `pre-commit` → `situations-bdi-check` (t/3892) | temp repo | + `pwsh`, `AI_TRIAD_CODE_ROOT` = an ai-triad-research checkout with `origin/main` fetched |
| `gv-pov-tags.sh <1\|0>` | `pre-commit` → `pov-tags-check` (t/3970) | temp repo | + `node`, `AI_TRIAD_CODE_ROOT` = an ai-triad-research checkout with `node_modules` installed |
| `livefire-situations-bdi.sh [ref]` | the **deployed** situation check | **a throwaway worktree of this repo**: real `core.hooksPath`, real `situations.json`; commits are local and discarded, never pushed | + `pwsh`, the code repo as a sibling of this repo's main checkout |

`<1|0>` is `WARN_ONLY`. Run both. `HOOK_SRC` overrides which `.githooks` is under test (default: the directory above `tests/`).

**Why the live-fire exists:** the two temp-repo harnesses could not catch the two defects fixed in #17. Both appear only **inside a linked worktree**, using the **default** code-root path: `--show-toplevel` resolves to the worktree, and git exports `GIT_DIR` to hooks, which overrides `git -C`. CI should run the hook arms from a linked worktree as well as a normal checkout.

## Expected results

### `gv-commit-msg.sh`
| Arm | Blocking (`0`) | Warn (`1`) | Tag to assert |
|---|---|---|---|
| 1 clean, taxonomy untouched | created | created | none |
| 2 removal, no ack (bare) | **refused** | created | `[node-removal-guard]` naming `acc-002` + whole-index warning |
| 3 removal, correct ack | created | created | OK line |
| 4 removal, wrong ack | **refused** | created | names both the spurious (`acc-999`) and the unacked (`acc-002`) id |
| 5 addition only | created | created | none |
| 6 malformed staged JSON | **refused** | created | COULD NOT VERIFY / refuse-to-guess |
| 7 HEAD malformed, commit repairs it | created | created | repair escape |
| 8 pathspec, peer's removal staged | created (`README.md` only; 3 nodes at commit) | created | none |
| 9 pathspec, own removal | **refused** | created | fires, trailer advice, **no** whole-index warning |
| 10 pathspec, own removal, acked | created | created | OK line |
| 11 reachability: unmerged path | git aborts first; the hook never runs | same | prints `OK: hook never ran` |
| 12 whole-file deletion | **refused** | created | all of the file's nodes named |
| 13 BOM in staged copy, no removal | created | created | none (**not** COULD NOT VERIFY) |
| 14 BOM at HEAD, plain staged + removal | **refused** | created | fires, names `acc-002` |
| 15 BOM on both sides + removal | **refused** | created | fires, names `acc-002` |

### `gv-situations-bdi.sh`
| Arm | Blocking (`0`) | Warn (`1`) | Tag to assert | Record `result` |
|---|---|---|---|---|
| 1 `situations.json` not staged | created | created | none | `skip` |
| 2 valid new situation | created | created | none | `pass` |
| 3 flat new situation | **refused** | created | `[situation-bdi] WARNING` naming it | `violation` |
| 4 `N/A` belief (sentinel) | **refused** | created | `[situation-bdi] WARNING` | `violation` |
| 5 changed-only: untouched live flat + valid edit | created | created | none | `pass` |
| 6 index not disk: flat edit left unstaged | created (`sit-006` not in commit) | created | none | `pass` |
| 7 pathspec commit of a flat file | **refused** | created | `[situation-bdi] WARNING` | `violation` |
| 8 pathspec of unrelated file, peer's flat staged | created (`README.md` only) | created | none | `skip` |
| 9 checker ref unreadable | **refused** | created | `[situation-bdi] COULD NOT VERIFY` | `unverified` |
| 10 `pwsh` absent from PATH | **refused** | created | `[situation-bdi] COULD NOT VERIFY` | `unverified` |

**Execution record (t/3892#6).** Every arm must append **exactly one** line to the hook's telemetry log, printed by the harness as `telemetry: <result>/<action>`. `action` is `refused` where blocking mode refuses the commit, otherwise `allowed`. This is the only thing that tells a silent pass (arms 2, 5, 6) from a hook that never ran, and it is what the real warn cycle is read from. The harness points `AI_TRIAD_HOOK_TELEMETRY` at a file **outside** the temp repo, because each arm's `git clean -fd` would delete one inside it. Since t/3970, `pre-commit` also runs `pov-tags-check` and appends its OWN record to this SAME shared file -- `telemetry_since()` filters to `"hook":"situation-bdi"` lines specifically, never just "the last line" or "any new line," so a sibling hook's quiet pass can't be mistaken for (or mask) this one's record.

### `gv-pov-tags.sh`
| Arm | Blocking (`0`) | Warn (`1`) | Tag to assert | Record `result` |
|---|---|---|---|---|
| 1 no watched file staged | created | created | none | `skip` |
| 2 valid tagged node, registered id, one-element array | created | created | none | `pass` |
| 3 unknown tag id | **refused** | created | `[pov-tags] WARNING` naming it | `violation` |
| 4 duplicate tag id | **refused** | created | `[pov-tags] WARNING` | `violation` |
| 5 wrong-POV id (registered for a different POV) | **refused** | created | `[pov-tags] WARNING` | `violation` |
| 6 scalar `pov_tags` (not an array) | **refused** | created | `[pov-tags] WARNING` | `violation` |
| 7 tags on a situation node | **refused** | created | `[pov-tags] WARNING` | `violation` |
| 8 unrelated file staged, peer's bad tag unstaged on disk | created (`README.md` only) | created | none | `skip` |
| 9 tsx unreachable | **refused** | created | `[pov-tags] COULD NOT VERIFY` | `unverified` |

The live registry (`lib/debate/soul-docs/pov-tags.json` on `origin/main`) is empty until t/3962 starts writing tags, so arms needing a *registered* id (2–7) build a throwaway fixture code-repo nested inside `AI_TRIAD_CODE_ROOT` -- the REAL `lib/schema/{povTags,pov-tags-cli}.ts` and `lib/flight-recorder/*.ts` (never reimplemented), plus a fixture registry with one controlled tag (`tag-a`, accelerationist-only) and a `node_modules/.bin/tsx` wrapper execing the real binary, so Node's upward `node_modules` resolution (for `zod`) still reaches the real checkout's install. Arm 9 removes that wrapper to prove the unreachable-tsx arm, independent of the fixture's own install state.

### `livefire-situations-bdi.sh` (warn mode, as deployed)
| Arm | Expect | Record |
|---|---|---|
| A flat situation, bare commit | `[situation-bdi] WARNING` naming `sit-livefire-001` × 3 POVs | `violation/allowed worktree=true` |
| B valid relabel of `sit-001` | no `[situation-bdi]` output | `pass/allowed worktree=true` |
| C flat situation, pathspec commit | `[situation-bdi] WARNING` | `violation/allowed worktree=true` |
| D bogus `AI_TRIAD_CODE_ROOT` | `COULD NOT VERIFY` naming the bogus path (override honoured) | `unverified/allowed worktree=true` |

Any `COULD NOT VERIFY` in arms A–C means the check **did not run**: a defect, not a pass. The live-fire sends its records to a temp file, never the real warn-cycle log.
