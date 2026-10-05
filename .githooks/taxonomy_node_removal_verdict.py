"""Pure verdict for the taxonomy node-ID removal guard (t/3851).

NO I/O. NO git. NO file reads. The caller gathers the three sets; this
decides. Same pure/impure split as complexity-budget-predicate.js and the
*Verdict.ps1 family -- it exists so the decision can be tested directly
instead of through a hook invocation.

The acknowledgment contract (t/3851#2, Q1):
  A commit removing taxonomy node IDs must name EXACTLY those IDs in a
  `Taxonomy-Node-Removal:` trailer. The guard compares sets, not presence.
  That is what makes the acknowledgment non-reflexive -- a template or a
  shell alias cannot pre-supply the right IDs, and a trailer copied from an
  earlier commit fails because the sets will not match.

  Mismatch FAILS IN BOTH DIRECTIONS:
    - removed but not named  -> an unacknowledged deletion (the incident)
    - named but not removed  -> a stale/copied trailer, so the next real
                                removal would ride in on it unnoticed

Trailer parsing also lives here (t/3870#5), so the client hook (commit-msg)
and the push-side re-check (.github/scripts/node_removal_push_check.py) read
the acknowledgment identically. A second copy of the parser is how the two
layers would come to disagree about the same commit -- the same two-copies
drift as the debate pacing presets (t/3882).
"""

import re

TRAILER_RE = re.compile(r"^\s*Taxonomy-Node-Removal\s*:\s*(.+)$", re.IGNORECASE)


def acknowledged_ids(message_lines):
    """IDs named in Taxonomy-Node-Removal trailers. Pure: takes lines, not a file.

    Comma-separated and repeatable. Lines starting with '#' are skipped: git
    strips comment lines only AFTER the commit-msg hook runs, so a commented-out
    trailer in the editor template must not count as an acknowledgment.
    """
    acked = set()
    for line in message_lines:
        if line.lstrip().startswith("#"):
            continue
        m = TRAILER_RE.match(line)
        if m:
            acked |= {t.strip() for t in m.group(1).split(",") if t.strip()}
    return acked


def node_removal_verdict(head_ids, staged_ids, acked_ids):
    """Decide whether a staged taxonomy change is acceptable.

    Args:
        head_ids:   set of node IDs present at HEAD
        staged_ids: set of node IDs present in the staged index
        acked_ids:  set of node IDs named in the Taxonomy-Node-Removal trailer

    Returns a dict:
        ok                -> bool, True when the commit may proceed
        removed           -> sorted list of IDs that left the corpus
        unacknowledged    -> sorted list of removed IDs not named in the trailer
        spurious          -> sorted list of named IDs that were not removed
        reason            -> short machine-readable verdict code
    """
    head = set(head_ids)
    staged = set(staged_ids)
    acked = set(acked_ids)

    removed = head - staged
    unacknowledged = removed - acked
    spurious = acked - removed

    if not removed and not acked:
        reason = "no-removals"
    elif not removed and acked:
        # Trailer names IDs that are still present. Almost always a copied
        # trailer; refusing keeps the acknowledgment meaningful.
        reason = "spurious-acknowledgment"
    elif unacknowledged:
        reason = "unacknowledged-removal"
    elif spurious:
        reason = "spurious-acknowledgment"
    else:
        reason = "acknowledged-removal"

    return {
        "ok": not unacknowledged and not spurious,
        "removed": sorted(removed),
        "unacknowledged": sorted(unacknowledged),
        "spurious": sorted(spurious),
        "reason": reason,
    }
