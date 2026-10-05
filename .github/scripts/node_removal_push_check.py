"""Push-side re-check for unacknowledged taxonomy node removals (t/3870).

WHY THIS EXISTS
  .githooks/commit-msg (t/3851) asks a commit that removes taxonomy node IDs to
  name exactly those IDs in a `Taxonomy-Node-Removal:` trailer. It is a CLIENT
  hook, so it never runs for:
    - git commit --no-verify            (disarms every hook at once)
    - a checkout without core.hooksPath (t/3869)
    - a GitHub web-UI / API write
  This script re-runs the SAME predicate (imported, not copied --
  .githooks/taxonomy_node_removal_verdict.py) over whatever reached origin, on
  the server's terms, where none of those routes can switch it off.

REPORT-ONLY BY CONSTRUCTION (t/3870#1, #2)
  It runs after the push has landed, so it cannot refuse anything. Findings are
  ::warning:: annotations + a job summary + a non-zero exit that the workflow
  (continue-on-error) turns into an idempotent issue. True blocking would be a
  change to the data repo's whole write model (branch protection + PRs on a
  repo the fleet pushes to directly) -- a separate decision needing a mandatory
  Second Opinion, not a flip of this script.

WHAT IT EVALUATES
  Every commit in the pushed range, EACH against its own parent(s) and its own
  trailer -- not the tip alone, which would miss a mid-range removal and
  misattribute trailers (so an acknowledged removal is never double-reported).
    - ordinary commit: removed = ids(parent) - ids(commit)
    - merge commit:    removed = (ids present in EVERY parent) - ids(merge).
                       A node present in only one parent was removed on a side
                       branch and is judged on that branch's own commit; only a
                       removal the merge ITSELF makes (an "evil merge") is the
                       merge's to acknowledge.
    - force-push / history rewrite (old tip not an ancestor of the new tip):
                       also diff the OLD TIP against the NEW TIP. An ID that
                       existed at the old tip, is gone at the new tip, and is
                       acknowledged by no commit in the new range left through
                       the rewrite itself -- no per-commit diff can show that.

WHAT A GREEN DOES NOT MEAN
  It compares ID SETS. A removal acknowledged with the right IDs for the wrong
  reason passes, by design. Green = "every removal was named", never "every
  removal was reviewed".

CANNOT-VERIFY IS A FINDING, NOT A PASS
  A watched file that is unparseable or lacks a `nodes` array at a revision
  makes that file unevaluable for that commit; it is reported, never read as
  "nothing removed". (Same rule as the hook: reading nothing is an extractor
  failure, not a clean result.)

Usage:
  python3 .github/scripts/node_removal_push_check.py --before <sha> --after <sha> [--repo <path>]
Exit: 0 = no findings; 1 = findings or cannot-verify; 2 = usage/git error.
"""

import argparse
import json
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OWN_REPO = os.path.abspath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, os.path.join(OWN_REPO, ".githooks"))
from taxonomy_node_removal_verdict import acknowledged_ids, node_removal_verdict  # noqa: E402

WATCHED = [
    "taxonomy/Origin/accelerationist.json",
    "taxonomy/Origin/safetyist.json",
    "taxonomy/Origin/skeptic.json",
    "taxonomy/Origin/situations.json",
]
ZERO = "0" * 40


# ---------------------------------------------------------------- pure half --

def parse_trailer(message):
    """IDs named in Taxonomy-Node-Removal trailers -- delegates to the SHARED
    `acknowledged_ids` (taxonomy_node_removal_verdict.py, data 337c112a / t/3851#13),
    the same parser the commit-msg hook uses: one trailer format, one definition.

    Deliberately NOT shared (keep here): the JSON node-ID reader (Git.file_map /
    node_ids_from_doc) and WATCHED -- the verdict module stays pure, no I/O.
    """
    return acknowledged_ids(message.splitlines())


def node_ids_from_doc(doc):
    """-> set of IDs, or None when the document has no usable `nodes` array."""
    nodes = doc.get("nodes") if isinstance(doc, dict) else None
    if not isinstance(nodes, list):
        return None
    return {n["id"] for n in nodes if isinstance(n, dict) and "id" in n}


