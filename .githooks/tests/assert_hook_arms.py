"""Assert the hook arm scripts' printed results against tests/README.md (t/3913).

The arm scripts PRINT; they do not ASSERT. This turns each run's log into a
pass/fail by checking, per arm, BOTH:
  - the commit outcome (COMMIT CREATED / COMMIT REFUSED), and
  - the hook's tagged output (present / absent substrings).
In warn mode every commit is created, so the outcome alone proves nothing
(Sage #202) -- the tag assertions are what distinguish a firing arm from a
silent one. The expectation tables below are tests/README.md, transcribed;
change them together.

Usage:
  python3 assert_hook_arms.py commit-msg   <0|1> <log>
  python3 assert_hook_arms.py situations   <0|1> <log>
  python3 assert_hook_arms.py pov-tags     <0|1> <log>
  python3 assert_hook_arms.py livefire     -     <log>
Exit 0 = every arm matched; 1 = any mismatch (each printed as ::error::); 2 = usage/parse error.
"""

import re
import sys

C, R = "CREATED", "REFUSED"
NRG = "[node-removal-guard]"
SBD = "[situation-bdi]"
PVT = "[pov-tags]"

# arm -> (outcome in blocking mode 0, must-contain list, must-NOT-contain list)
# Warn mode (1): every outcome is CREATED, and every arm that is REFUSED in
# blocking mode must additionally print the WARN-ONLY line.
COMMIT_MSG = {
    "1":  (C, [], [NRG]),
    "2":  (R, [NRG, "acc-002", "WHOLE-INDEX"], []),
    "3":  (C, [NRG + " OK:"], []),
    "4":  (R, ["acc-999", "acc-002"], []),
    "5":  (C, [], [NRG]),
    "6":  (R, ["COULD NOT VERIFY"], []),
    "7":  (C, ["JSON repair detected"], []),
    "8":  (C, ["files in commit: README.md"], [NRG]),
    "9":  (R, [NRG, "Taxonomy-Node-Removal:"], ["WHOLE-INDEX"]),
    "10": (C, [NRG + " OK:"], []),
    "11": (None, ["OK: hook never ran"], []),   # reachability arm: git aborts before the hook
    "12": (R, [NRG, "skeptic-001"], []),
    "13": (C, [], ["COULD NOT VERIFY", NRG]),
    "14": (R, [NRG, "acc-002"], []),
    "15": (R, [NRG, "acc-002"], []),
}
COMMIT_MSG_WARN_LINE = NRG + " WARN-ONLY"
# Arms that must print the WARN-ONLY line in warn mode (the firing arms). Arm 6
# (COULD NOT VERIFY) prints its own tag and no WARN-ONLY line -- README requires
# only the tag there.
COMMIT_MSG_WARN_ARMS = {"2", "4", "9", "12", "14", "15"}
# Execution record (t/3851): the `result` each arm must append. Arm 11 is None ON
# PURPOSE -- git aborts before the hook runs, so NO record is the correct outcome there
# (asserted, not skipped); every other arm must write exactly one.
COMMIT_MSG_TELEMETRY = {
    "1": "skip", "2": "violation", "3": "pass", "4": "violation", "5": "pass",
    "6": "unverified", "7": "pass", "8": "skip", "9": "violation", "10": "pass",
    "11": None, "12": "violation", "13": "pass", "14": "violation", "15": "violation",
}
RECORD_LINE_RE = re.compile(r"telemetry: [a-z]+/[a-z]+")

SITUATIONS = {
    "1":  (C, [], [SBD]),
    "2":  (C, [], [SBD]),
    "3":  (R, [SBD + " WARNING"], []),
    "4":  (R, [SBD + " WARNING"], []),
    "5":  (C, [], [SBD]),
    "6":  (C, [], [SBD]),
    "7":  (R, [SBD + " WARNING"], []),
    "8":  (C, [], [SBD]),
    "9":  (R, [SBD + " COULD NOT VERIFY"], []),
    "10": (R, [SBD + " COULD NOT VERIFY"], []),
    # t/4022: a pwsh PARSE error (terminating before the runner's own try/catch is ever
    # reached) exits 1, the SAME code the runner uses for "violations found" -- must read
    # COULD NOT VERIFY, never a false "not BDI-decomposed" WARNING naming zero violations.
    "11": (R, [SBD + " COULD NOT VERIFY"], [SBD + " WARNING"]),
}
SITUATIONS_WARN_LINE = SBD + " WARN-ONLY"
SITUATIONS_WARN_ARMS = {"3", "4", "7", "9", "10", "11"}
# Execution record per arm (t/3892#6): the `result` the hook must append. `action` is
# derived: "refused" where blocking mode refuses the commit, else "allowed". Every arm
# must write exactly one record -- a silent pass and a dead hook look identical on screen,
# and this is what tells them apart.
SITUATIONS_TELEMETRY = {
    "1": "skip", "2": "pass", "3": "violation", "4": "violation", "5": "pass",
    "6": "pass", "7": "violation", "8": "skip", "9": "unverified", "10": "unverified",
    "11": "unverified",
}

