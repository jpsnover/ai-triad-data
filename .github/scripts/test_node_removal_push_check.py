"""Arms for node_removal_push_check.py (t/3870).

Each arm builds a throwaway git repo and drives check_range() end to end -- the
impure git-reading half is exercised, not only the pure functions, because
"tested code == running code" is the property this check exists to restore.

Every arm asserts it actually produced the commits it meant to (a silently
no-op'd arm reads as passing -- the t/3851 lesson).

Run: python3 .github/scripts/test_node_removal_push_check.py -v
"""

import contextlib
import io
import json
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest import mock

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import node_removal_push_check as m  # noqa: E402

ACC = "taxonomy/Origin/accelerationist.json"


class Repo:
    def __init__(self):
        self.path = tempfile.mkdtemp(prefix="t3870-")
        self.git("init", "-q", "-b", "main")
        self.git("config", "user.email", "t3870@example.invalid")
        self.git("config", "user.name", "t3870")
        self.git("config", "commit.gpgsign", "false")
        self.git("config", "core.hooksPath", os.devnull)  # no client hooks: this IS the --no-verify route

    def git(self, *args):
        r = subprocess.run(["git", "-C", self.path, *args], capture_output=True, text=True)
        if r.returncode != 0:
            raise RuntimeError(f"git {args}: {r.stderr}")
        return r.stdout.strip()

    def write(self, ids, path=ACC, raw=None):
        full = os.path.join(self.path, path)
        os.makedirs(os.path.dirname(full), exist_ok=True)
        with open(full, "w", encoding="utf-8") as fh:
            fh.write(raw if raw is not None else json.dumps({"nodes": [{"id": i} for i in ids]}))

    def commit(self, msg, ids=None, path=ACC, raw=None):
        if ids is not None or raw is not None:
            self.write(ids or [], path, raw)
        self.git("add", "-A")
        self.git("commit", "-q", "--allow-empty", "-m", msg)
        return self.head()

    def head(self):
        return self.git("rev-parse", "HEAD")

    def check(self, before, after):
        findings, notes, n = m.check_range(m.Git(self.path), before, after)
        return findings, notes, n

    def close(self):
        shutil.rmtree(self.path, ignore_errors=True)


