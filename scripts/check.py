#!/usr/bin/env python3
"""urutau checks.

Without arguments, checks this repository: budgets (PLAN.md §4.1, §5), rule
traceability in references/sources.md (S2) and guide coverage (S3).
With --project PATH, lints a project's sdd/ folder: required files, status
length, evidence tags on claims (E3), EXP card fields, and whether each EXP
card was committed before its result (E2).
"""
import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

LINE_BUDGETS = {
    "global/AGENTS.md": 100,
    "modules/ml.md": 60,
    "modules/rl.md": 30,
    "templates/project/AGENTS.md": 30,
    "templates/project/CLAUDE.md": 1,
    "templates/project/sdd/spec.md": 40,
    "templates/project/sdd/status.md": 40,
    "templates/project/sdd/knowledge.md": 30,
    "templates/project/sdd/log.md": 40,
}
MAX_RULES = 15
MAX_STATUS_IN_USE = 60
RULE_RE = re.compile(r"^- \*\*(R\d+) ", re.M)
TAG_RE = re.compile(
    r"\[(established|supported: (EXP|EXPL)-\d+(, (EXP|EXPL)-\d+)*|literature: [^\]]+|assumption|speculation)\]"
)
EXP_FIELDS = ["Hypotheses:", "Refuted if:", "Smallest meaningful effect", "Plan:",
              "Pre-registered at:", "Result:", "Verdict:"]


class Report:
    def __init__(self):
        self.failures = []

    def ok(self, msg):
        print(f"  ok    {msg}")

    def fail(self, msg):
        print(f"  FAIL  {msg}")
        self.failures.append(msg)

    def info(self, msg):
        print(f"  info  {msg}")

    def check(self, cond, msg):
        (self.ok if cond else self.fail)(msg)


def strip_comments(text):
    return re.sub(r"<!--.*?-->", "", text, flags=re.S)


def lines(path):
    return path.read_text(encoding="utf-8").splitlines()


def rule_ids(text):
    return RULE_RE.findall(text)


# ---------------------------------------------------------------- repository

def check_repo(r):
    print("Budgets")
    for rel, limit in LINE_BUDGETS.items():
        p = ROOT / rel
        if not p.exists():
            r.fail(f"{rel} missing")
            continue
        n = len(lines(p))
        r.check(n <= limit, f"{rel}: {n} lines (≤ {limit})")
    claude = ROOT / "templates/project/CLAUDE.md"
    if claude.exists():
        r.check(claude.read_text().strip() == "@AGENTS.md", "templates/project/CLAUDE.md is exactly '@AGENTS.md'")

    print("Rules (S1)")
    global_text = (ROOT / "global/AGENTS.md").read_text(encoding="utf-8")
    ids = rule_ids(global_text)
    r.check(0 < len(ids) <= MAX_RULES, f"global/AGENTS.md has {len(ids)} rules (≤ {MAX_RULES})")
    expected = [f"R{i}" for i in range(1, len(ids) + 1)]
    r.check(ids == expected, f"rule IDs are R1…R{len(ids)} in order")

    print("Traceability (S2)")
    sources = (ROOT / "references/sources.md").read_text(encoding="utf-8")
    rows = {m.group(1): m.group(0) for m in re.finditer(r"^\| (R\d+) \|.*$", sources, re.M)}
    for rid in ids:
        row = rows.get(rid)
        if row is None:
            r.fail(f"{rid} not in references/sources.md")
            continue
        traced = (re.search(r"\bM\d+\b", row) and re.search(r"\bS\d\d\b", row)) or "owner-preference" in row
        r.check(bool(traced), f"{rid} maps to a mechanism and source, or is owner-preference")

    print("Examples")
    for p in sorted((ROOT / "templates/project").rglob("*.md")):
        rel = p.relative_to(ROOT / "templates/project")
        r.check((ROOT / "templates/examples" / rel).exists(), f"example for templates/project/{rel}")

    print("Guide coverage (S3)")
    guide_path = ROOT / "guide/index.html"
    if not guide_path.exists():
        r.fail("guide/index.html missing")
        return
    guide = guide_path.read_text(encoding="utf-8")
    cards = set(re.findall(r'data-id="([^"]+)"', guide))
    wanted = set(ids)
    wanted |= {f"tpl:{p.relative_to(ROOT / 'templates/project')}" for p in (ROOT / "templates/project").rglob("*.md")}
    wanted |= {f"mod:{p.stem}" for p in (ROOT / "modules").glob("*.md")}
    missing = sorted(wanted - cards)
    covered = len(wanted) - len(missing)
    r.check(not missing, f"guide covers {covered}/{len(wanted)} rules, templates and modules"
            + (f" — missing: {', '.join(missing)}" if missing else ""))
    extra = sorted(c for c in cards if re.fullmatch(r"R\d+", c) and c not in ids)
    r.check(not extra, "guide has no rule IDs absent from global/AGENTS.md"
            + (f" — extra: {', '.join(extra)}" if extra else ""))


