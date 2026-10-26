# Knowledge
Tags: `[established]` · `[supported: EXP-n]` · `[literature: S-id]` · `[assumption]` · `[speculation]`

## Claims
- K-001 [assumption] A short, hand-written global instruction file loaded in every session changes agent behavior enough to matter for this method — 2026-10-26
- K-002 [literature: S31] Context files did not significantly improve coding-task success; developer-written files +2.4% (n.s.), cost up to +19% — 2026-10-26
- K-003 [literature: S33] Instruction-following drops with instruction count; early instructions favored; failures are mostly silent omissions — 2026-10-26
- K-004 [literature: S29] Claude Code strips block-level HTML comments from CLAUDE.md before injecting it — 2026-10-26
- K-005 [literature: S30] Codex documents no `@` import syntax; global file must be self-contained — 2026-10-26

## Assumptions
- A-01 Claude Code loads `@<abs-path>` imports from `~/.claude/CLAUDE.md` at session start, without approval prompt — checked by: docs [literature: S29] and a fresh-HOME test with Claude Code 2.1.310 on 2026-10-26 (quoted R1)
- A-02 Codex loads a global `~/.codex/AGENTS.md` (masked by `AGENTS.override.md` if present), also through a symlink — checked by: docs [literature: S30]; empirical check not yet (Codex not installed)
- A-03 Phase 1 analysis is independent of `REFERENCES.md` — checked by: readers blind (DEC-003); main session and prompts not fully blind (`references/comparison.md` §6)

## Anomalies
- N-01 S31's own introduction reports a 7% developer-vs-generated gap that its results (+2.4% vs −2%) do not show; v0.2 quoted ~4% — seen in: Phase 1 (`references/comparison.md` §3)
