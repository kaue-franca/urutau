# Spec — urutau (Scientific SDD)
<!-- Entries and IDs before DEC-013 (v0/v0.1) use the old vocabulary: AC = success criterion, EXP = test, EXPL = try, R1–R15/G1–G6 = rules now U1–U9. -->
Question: Can a short, hand-written method grounded in the scientific method make agent-assisted data-science work traceable and resistant to self-deception, at an upkeep cost the owner accepts, in every tool the owner uses?
Goal type: build
Scope and non-goals: global and project `AGENTS.md` text, modules, project skeletons and example, three skills, one stdlib script `urutau.py`, README/GUIA/CIENCIA · not a product CLI; not spec-as-source; no copy of Spec Kit or Kiro; no Windows/macOS; no proxy/mirror auto-config.
Constraints: agent files in English, human docs in pt-BR, identical rule IDs; sources paraphrased and linked; Linux with Python ≥ 3.11 on both machines (Ubuntu personal, Red Hat at work); tools: Claude Code and Devin CLI (DeepSeek).

## Success criteria
- SC-01: global file ≤ 20 lines; ≤ 9 rules; the project block (method + all modules) + a filled project section < 14 KiB (Devin cloud reads 16 KiB). Fails if any limit is exceeded.
- SC-02: every rule maps to a mechanism and sources in `CIENCIA.md`, or is marked owner-preference. Fails if any rule has neither.
- SC-03: given only README + GUIA, a fresh agent correctly states the project files, the session routine and the 3 setup cases. Fails on any wrong or missing item.
- SC-04: after install on each machine, a session quotes U1 outside a project and U8 inside one, in Claude Code and in Devin CLI. Fails if any tool/machine pair does not load it.
- SC-05: the Phase 7 pilot meets its pre-registered criteria E1–E4 (restated in the v0.2 vocabulary). Fails if any misses its threshold.

## Current task
### T-10 Method v0.2 content: rules U1–U9, simple vocabulary, sdd/ skeletons, example, CIENCIA.md (→ SC-01, SC-02) · branch: t-10-metodo-v02
Why: the method text is what every tool will load (global and project); it must be short enough for Devin and traced to sources.
Prediction: global ≤ 20 lines; method + ml < 14 KiB; every AI failure mode in the critics' table maps to a rule; every rule maps to sources in CIENCIA.md. Rival: cutting R1–R15 to U1–U9 loses real rigor (pre-registration, holdout log).
Check: a fresh-context reviewer given only the files looks for a failure mode without a rule or a rule without a source — fails if one is found
Steps:
1. [x] `global/AGENTS.md` with U1–U6 + conventions — check: 15 lines, 2.2 KB
2. [x] `project/method.md` (U1–U9, files, session, tags, conventions) + modules on U-rules — check: method+ml 8.1 KB, +rl 9.7 KB (< 14 KiB)
3. [x] `project/sdd/*` skeletons (task card, test card), `project/AGENTS.md`, `examples/churn-90d/`, this repo's own `sdd/` in the new vocabulary — check: example uses every section; pre-registered test still detectable by the field names
4. [x] `CIENCIA.md`: rule → mechanism → sources; S50–S53 verified by web search, S54 = Devin docs read by critic B — check: U1–U9 and conventions each have a row with sources or owner-preference
5. [ ] Independent review (fresh agent) — check: no gap found, or gaps fixed
Result:
Closing: · Learned:
Note: the old scripts point to removed paths until T-11 replaces them.

## Next tasks
- T-11 `urutau.py` (install, init, update, check, map) + loading tests in Claude Code (→ SC-04)
- T-12 Skills: urutau-setup (3 cases), urutau-audit, urutau-grill (→ SC-04)
- T-13 README, GUIA.md, history/ — newcomer path (→ SC-03)
- T-14 Field tests: mestrado (case a), a repo with code (case c), work PC with Devin CLI (→ SC-04)
- T-07 Phase 7 — pre-registered pilot, EXP-001 (→ SC-05); the mestrado repo is a candidate pilot project
- T-08 Phase 8 — second consolidation, tag `v1.0` (→ all)

## Done
- T-09 v0.1 (two layers, 3-file sdd/, R15, setup skill) — commits 842bac1, 3ad83b6; owner test on mestrado superseded by v0.2 (DEC-013)
- T-00…T-06 Phases 0–6 — v0 delivered 2026-10-26 (DEC-005); `check.py` passed; Claude Code loaded the method from a fresh HOME.

## Open questions
- `PLAN.md` §7 defaults adopted (DEC-001); owner may override at any checkpoint.
- Owner review of v0/v0.1 rules, templates and guide cards; Codex install untested (AC-04 half open).
- Install the global layer on this machine (`scripts/install.sh`)? Not done yet: it edits `~/.claude/CLAUDE.md`.
