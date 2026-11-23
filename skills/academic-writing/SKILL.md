---
name: academic-writing
description: Write an academic paper and derive an academic talk from it in LaTeX, built on a map of claims and the evidence for each, with paper structure from Mensh & Kording, Gopen & Swan and Peyton Jones, figures from Rougier et al., a submission checklist, and assertion-evidence slides in Beamer. Use for papers, articles, thesis or TCC chapters, MBA assignments written as papers, conference or seminar talks, thesis defenses ("banca"), journal clubs, "escrever o artigo", "apresentação do TCC". Not for executive or business decks (use exec-deck).
---

# Academic writing: paper and talk

Goal: a paper whose every claim points to the evidence that supports it, and a talk derived from the same claims, where each slide states one claim in its title and shows its evidence.

The spine of both is the **claims map** (step 2). The paper and the talk are two readings of it, so write the map before either.

Why each practice exists, with sources: `references/paper.md`, `references/talk.md`, `references/figures.md`. Read the one a step points to, when it points to it.

## Workflow
Work one step at a time. After each step, show its output and wait for the owner's approval before the next (if the project uses urutau, this is its `step` pace).

1. **Frame.** Copy `assets/project/` into the work's folder: `frame.md`, `claims.md`, `data/`, `make_figures.py` (writes `figures/paper/`, `figures/talk/` and `numbers.tex`), and the `paper/` and `talk/` templates. Then ask, one question at a time unless the owner already said it: the contribution in one sentence; the audience (specialists, a broader field, a defense committee); the venue and its rules (template, page or time limit, citation style, language, deadline); which outputs are wanted (paper, talk, both). Save to `frame.md`.
2. **Claims map.** A table in `claims.md`: claim · evidence (figure, table or result) · source (script, commit, data version, or the urutau `Experiment n`) · status (`checked` or `assumed`). No claim enters the paper or the talk without a row; an `assumed` claim is written as a hypothesis or a limitation, never as a result. The owner approves the map.
3. **Paper outline.** One line per section and per paragraph: what it says, in the context–content–conclusion order (`references/paper.md`). The abstract outline follows: context, gap, what was done, main result with its number, what it means. The introduction ends with an explicit list of contributions, each one a claim in the map.
4. **Figures and tables.** Make each from a script, at its final width, following `references/figures.md`. Each has a caption that says what to see in it, not only what it is.
5. **Write, section by section.** Usual order: results, methods, discussion (with limitations), introduction, abstract and title last. Each results subsection is one claim; its first sentence states the claim. The owner reviews each section.
6. **Revise in passes**, one concern per pass:
    1. Structure: each paragraph opens with its point; each section follows context–content–conclusion; every result maps to a claim.
    2. Sentences: the reader-expectation maxims in `references/paper.md` (Gopen & Swan).
    3. Consistency: each term defined once and used the same way; every number matches its source in `claims.md`.
7. **Submission checklist** (`references/paper.md`): claims match results; limitations stated; reproducibility details; uncertainty reported; baseline treated fairly; venue rules met.
8. **Talk** (if asked). Derive it from `claims.md`, not by shrinking the paper. Number of slides from the time slot, about one main slide per minute. Each content slide is assertion–evidence: a sentence title stating the claim, a visual as the body (`references/talk.md`). Order: motivation with a concrete example, the one key idea, the evidence, limitations, the take-home message. Answers to likely questions go to backup slides.
9. **Check** the PDFs (below) and, for a talk, one timed run-through.

## LaTeX conventions
**Paper**
- Use the venue's class and template when there is one; its rules win over everything below.
- Otherwise start from `assets/project/paper/main.tex`: `\documentclass[11pt,a4paper]{article}`, LuaLaTeX through latexmk (its `latexmkrc` sets it: `latexmk main.tex`, logs in `build/`), `babel` with the paper's language, `microtype`, `biblatex` with `biber` (citation style from the venue or field), `cleveref` (`\cref{fig:x}`), `siunitx` (`\num{}`, `\qty{}{}`), `booktabs` tables with no vertical rules, `\label` right after `\caption`.
- Figures as vector PDF at `\linewidth` (or `\columnwidth` in two-column layouts), made at that size by script.
- Numbers produced by scripts: `make_figures.py` writes them to `numbers.tex` as macros (`\gainMean`), which the paper and the talk `\input`, so the text never drifts from the output. `\sisetup{mode=match}` keeps them in the text font.
- Build: `uv run --with matplotlib python make_figures.py`, then `latexmk main.tex` inside `paper/` and inside `talk/`.
- Accessibility: when the venue allows it and the LaTeX is recent, a tagged PDF via `\DocumentMetadata{lang=<lang>, pdfstandard=ua-2, tagging=on}` before `\documentclass`. Check that it compiles; drop it if the venue's class does not support it, and say so.

**Talk**
- Start from `assets/project/talk/main.tex`: `\documentclass[11pt,aspectratio=169]{beamer}` with `\usetheme{moloch}` (check: `kpsewhich beamerthememoloch.sty`; fall back to `metropolis` and say so). Same engine and `babel` as the paper.
- `\frametitle{}` holds the assertion as a sentence of at most two lines; the body holds the evidence (figure, diagram, equation), with words only where the visual needs them.
- Reuse the paper's figure scripts with a slide-sized style rather than shrinking the paper's figures.
- `\appendix` for backup slides; `\note{}` for what to say. Never start an `\item` with `<`: Beamer reads it as an overlay and hides the item.
- Beamer has no support in LaTeX's tagged-PDF project. The experimental `ltx-talk` class is built for it; do not use it for a real talk yet unless the owner asks.

## Checks before handing over
Show the evidence of each one.
- Build: `latexmk` exits with code 0.
- Log: `grep -nE "Overfull|undefined" build/main.log` prints nothing; `biber` reports no missing entries. Known exception in the talk: Moloch v0.1.0 (TeX Live 2023) reports `Overfull \vbox (15.6pt too high)` on the title page even for a minimal document.
- Claims: every claim in the abstract, introduction and talk titles has a row in `claims.md`, and every `checked` row has its source.
- Numbers: every number in the text equals its source (macros file or output).
- Limits: page count or slide count within the venue's or slot's limit.
- Fonts: `pdffonts main.pdf` shows `yes` in the `emb` column for every font.

## What to avoid
A contribution list that cannot be tested; results without uncertainty or number of runs; a baseline that was not reproduced or tuned with the same effort; claims in the abstract that the results do not show; figures pasted from screenshots; topic titles on talk slides ("Results"); a talk that is the paper read aloud.

## Deliverables
`main.tex` and `main.pdf` for each output, `references.bib`, the figure scripts, `frame.md` and `claims.md`, in one folder the owner chooses.
