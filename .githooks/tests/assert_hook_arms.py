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
  python3 assert_hook_arms.py livefire     -     <log>
Exit 0 = every arm matched; 1 = any mismatch (each printed as ::error::); 2 = usage/parse error.
"""

import re
import sys

C, R = "CREATED", "REFUSED"
NRG = "[node-removal-guard]"
SBD = "[situation-bdi]"

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
}
SITUATIONS_WARN_LINE = SBD + " WARN-ONLY"
SITUATIONS_WARN_ARMS = {"3", "4", "7", "9", "10"}

# Live-fire runs the DEPLOYED hook (warn mode) from a real linked worktree -- the
# only harness that caught the two #17 defects. Any COULD NOT VERIFY in A-C means
# the check did not run: a defect, not a pass.
LIVEFIRE = {
    "A": (C, [SBD + " WARNING", "sit-livefire-001"], ["COULD NOT VERIFY"]),
    "B": (C, ["(no [situation-bdi] output)"], ["COULD NOT VERIFY"]),
    "C": (C, [SBD + " WARNING"], ["COULD NOT VERIFY"]),
    "D": (C, ["COULD NOT VERIFY", "nonexistent"], []),
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


def check(table, mode, text, warn_line, warn_arms=frozenset()):
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
    extra = sorted(set(arms) - set(table))
    if extra:
        errors.append(f"unexpected arm(s) in log, not in the expectation table: {extra} -- update tests/README.md and this table together")
    return len(table), errors


def main(argv):
    if len(argv) != 4 or argv[1] not in ("commit-msg", "situations", "livefire"):
        print(__doc__)
        return 2
    kind, mode, path = argv[1], argv[2], argv[3]
    text = open(path, encoding="utf-8", errors="replace").read()
    if kind == "commit-msg":
        n, errors = check(COMMIT_MSG, mode, text, COMMIT_MSG_WARN_LINE, COMMIT_MSG_WARN_ARMS)
    elif kind == "situations":
        n, errors = check(SITUATIONS, mode, text, SITUATIONS_WARN_LINE, SITUATIONS_WARN_ARMS)
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