POV_TAGS = {
    "1": (C, [], [PVT]),
    "2": (C, [], [PVT]),
    "3": (R, [PVT + " WARNING", "not-a-real-tag"], []),
    "4": (R, [PVT + " WARNING", "appears more than once"], []),
    "5": (R, [PVT + " WARNING", "not registered"], []),
    "6": (R, [PVT + " WARNING", "must be an array"], []),
    "7": (R, [PVT + " WARNING", "only allowed on POV nodes"], []),
    "8": (C, [], [PVT]),
    "9": (R, [PVT + " COULD NOT VERIFY"], []),
    # t/4022: exit-code collision -- a checker that fails to LOAD (module not found, syntax
    # error) must read COULD NOT VERIFY, never WARNING/violation. Distinct from arm 9 (tsx
    # unreachable, caught before the CLI ever runs): here extraction succeeds and tsx DOES
    # run, but throws, so this is the arm that actually exercises the rc=1 verdict-JSON-vs-
    # crash-trace parsing fix, not a pre-existing extraction guard.
    "10": (R, [PVT + " COULD NOT VERIFY"], [PVT + " WARNING"]),
}
POV_TAGS_WARN_LINE = PVT + " WARN-ONLY"
POV_TAGS_WARN_ARMS = {"3", "4", "5", "6", "7", "9", "10"}
# Execution record (t/3970, mirrors SITUATIONS_TELEMETRY): the `result` the hook must
# append. Arms 1/2/8 are legitimately quiet passes/skips -- the record is what tells them
# apart from a hook that never ran.
POV_TAGS_TELEMETRY = {
    "1": "skip", "2": "pass", "3": "violation", "4": "violation", "5": "violation",
    "6": "violation", "7": "violation", "8": "skip", "9": "unverified", "10": "unverified",
}

CSH = "[conflicts-shape]"
CONFLICTS_SHAPE = {
    "1": (R, [CSH + " WARNING", "nested.json"], []),
    "2": (R, [CSH + " WARNING", "nonstring.json"], []),
    "3": (C, [], [CSH]),
    "4": (C, [], [CSH]),
    "5": (C, [], [CSH]),
    "6": (R, [CSH + " WARNING", "incident1.json", "incident2.json", "incident3.json"], []),
    "7": (R, [CSH + " COULD NOT VERIFY"], []),
}
CONFLICTS_SHAPE_WARN_LINE = CSH + " WARN-ONLY"
CONFLICTS_SHAPE_WARN_ARMS = {"1", "2", "6", "7"}
# Execution record (t/3953, mirrors POV_TAGS_TELEMETRY). Arms 3/4/5 are legitimately quiet
# passes/skips -- the record is what tells them apart from a hook that never ran.
CONFLICTS_SHAPE_TELEMETRY = {
    "1": "violation", "2": "violation", "3": "pass", "4": "skip", "5": "pass",
    "6": "violation", "7": "unverified",
}

# Live-fire runs the DEPLOYED hook from a real linked worktree -- the only harness
# that caught the two #17 defects. Any COULD NOT VERIFY in A-C means the check did not
# run: a defect, not a pass. The deployed mode is read from the log's
# "deployed WARN_ONLY=N" line, so these expectations follow the flip (t/3892).
# Blocking-mode table: outcomes, outputs and records for WARN_ONLY=0.
WHOLE_INDEX = "WHOLE-INDEX commit"
LIVEFIRE_BLOCKING = {
    "A": (R, [SBD + " WARNING", "sit-livefire-001", WHOLE_INDEX, "worktree=true"], ["COULD NOT VERIFY"]),
    "B": (C, ["(no [situation-bdi] output)", "worktree=true"], ["COULD NOT VERIFY"]),
    # Pathspec commit: a temp index, so the whole-index advice must NOT appear.
    "C": (R, [SBD + " WARNING", "worktree=true"], ["COULD NOT VERIFY", WHOLE_INDEX]),
    "D": (R, ["COULD NOT VERIFY", "nonexistent", "worktree=true"], []),
}
LIVEFIRE_TELEMETRY = {"A": "violation", "B": "pass", "C": "violation", "D": "unverified"}
DEPLOYED_RE = re.compile(r"^deployed WARN_ONLY=([01])$", re.M)
# Warn-mode table (the pre-flip contract), kept so a warn-mode tree still asserts.
LIVEFIRE = {
    "A": (C, [SBD + " WARNING", "sit-livefire-001", "telemetry: violation/allowed worktree=true"], ["COULD NOT VERIFY"]),
    "B": (C, ["(no [situation-bdi] output)", "telemetry: pass/allowed worktree=true"], ["COULD NOT VERIFY"]),
    "C": (C, [SBD + " WARNING", "telemetry: violation/allowed worktree=true"], ["COULD NOT VERIFY"]),
    "D": (C, ["COULD NOT VERIFY", "nonexistent", "telemetry: unverified/allowed worktree=true"], []),
}