# ------------------------------------------------------------------- project

def git(project, *args):
    res = subprocess.run(["git", "-C", str(project), *args], capture_output=True, text=True)
    return res.stdout if res.returncode == 0 else None


def parse_exp_cards(text):
    """Return {EXP-nnn: card text} from a log, ignoring HTML comments."""
    text = strip_comments(text)
    cards = {}
    parts = re.split(r"^(## .*)$", text, flags=re.M)
    for i in range(1, len(parts), 2):
        m = re.match(r"## (EXP-\d+)\b", parts[i])
        if m:
            cards[m.group(1)] = parts[i] + "\n" + parts[i + 1]
    return cards


def field_value(card, name):
    m = re.search(rf"^{re.escape(name)}[ \t]*(.*)$", card, re.M)
    return m.group(1).strip() if m else ""


def prereg_timing(project, log_rel):
    """For each EXP card: (commit index where the card first appears,
    commit index where its Result first has content). None if not a git repo."""
    out = git(project, "log", "--reverse", "--format=%H", "--", log_rel)
    if out is None:
        return None
    first_card, first_result = {}, {}
    for idx, sha in enumerate(out.split()):
        content = git(project, "show", f"{sha}:./{log_rel}")
        if content is None:
            continue
        for eid, card in parse_exp_cards(content).items():
            first_card.setdefault(eid, idx)
            if field_value(card, "Result:"):
                first_result.setdefault(eid, idx)
    return first_card, first_result


def check_project(r, project):
    sdd = project / "sdd"
    print(f"Project {project}")
    for name in ["spec.md", "status.md", "knowledge.md", "log.md"]:
        r.check((sdd / name).exists(), f"sdd/{name} exists")
    if not sdd.exists():
        return

    status = sdd / "status.md"
    if status.exists():
        n = len(lines(status))
        r.check(n <= MAX_STATUS_IN_USE, f"sdd/status.md: {n} lines (≤ {MAX_STATUS_IN_USE})")

    knowledge = sdd / "knowledge.md"
    if knowledge.exists():
        text = strip_comments(knowledge.read_text(encoding="utf-8"))
        sections = re.findall(r"^## Claims[ \t]*$(.*?)(?=^## |\Z)", text, re.M | re.S)
        claims = [ln for sec in sections for ln in sec.splitlines() if ln.strip().startswith("- ")]
        untagged = [ln.strip() for ln in claims if not TAG_RE.search(ln)]
        pct = 100 * (len(claims) - len(untagged)) / len(claims) if claims else 100
        r.check(not untagged, f"E3 evidence tags: {pct:.0f}% of {len(claims)} claims tagged")
        for ln in untagged:
            r.info(f"untagged: {ln[:90]}")

    log = sdd / "log.md"
    if log.exists():
        cards = parse_exp_cards(log.read_text(encoding="utf-8"))
        for eid, card in cards.items():
            missing = [f for f in EXP_FIELDS if f not in card]
            r.check(not missing, f"{eid} has all card fields" + (f" — missing: {', '.join(missing)}" if missing else ""))
        timing = prereg_timing(project, "sdd/log.md")
        if timing is None:
            r.info("not a git repository: pre-registration timing (E2) not checked")
        else:
            first_card, first_result = timing
            done = [e for e in cards if e in first_result]
            prereg = [e for e in done if first_card.get(e, 10**9) < first_result[e]]
            pending = [e for e in cards if e not in first_result]
            if done:
                pct = 100 * len(prereg) / len(done)
                r.check(pct >= 90, f"E2 pre-registration: {len(prereg)}/{len(done)} EXP cards committed before their result ({pct:.0f}%, target ≥ 90%)")
                for e in sorted(set(done) - set(prereg)):
                    r.info(f"{e}: result in the same commit as the card (not pre-registered)")
            else:
                r.info("E2 pre-registration: no EXP card has a result yet")
            if pending:
                r.info(f"pending EXP cards: {', '.join(sorted(pending))}")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--project", type=Path, help="lint a project's sdd/ folder instead of this repository")
    args = ap.parse_args()
    r = Report()
    if args.project:
        check_project(r, args.project.resolve())
    else:
        check_repo(r)
    print(f"\n{'FAILED' if r.failures else 'PASSED'}: {len(r.failures)} failure(s)")
    return 1 if r.failures else 0


if __name__ == "__main__":
    sys.exit(main())