def removal_sets(parent_maps, child_map):
    """Pure. Each map is {path: ("ok", ids) | ("absent", set()) | ("bad", None)}.

    Returns (head_ids, child_ids, unverifiable) where head_ids are the IDs present
    in EVERY parent (so `head_ids - child_ids` is exactly what THIS commit removed)
    and unverifiable lists (path, why) for files that could not be compared.

    A file is compared only when it is readable at the commit AND in every parent:
      - bad at the commit                -> unverifiable (cannot tell what it removed)
      - bad in a parent, ok at the commit -> a repair; skipped, not a finding
    An ABSENT file contributes no IDs -- deleting a watched file wholesale really
    does remove every node in it, which is reported (same as the hook's arm 12).
    """
    unverifiable = []
    usable = []
    for path in WATCHED:
        c_state = child_map[path][0]
        p_states = [pm[path][0] for pm in parent_maps]
        if c_state == "bad":
            unverifiable.append((path, "unparseable or no 'nodes' array at this commit"))
            continue
        if "bad" in p_states:
            continue  # the commit repairs a corrupt parent file
        usable.append(path)

    child_ids = set()
    for path in usable:
        child_ids |= child_map[path][1]
    per_parent = []
    for pm in parent_maps:
        ids = set()
        for path in usable:
            ids |= pm[path][1]
        per_parent.append(ids)
    head_ids = set.intersection(*per_parent) if per_parent else set()
    return head_ids, child_ids, unverifiable


def rewrite_losses(old_tip_ids, new_tip_ids, acked_in_range, already_reported):
    """Pure. IDs lost through a history rewrite and acknowledged by nothing."""
    return sorted((set(old_tip_ids) - set(new_tip_ids)) - set(acked_in_range) - set(already_reported))


# ------------------------------------------------------------- impure half --

class Git:
    def __init__(self, repo):
        self.repo = repo

    def run(self, *args, check=True):
        r = subprocess.run(["git", "-C", self.repo, *args], capture_output=True, text=True,
                           encoding="utf-8", errors="replace")
        if check and r.returncode != 0:
            raise RuntimeError(f"git {' '.join(args)} failed: {r.stderr.strip()}")
        return r

    def exists(self, rev):
        return self.run("cat-file", "-e", f"{rev}^{{commit}}", check=False).returncode == 0

    def is_ancestor(self, a, b):
        return self.run("merge-base", "--is-ancestor", a, b, check=False).returncode == 0

    def parents(self, sha):
        return self.run("rev-list", "--parents", "-n", "1", sha).stdout.split()[1:]

    def message(self, sha):
        return self.run("log", "-1", "--format=%B", sha).stdout

    def file_map(self, rev):
        out = {}
        for path in WATCHED:
            r = self.run("show", f"{rev}:{path}", check=False)
            if r.returncode != 0:
                out[path] = ("absent", set())
                continue
            try:
                # BOM-tolerant: PowerShell writers emit a UTF-8 BOM, and json.loads rejects
                # one -- found on the real corpus (e.g. afd1aae4), where it read a valid file
                # as unparseable. Same lenience the PS/TS readers of these files already have.
                ids = node_ids_from_doc(json.loads(r.stdout.lstrip("\ufeff")))
            except json.JSONDecodeError:
                ids = None
            out[path] = ("bad", None) if ids is None else ("ok", ids)
        return out

    def touches_watched(self, sha, parents):
        for p in parents:
            if self.run("diff", "--name-only", p, sha, "--", *WATCHED).stdout.strip():
                return True
        return False


def evaluate_commit(git, sha):
    """-> finding dict, or None when the commit is clean / out of scope."""
    parents = git.parents(sha)
    if not parents:
        return None  # root commit: nothing existed to remove
    if not git.touches_watched(sha, parents):
        return None
    head_ids, child_ids, unverifiable = removal_sets(
        [git.file_map(p) for p in parents], git.file_map(sha))
    v = node_removal_verdict(head_ids, child_ids, parse_trailer(git.message(sha)))
    if v["ok"] and not unverifiable:
        return None
    return {"commit": sha, "merge": len(parents) > 1, "verdict": v,
            "unverifiable": unverifiable}


