# Knowledge — urutau
<!-- v0.2 format (DEC-013). Old IDs K/A/N dropped; old tags mapped: [literature] → [source], [assumption] → Assumed. -->

## Known
- Context files did not significantly improve coding-task success; developer-written files +2.4% (n.s.), cost up to +19% [source: S31] — 2026-10-26
- Instruction-following drops with instruction count; early instructions are favoured; failures are mostly silent omissions [source: S33] — 2026-10-26
- Claude Code strips block-level HTML comments from CLAUDE.md before injecting it [source: S29] — 2026-10-26
- Codex and Devin document no `@` import syntax; their AGENTS.md must be self-contained [source: S30; Devin CLI docs, critic B 2026-11-22] — 2026-11-22
- Claude Code loads `@` imports from `~/.claude/CLAUDE.md` without a prompt, and nested project imports (`CLAUDE.md` → `@AGENTS.md` → `@<file>`) [checked: fresh-HOME test 2026-10-26; EXPL-001] — 2026-11-22
- Claude Code resolves an `@path` relative to the file that contains it [source: code.claude.com/docs/en/memory, read by critic B 2026-11-22] — 2026-11-22
- uv ignores `pip.conf`; it uses `UV_DEFAULT_INDEX`, `HTTPS_PROXY`, `UV_SYSTEM_CERTS`, `SSL_CERT_FILE`, and downloads Python from GitHub unless told otherwise [source: docs.astral.sh/uv, critic B] — 2026-11-22

## Assumed
- A short, hand-written instruction file loaded in every session changes agent behaviour enough to matter for this method — would be checked by: the Phase 7 pilot (SC-05)
- Codex loads `~/.codex/AGENTS.md` (masked by `AGENTS.override.md`) — would be checked by: a session on a machine with Codex
- Devin CLI loads `~/.config/devin/AGENTS.md` as global rules (docs also name `~/.devin/global_rules.md`) — would be checked by: SC-04 on the work PC
- Phase 1 analysis is independent of `REFERENCES.md` — checked only partly: readers blind (DEC-003), main session not (`history/` comparison §6)

## Unexplained
- S31's introduction reports a 7% developer-vs-generated gap that its results (+2.4% vs −2%) do not show — seen in: Phase 1 comparison §3
- With the project inside the session scratchpad (`/tmp/claude-1000/…`), Claude Code loaded no project CLAUDE.md at all — seen in: EXPL-001

## Dead ends
| What | Verdict | Why (1 line) | Evidence | Revive if |
|---|---|---|---|---|
| v0 `status.md` | superseded | owner wants exactly three files; current task lives in `spec.md` | DEC-012 | cold start (E1) fails because the task card is hard to find |
| v0.1 `.urutau/` pin loaded by `@.urutau/AGENTS.md` | superseded | Devin and Codex do not follow `@` imports | DEC-013 | every tool the owner uses supports imports |
| v0.1 split rules G1–G6 / R1–R15 | superseded | the two lists restated each other (~80 lines of overlap) | DEC-013, critics A and C | — |

## Map
| Path | Why it exists | Status: core · support · one-off · legacy · ? |
|---|---|---|
| `global/AGENTS.md` | rules for every session on a machine (U1–U6) | core |
| `project/` | exactly what lands in a project: method block, modules, project section, sdd skeletons, CLAUDE.md | core |
| `examples/churn-90d/` | a filled project to learn the format from | support |
| `sdd/` | this repo's own records (dogfooding) | core |
| `references/`, `PLAN.md`, `REFERENCES.md`, `guide/` | v0 build history and sources; to move or merge in T-13 | legacy |
