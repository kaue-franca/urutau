# Knowledge — urutau
<!-- Source numbers (S31 …) point to the Sources table in SCIENCE.md. Old log IDs (EXPL-001, DEC-013) are kept as written in log.md. -->

## Known
- Context files did not significantly improve coding-task success; developer-written files +2.4% (not significant), cost up to +19% [source: S31] — 2026-10-26
- Instruction-following drops with instruction count; early instructions are favoured; failures are mostly silent omissions [source: S33] — 2026-10-26
- Claude Code strips block-level HTML comments from CLAUDE.md before injecting it [source: S29] — 2026-10-26
- Codex and Devin document no `@` import syntax; their AGENTS.md must be self-contained [source: S30, S54] — 2026-11-22
- Claude Code loads `@` imports from `~/.claude/CLAUDE.md` without a prompt, and nested project imports (`CLAUDE.md` → `@AGENTS.md` → `@<file>`) [checked: fresh-HOME test 2026-10-26; EXPL-001 in log.md] — 2026-11-22
- Claude Code resolves an `@path` relative to the file that contains it [source: S29, read by a reviewer agent 2026-11-22] — 2026-11-22
- uv ignores `pip.conf`; it uses `UV_DEFAULT_INDEX`, `HTTPS_PROXY`, `UV_SYSTEM_CERTS`, `SSL_CERT_FILE`, and downloads Python from GitHub unless told otherwise [source: docs.astral.sh/uv, read by a reviewer agent] — 2026-11-22
- The global rules are installed on the owner's personal notebook: `~/.claude/CLAUDE.md` imports `global/AGENTS.md` and `~/.codex/AGENTS.md` links to it; the old setup-skill link was removed [checked: `ls -la` and file contents, 2026-11-22] — 2026-11-22
- Jargon makes text harder to process and definitions do not fully undo it; made-up acronyms are rarely shared vocabulary [source: S59, S60] — 2026-11-22
- Restating the task before acting (read-back, receiver's summary) reduced errors in clinical studies, none randomized [source: S64, S65] — 2026-11-22
- Users over-trust confident AI answers, more so when they are long; first-person uncertainty reduces over-reliance [source: S56, S58] — 2026-11-22

## Assumed
- A short, hand-written instruction file loaded in every session changes agent behaviour enough to matter for this method — would be checked by: the pilot (Criterion 5)
- Codex loads `~/.codex/AGENTS.md` (masked by `AGENTS.override.md`) — would be checked by: a Codex session on this notebook
- Devin CLI loads `~/.config/devin/AGENTS.md` as global rules (docs also name `~/.devin/global_rules.md`) — would be checked by: Criterion 4 on the work PC
- The report shape (understood → result → how I know → next) helps the owner more than free-form replies — would be checked by: the owner's rating in the pilot (upkeep criterion)

## Dead ends
| What | Verdict | Why (1 line) | Evidence | Worth retrying if |
|---|---|---|---|---|
| v0 `status.md` | superseded | owner wants exactly three files; current task lives in `spec.md` | DEC-012 | cold start fails because the task card is hard to find |
| v0.1 `.urutau/` copy loaded by `@.urutau/AGENTS.md` | superseded | Devin and Codex do not follow `@` imports | DEC-013 | every tool the owner uses supports imports |
| v0.1 split rules G1–G6 / R1–R15 | superseded | the two lists restated each other (~80 lines of overlap) | DEC-013 | — |
| Rule numbers U1–U9 and coined codes (SC, TEST, TRY, H0/H1, M, L, E) | replaced by names | the owner could not follow replies full of codes | Decision 16 | — |
| `project/modules/ml.md`, `rl.md` | removed | the method must work for any project; domain checklists become the owner's own skills | Decision 17 | a domain recurs across projects: `git show v0.1.0:modules/ml.md` for the v0.1 text; the v0.2 text is in commit f5c1624 |
| `scripts/` (install, setup, check), `skills/urutau-setup/`, `project/CLAUDE.md` | removed | tied to specific tools and out of date; an agent follows `INSTALL.md` instead | Decision 18 | `git show 8f64f1d:<path>` |
| `PLAN.md`, `REFERENCES.md`, `references/`, `guide/index.html`, `CHANGELOG.md` | removed | v0 build history; `SCIENCE.md`, `sdd/log.md` and git tags hold what is still needed | Decision 17 | `git show v0.1.0:<path>` |

## Why each file exists
| Path | Why it exists | Status: core · support · one-off · legacy · ? |
|---|---|---|
| `global/AGENTS.md` | rules for every session on a machine | core |
| `project/` | exactly what lands in a project: method, project section, sdd skeletons | core |
| `INSTALL.md` | install, setup, update and removal steps for any agent | core |
| `examples/churn-90d/` | a filled project to learn the format from | support |
| `SCIENCE.md` | why each rule exists and its sources (Criterion 2) | core |
| `sdd/` | this repo's own records | core |
| `README.md`, `AGENTS.md`, `VERSION`, `LICENSE`, `.gitignore` | entry point, dev instructions, version, license, ignores | support |
| `CLAUDE.md` | one-line pointer to `AGENTS.md` for the tool used in this repo today (`INSTALL.md` setup step 3) | support |