ARM_RE = re.compile(r"^#{3,}\s+(?:ARM\s+)?([0-9]+|[A-D])\b")
# Anchored to the HARNESS outcome markers, never the hook's own prose (the hook
# prints "BLOCKING: commit refused." itself, which an unanchored match would take):
#   temp-repo arms:  "=> rc=1  COMMIT REFUSED"     live-fire header: "(rc=0, 4088 ms, commit CREATED)"
OUTCOME_RE = re.compile(r"(?:=> rc=\d+\s+COMMIT|ms, commit) (CREATED|REFUSED)\b")


def split_arms(text):
    """-> {arm: (header_line, body_text)}. Tag checks use the BODY only: arm
    headers describe expectations (e.g. 'pre-fix: COULD NOT VERIFY') and must
    never satisfy or violate an output assertion."""
    arms, cur = {}, None
    for line in text.splitlines():
        m = ARM_RE.match(line)
        if m:
            cur = m.group(1)
            arms[cur] = [line, []]
            continue
        if cur is not None:
            arms[cur][1].append(line)
    return {k: (h, "\n".join(b)) for k, (h, b) in arms.items()}


def check(table, mode, text, warn_line, warn_arms=frozenset(), telemetry=None):
    arms = split_arms(text)
    errors = []
    for arm, (block_outcome, must, mustnot) in table.items():
        if arm not in arms:
            errors.append(f"arm {arm}: MISSING from the log (did the script stop early?)")
            continue
        header, body = arms[arm]
        want = block_outcome if mode == "0" else (None if block_outcome is None else C)
        if want is not None:
            # The live-fire script prints the outcome on its header line.
            m = OUTCOME_RE.search(body) or OUTCOME_RE.search(header)
            got = m.group(1) if m else None
            if got != want:
                errors.append(f"arm {arm}: expected COMMIT {want}, got {got or 'no outcome line'}")
        for s in must:
            if s not in body:
                errors.append(f"arm {arm}: expected output to contain {s!r}")
        for s in mustnot:
            if s in body:
                errors.append(f"arm {arm}: output must NOT contain {s!r}")
        if mode == "1" and arm in warn_arms and warn_line not in body:
            errors.append(f"arm {arm}: warn mode must print {warn_line!r} (a silent commit proves nothing)")
        if telemetry is not None and telemetry[arm] is None:
            # Declared record-less (the hook cannot run on this arm): assert NO record.
            if RECORD_LINE_RE.search(body):
                errors.append(f"arm {arm}: expected NO execution record (the hook should never run here)")
        elif telemetry is not None:
            action = "refused" if (mode == "0" and block_outcome == R) else "allowed"
            want_rec = f"telemetry: {telemetry[arm]}/{action}"
            if want_rec not in body:
                errors.append(f"arm {arm}: expected execution record {want_rec!r} (none or wrong -- a run that leaves no record cannot be told from a dead hook)")
            if "MULTIPLE RECORDS" in body:
                errors.append(f"arm {arm}: the hook appended more than one record for a single commit")
    extra = sorted(set(arms) - set(table))
    if extra:
        errors.append(f"unexpected arm(s) in log, not in the expectation table: {extra} -- update tests/README.md and this table together")
    return len(table), errors


def main(argv):
    if len(argv) != 4 or argv[1] not in ("commit-msg", "situations", "pov-tags", "conflicts-shape", "livefire"):
        print(__doc__)
        return 2
    kind, mode, path = argv[1], argv[2], argv[3]
    text = open(path, encoding="utf-8", errors="replace").read()
    if kind == "commit-msg":
        n, errors = check(COMMIT_MSG, mode, text, COMMIT_MSG_WARN_LINE, COMMIT_MSG_WARN_ARMS, COMMIT_MSG_TELEMETRY)
    elif kind == "situations":
        n, errors = check(SITUATIONS, mode, text, SITUATIONS_WARN_LINE, SITUATIONS_WARN_ARMS, SITUATIONS_TELEMETRY)
    elif kind == "pov-tags":
        n, errors = check(POV_TAGS, mode, text, POV_TAGS_WARN_LINE, POV_TAGS_WARN_ARMS, POV_TAGS_TELEMETRY)
    elif kind == "conflicts-shape":
        n, errors = check(CONFLICTS_SHAPE, mode, text, CONFLICTS_SHAPE_WARN_LINE, CONFLICTS_SHAPE_WARN_ARMS, CONFLICTS_SHAPE_TELEMETRY)
    else:
        m = DEPLOYED_RE.search(text)
        if not m:
            # Fail closed: without the mode line we cannot know which contract applies.
            print(f"::error::hook arms livefire ({path}): no 'deployed WARN_ONLY=' line in the log")
            return 1
        mode = m.group(1)
        if mode == "0":
            n, errors = check(LIVEFIRE_BLOCKING, "0", text, None, telemetry=LIVEFIRE_TELEMETRY)
        else:
            n, errors = check(LIVEFIRE, "1", text, None)
    label = f"{kind} mode={mode} ({path})"
    if errors:
        for e in errors:
            print(f"::error::hook arms {label}: {e}")
        print(f"FAIL {label}: {len(errors)} mismatch(es) across {n} arms")
        return 1
    print(f"PASS {label}: {n}/{n} arms match tests/README.md")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
