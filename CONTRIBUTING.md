# Contributing to `ai-triad-data`

This is the data companion to `ai-triad-research`. Every commit here is a **change record for the taxonomy** — a curated JSON dataset that agents, humans, and CI all read. Git history is the primary audit log; there is no other database.

The rules below make the log trustworthy. They are enforced by (a) reviewer expectation, (b) a `commit-hygiene` workflow that emits **warnings only**, and (c) the conventions the code repo already uses (see `ai-triad-research/AGENTS.md` § *Git Commit Rule (Multi-Agent)*).

Related: [t/1319 — Commit provenance](https://github.com/) ("2026-07-04 introduced this doc after 18 anonymous 'chore: pipeline update' commits confused a real incident diagnosis.")

---

## 1. Every commit self-describes

**Subject line** — 15+ characters, imperative mood, operation-first:

```
feat(taxonomy): apply cc→sit ID migration — 246 nodes renumbered (t/1308)
fix(taxonomy): clamp 95 out-of-range operationality values to 5 (t/1320)
chore(data): checkpoint outstanding work-product before cc→sit migration (t/1308)
pipeline(nightly-summaries): 47 new summaries + embeddings updated (run 4a2b1c)
```

**Body** — required when any of the following are true:
- Commit touches more than one taxonomy surface
- Commit is one-way-door (migrations, mass renames, deletes)
- Commit was authored by a tool (see § 3)
- Reviewer needs context beyond the subject to sanity-check

Bodies should answer *why*, cite tickets, list the before/after shape when relevant, and (for tools) name the run id.

---

## 2. Trailers

Mirror the code-repo conventions:

```
Ticket: t/1320
Run-Id: 4a2b1c-2026-07-04T14:30Z
Triggered-By: agent:PowerShell
Co-Authored-By: PowerShell (Orca) <main.scripts@ai-triad-research.orca.local>
Co-Authored-By: Technical Lead (Orca) <main.engineering-tech-lead@ai-triad-research.orca.local>
Co-Authored-By: Claude Opus 4.7 <noreply@anthropic.com>
```

Rules of use:

- **`Ticket:`** — cite every relevant ticket. Prefer over inline `(t/NNNN)` in the subject when there are 2+ tickets.
- **`Run-Id:`** — required for tool-authored commits (§ 3). Skip for hand-authored.
- **`Triggered-By:`** — required for tool-authored commits. Format: `agent:<name>`, `user:<username>`, or `schedule:<workflow-name>`.
- **`Co-Authored-By:`** — one line per human or Orca agent whose work is materially in the commit. Follow the code-repo pattern verbatim.

---

## 3. Tool-generated commits

Any commit written by a script, workflow-app pipeline, CI job, or agent-driven cmdlet MUST identify itself.

**Subject pattern:**

```
pipeline(<workflow-name>): <one-line summary>
```

**Required trailers:** `Run-Id`, `Triggered-By`. Optional but recommended: `Surfaces` (comma-separated directory list — narrows blast-radius diagnosis).

**Concrete example — the workflow-app runner emits:**

```
pipeline(nightly-summaries): 47 new summaries + embeddings updated

Run-Id: 4a2b1c-2026-07-04T14:30Z
Triggered-By: schedule:nightly-summaries
Surfaces: summaries, taxonomy/Origin
Tool: workflow-app v0.9.4
```

**Anti-patterns (will be flagged as warnings):**

```
chore: pipeline update            ← anonymous, no run id, no scope
chore: sync                       ← no operation, no context
update                            ← under 15 chars
```

---

## 4. Migration and bulk-write commits

One-way-door writes (mass renames, schema migrations, deletes) get a full body citing:

1. **What** — every affected surface with a count
2. **Why** — the ticket + owner decision reference
3. **How to unwind** — mapping-file location, `-Reverse` cmdlet flag, tag name
4. **Verification** — the invariant(s) checked and their result

Reference implementation:
- `feat(taxonomy): apply cc→sit ID migration — 246 nodes renumbered, 7,807 refs rewritten (t/1308)` — commit body enumerates per-surface counts, Layer A/B verification, mapping-file location.

Migrations that touch > 100 files should be preceded by a `chore(data): checkpoint…` commit so the pre-migration tag has a coherent target.

---

## 5. What NOT to do

**`git add -A` without pathspec** — sweeps whatever else is dirty into your commit. Data repo commonly carries pipeline WIP (calibration logs, in-flight debate JSON) — a bare `-A` mixes them into your ticketed work.

Exceptions:
- **The one sanctioned use** is a TL-authorized checkpoint of legitimately-outstanding work-product ahead of a one-way-door migration (see t/1308#10 for the precedent). Cite the authorizing ticket in the body.
- Otherwise: `git commit -- <paths>` with explicit pathspecs, always.

**Anonymous subjects** — `chore: pipeline update`, `chore: sync`, `update`, `fix`. Flagged by `commit-hygiene`. The workflow-app runner has been retemplated (t/1319 Deliverable 1) so pipeline commits now name their workflow + run id.

**Skipping hooks** — `--no-verify` bypasses the same checks CI runs; use it only when a hook fails for a truly unrelated reason and cite the reason in the body.

**Amending shared history** — `git commit --amend` and `git rebase -i` on `main` rewrite history. Multi-agent surface — another agent may have branched off the commit you're amending. New commits are always OK; amends are not.

---

## 6. Reviewing commits

- Check the subject matches the operation (not the file list).
- If body missing where § 1 requires it, ask for one.
- If tool commit without `Run-Id` / `Triggered-By`, ask for one.
- If `git add -A` was used, ask why — often the answer is "I forgot"; the fix is `git reset --mixed HEAD~1` + explicit re-add.

The `commit-hygiene` workflow surfaces the same issues automatically as annotations on the PR / push. It is **advisory** — it does not gate merges — so reviewer eyes remain load-bearing.