def check_range(git, before, after):
    """-> (findings, notes). Never raises for data problems; git errors propagate."""
    notes, findings = [], []
    if not git.exists(after):
        raise RuntimeError(f"after-SHA {after} is not in this clone")

    rewrite = False
    if before == ZERO or not before:
        notes.append("zero before-SHA (branch creation): evaluating the tip commit only")
        commits = [after]
    elif not git.exists(before):
        # Cannot see the old tip, so the rewrite arm is blind. Say so -- loudly.
        notes.append(f"before-SHA {before[:8]} not fetchable: evaluating the tip commit only")
        findings.append({"commit": before, "merge": False, "verdict": None,
                         "unverifiable": [("(range)", "old tip unavailable; a history rewrite "
                                           "could not be checked")]})
        commits = [after]
    elif git.is_ancestor(before, after):
        commits = git.run("rev-list", "--reverse", f"{before}..{after}").stdout.split()
    else:
        rewrite = True
        notes.append(f"history rewrite: {before[:8]} is not an ancestor of {after[:8]}")
        commits = git.run("rev-list", "--reverse", after, "--not", before).stdout.split()

    acked_in_range, reported = set(), set()
    for sha in commits:
        acked_in_range |= parse_trailer(git.message(sha))
        f = evaluate_commit(git, sha)
        if f:
            findings.append(f)
            if f["verdict"]:
                reported |= set(f["verdict"]["unacknowledged"])

    if rewrite:
        _, old_ids, old_bad = removal_sets([], git.file_map(before))
        _, new_ids, new_bad = removal_sets([], git.file_map(after))
        if old_bad or new_bad:
            findings.append({"commit": after, "merge": False, "verdict": None,
                             "unverifiable": [(p, f"{why} (rewrite tip comparison)")
                                              for p, why in old_bad + new_bad]})
        else:
            lost = rewrite_losses(old_ids, new_ids, acked_in_range, reported)
            if lost:
                findings.append({"commit": after, "merge": False, "rewrite_lost": lost,
                                 "verdict": None, "unverifiable": []})
    return findings, notes, len(commits)


def render(findings, notes, n_commits, before, after):
    lines = [f"## Taxonomy node-removal push check (t/3870, report-only)",
             f"Range `{(before or ZERO)[:8]}..{after[:8]}`: {n_commits} commit(s) evaluated."]
    lines += [f"- note: {n}" for n in notes]
    annotations = []
    if not findings:
        lines.append("\n**No unacknowledged removals.** (Green = every removal was *named*, "
                     "not that every removal was *reviewed*.)")
    for f in findings:
        short = f["commit"][:8]
        v = f.get("verdict")
        if v and v["unacknowledged"]:
            msg = (f"{short}: {len(v['unacknowledged'])} node ID(s) removed WITHOUT a "
                   f"Taxonomy-Node-Removal trailer: {', '.join(v['unacknowledged'])}")
            annotations.append(msg)
        if v and v["spurious"]:
            annotations.append(f"{short}: trailer names ID(s) NOT removed by this commit "
                               f"(stale/copied trailer): {', '.join(v['spurious'])}")
        if f.get("rewrite_lost"):
            annotations.append(f"{short}: history rewrite dropped node ID(s) acknowledged by no "
                               f"commit in the new range: {', '.join(f['rewrite_lost'])}")
        for path, why in f.get("unverifiable", []):
            annotations.append(f"{short}: COULD NOT VERIFY {path}: {why}")
    if annotations:
        lines.append("\n**Findings:**")
        lines += [f"- {a}" for a in annotations]
        lines.append("\nIf a removal was intended, it is already on origin -- this check cannot "
                     "and does not undo it. Record the acknowledgment on the tracking issue.")
    return "\n".join(lines), annotations


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("--before", required=True)
    ap.add_argument("--after", required=True)
    ap.add_argument("--repo", default=OWN_REPO)
    a = ap.parse_args(argv)
    try:
        findings, notes, n = check_range(Git(a.repo), a.before.strip(), a.after.strip())
    except RuntimeError as e:
        print(f"::error::node-removal push check could not run: {e}")
        return 2
    summary, annotations = render(findings, notes, n, a.before, a.after)
    for msg in annotations:
        print(f"::warning::{msg}")
    print(summary)
    step_summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if step_summary:
        with open(step_summary, "a", encoding="utf-8") as fh:
            fh.write(summary + "\n")
    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