class Arms(unittest.TestCase):
    def setUp(self):
        self.r = Repo()
        self.base = self.r.commit("seed", ["acc-1", "acc-2", "acc-3"])

    def tearDown(self):
        self.r.close()

    def unacked(self, findings):
        return sorted(i for f in findings if f["verdict"] for i in f["verdict"]["unacknowledged"])

    def test_1_no_removal_is_silent(self):
        after = self.r.commit("add a node", ["acc-1", "acc-2", "acc-3", "acc-4"])
        findings, _, n = self.r.check(self.base, after)
        self.assertEqual(n, 1)
        self.assertEqual(findings, [])

    def test_2_unacknowledged_removal_is_reported(self):
        after = self.r.commit("drop one, no trailer", ["acc-1", "acc-3"])
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual(self.unacked(findings), ["acc-2"])

    def test_3_acknowledged_removal_is_silent(self):
        after = self.r.commit("drop one\n\nTaxonomy-Node-Removal: acc-2", ["acc-1", "acc-3"])
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual(findings, [])

    def test_4_spurious_trailer_is_reported(self):
        after = self.r.commit("copied trailer\n\nTaxonomy-Node-Removal: acc-9", ["acc-1", "acc-2", "acc-3", "acc-4"])
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual(len(findings), 1)
        self.assertEqual(findings[0]["verdict"]["spurious"], ["acc-9"])

    def test_5_each_commit_judged_on_its_own_trailer(self):
        # Mid-range unacked removal, then a later commit whose trailer names it.
        # Tip-only evaluation would pass this; per-commit must not.
        c1 = self.r.commit("drop acc-2 silently", ["acc-1", "acc-3"])
        after = self.r.commit("unrelated\n\nTaxonomy-Node-Removal: acc-2", ["acc-1", "acc-3", "acc-5"])
        findings, _, n = self.r.check(self.base, after)
        self.assertEqual(n, 2)
        self.assertEqual([f["commit"] for f in findings if f["verdict"]["unacknowledged"]], [c1])
        self.assertTrue(any(f["verdict"]["spurious"] == ["acc-2"] for f in findings))

    def test_6_merge_does_not_rereport_side_branch_removal(self):
        self.r.git("checkout", "-q", "-b", "side")
        self.r.commit("side drops acc-2\n\nTaxonomy-Node-Removal: acc-2", ["acc-1", "acc-3"])
        self.r.git("checkout", "-q", "main")
        self.r.commit("main adds acc-4", ["acc-1", "acc-2", "acc-3", "acc-4"])
        self.r.git("merge", "-q", "--no-ff", "-X", "theirs", "side", "-m", "merge side")
        after = self.r.head()
        self.r.write(["acc-1", "acc-3", "acc-4"])  # the correct resolution
        self.r.git("add", "-A")
        self.r.git("commit", "-q", "--amend", "--no-edit")
        after = self.r.head()
        self.assertEqual(len(self.r.git("rev-list", "--parents", "-n", "1", after).split()), 3)
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual(findings, [])

    def test_7_evil_merge_removal_is_reported(self):
        self.r.git("checkout", "-q", "-b", "side")
        self.r.commit("side adds acc-5", ["acc-1", "acc-2", "acc-3", "acc-5"])
        self.r.git("checkout", "-q", "main")
        self.r.git("merge", "-q", "--no-ff", "side", "-m", "merge side")
        self.r.write(["acc-1", "acc-3", "acc-5"])  # merge itself drops acc-2, in both parents
        self.r.git("add", "-A")
        self.r.git("commit", "-q", "--amend", "--no-edit")
        after = self.r.head()
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual(self.unacked(findings), ["acc-2"])
        self.assertTrue(findings[0]["merge"])

    def test_8_history_rewrite_loss_is_reported(self):
        old_tip = self.r.commit("adds acc-7", ["acc-1", "acc-2", "acc-3", "acc-7"])
        self.r.git("reset", "-q", "--hard", self.base)  # force-push that drops old_tip
        new_tip = self.r.commit("unrelated change", raw="x", path="README.md")
        findings, notes, _ = self.r.check(old_tip, new_tip)
        self.assertTrue(any("history rewrite" in n for n in notes))
        self.assertEqual([f.get("rewrite_lost") for f in findings if f.get("rewrite_lost")], [["acc-7"]])

    def test_9_rewrite_with_acknowledgment_is_silent(self):
        old_tip = self.r.commit("adds acc-7", ["acc-1", "acc-2", "acc-3", "acc-7"])
        self.r.git("reset", "-q", "--hard", self.base)
        new_tip = self.r.commit("drop pilot node\n\nTaxonomy-Node-Removal: acc-7", raw="x", path="README.md")
        findings, _, _ = self.r.check(old_tip, new_tip)
        self.assertEqual([f for f in findings if f.get("rewrite_lost")], [])

    def test_10_unparseable_file_is_cannot_verify_not_clean(self):
        after = self.r.commit("corrupt", raw="{not json")
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual(len(findings), 1)
        self.assertEqual(findings[0]["unverifiable"][0][0], ACC)

    def test_11_repairing_a_corrupt_parent_is_not_a_finding(self):
        bad = self.r.commit("corrupt", raw="{not json")
        after = self.r.commit("repair", ["acc-1", "acc-2", "acc-3"])
        findings, _, _ = self.r.check(bad, after)
        self.assertEqual(findings, [])

    def test_12_whole_file_deletion_reports_every_node(self):
        os.remove(os.path.join(self.r.path, ACC))
        after = self.r.commit("delete file")
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual(self.unacked(findings), ["acc-1", "acc-2", "acc-3"])

    def test_13_zero_before_evaluates_tip(self):
        after = self.r.commit("drop", ["acc-1"])
        findings, notes, n = self.r.check(m.ZERO, after)
        self.assertEqual(n, 1)
        self.assertTrue(any("zero before-SHA" in x for x in notes))
        self.assertEqual(self.unacked(findings), ["acc-2", "acc-3"])

    def test_14_unfetchable_before_is_a_finding_not_silence(self):
        after = self.r.commit("noop", raw="y", path="README.md")
        findings, _, _ = self.r.check("1" * 40, after)
        self.assertTrue(any(f["unverifiable"] and "old tip unavailable" in f["unverifiable"][0][1]
                            for f in findings))

    def test_16_utf8_bom_file_is_read_not_cannot_verify(self):
        # Real-corpus regression: PowerShell-written files carry a UTF-8 BOM (afd1aae4).
        bom = chr(0xFEFF)
        after = self.r.commit("bom rewrite, drops acc-3",
                              raw=bom + json.dumps({"nodes": [{"id": "acc-1"}, {"id": "acc-2"}]}))
        findings, _, _ = self.r.check(self.base, after)
        self.assertEqual([f for f in findings if f["unverifiable"]], [])
        self.assertEqual(self.unacked(findings), ["acc-3"])

    def run_main_quietly(self, argv):
        # main() prints ::warning:: workflow commands and appends to GITHUB_STEP_SUMMARY. Inside
        # the workflow's self-test step those would become REAL annotations / summary lines about
        # these synthetic IDs on every run -- a fake finding on a clean push (observed live, run
        # 37169263935). Capture stdout and unset the summary path for the call.
        out = io.StringIO()
        env = {k: v for k, v in os.environ.items() if k != "GITHUB_STEP_SUMMARY"}
        with mock.patch.dict(os.environ, env, clear=True), contextlib.redirect_stdout(out):
            rc = m.main(argv)
        return rc, out.getvalue()

    def test_15_exit_codes(self):
        clean = self.r.commit("add", ["acc-1", "acc-2", "acc-3", "acc-4"])
        rc, _ = self.run_main_quietly(["--before", self.base, "--after", clean, "--repo", self.r.path])
        self.assertEqual(rc, 0)
        dirty = self.r.commit("drop", ["acc-1"])
        rc, out = self.run_main_quietly(["--before", clean, "--after", dirty, "--repo", self.r.path])
        self.assertEqual(rc, 1)
        self.assertIn("::warning::", out)  # proves the capture caught it (not merely that nothing printed)


if __name__ == "__main__":
    unittest.main()
