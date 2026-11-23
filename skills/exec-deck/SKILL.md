---
name: exec-deck
description: Build an executive presentation that turns a data analysis into one decision, using data storytelling (Knaflic), the pyramid principle (Minto) and action titles, typeset in LaTeX Beamer. Use when the owner asks for an executive deck, slides for managers, leadership or stakeholders, "apresentação executiva", "deck para a diretoria", "levar esse resultado para o gestor", or to turn an analysis into slides that ask for a decision. Not for academic talks or papers (use academic-writing).
---

# Executive deck

Goal: a deck that a busy decision-maker understands from the slide titles alone, that asks for one clear decision, and in which every number traces back to the script or query that produced it.

Why each practice exists, with sources: `references/story.md` (narrative) and `references/charts.md` (visuals). Read the one a step points to, when it points to it.

## Principles
1. **Answer first.** The recommendation and the ask come on the second slide, not at the end.
2. **One message per slide, said in its title.** The title is a full sentence that states the conclusion (an action title), not a topic. "Churn fell 12% after the new onboarding" and not "Churn results".
3. **Context before charts.** No slide is drafted before the audience, the decision wanted and the time slot are known.
4. **Evidence you can trace.** Every number on a slide is listed in `sources.md` with the script or query and the data date that produced it. A number nobody can regenerate does not go on a slide.
5. **Honest uncertainty.** Show intervals, ranges or the spread over repeated runs wherever they exist, and say what was not checked. Never a single best run.
6. **Backup, not clutter.** Detail that supports a claim but is not needed to decide goes to the appendix.

## Workflow
Work one step at a time. After each step, show its output and wait for the owner's approval before the next (if the project uses urutau, this is its `step` pace).

1. **Brief.** Ask, one question at a time unless the owner already said it: who the audience is (role, what they already know, what they care about); the decision or action wanted; time slot and format (presented live, sent ahead, read alone); language of the slides; where the data and analysis live; constraints (brand template, confidentiality). Save the answers to `brief.md`.
2. **Big Idea and 3-minute story.** Write the Big Idea: one sentence with the owner's point of view and what is at stake. Then the 3-minute story: what you would say with three minutes and no slides. Check: the Big Idea names the action and why it matters now. (`references/story.md`, Knaflic)
3. **Pyramid.** Write the opening as Situation, Complication, Question, Answer. Under the answer, 2 to 4 key arguments that do not overlap and leave no gap; under each argument, the evidence it needs. Output: an indented outline. (`references/story.md`, Minto)
4. **Ghost deck.** Write only the slide titles, in order: title slide; executive summary (answer + ask); one or more slides per argument; the ask and next steps; appendix. Test: read the titles alone, in order. They must tell the whole story and make the ask. The owner approves the titles before any chart is made.
5. **Evidence per slide.** For each title, choose the visual that proves it (`references/charts.md`). Make every figure with a script, at its final size, from a saved snapshot of the data. Record each number shown in `sources.md`: number, slide, script or query, data date.
6. **Build in Beamer.** Follow the LaTeX conventions below.
7. **Check.** Run the checks below and show their output.
8. **Speaker notes and timing.** Write a `\note` per main slide with what to say in one or two sentences. Time the main deck against the slot and cut or move slides to the appendix until it fits.

## LaTeX conventions
- Class and theme: `\documentclass[11pt,aspectratio=169]{beamer}` with `\usetheme{moloch}`, the maintained fork of the Metropolis theme, in TeX Live and MiKTeX. Check it is installed with `kpsewhich beamerthememoloch.sty`. If it is missing and cannot be installed, use `metropolis` and say so.
- Engine: LuaLaTeX through latexmk: `latexmk -lualatex -interaction=nonstopmode main.tex`.
- Language: `\usepackage[<language>]{babel}` with the language from the brief (`brazilian` or `english`).
- Titles: the action title goes in `\frametitle{...}`, at most two lines; shorten the sentence before shrinking the font.
- Figures: one per frame, `\includegraphics[width=\linewidth,height=0.72\textheight,keepaspectratio]{figures/<name>.pdf}`. Make them at the final size with a font size equal to the slide text, so they are never scaled (`references/charts.md`).
- A single key number: show it large (`{\Huge 12\%}`) with one line of context under it, instead of a chart.
- Emphasis: `\alert{}` for the one thing to look at; no other colors for emphasis.
- Executive summary: at most 3 short bullets; the other main slides avoid bullet lists.
- Appendix: `\appendix` and then the backup frames.
- Speaker notes: `\note{...}` inside each frame. For a presenter view on two screens, the pympress viewer reads the notes when built with `\setbeameroption{show notes on second screen=right}` in a separate build.
- Do not hard-code numbers that a script produced: keep them in `sources.md` and copy them from there, or have the script write a small `.tex` file of macros that the deck `\input`s.

## Checks before handing over
Show the evidence of each one.
- Build: `latexmk` exits with code 0.
- Log: `grep -nE "Overfull|undefined" main.log` prints nothing (use the log in the build folder if latexmk writes one).
- Titles only: list the frame titles (`grep -o '\\frametitle{[^}]*}' main.tex`). The owner states the recommendation and the ask from that list alone.
- Numbers: every number on a slide is in `sources.md`.
- Fonts: `pdffonts main.pdf` shows `yes` in the `emb` column for every font.
- Time: main-deck slides fit the slot after one timed run-through.

## What to avoid
Topic titles ("Results", "Analysis"); a dashboard pasted into a slide; pie or 3D charts to compare values; legends where direct labels fit; axes without units; bars that do not start at zero; the ask only on the last slide; numbers without source or date; a best run shown as if typical.

## Deliverables
`main.tex`, `main.pdf`, the figure scripts, `brief.md` and `sources.md`, in one folder the owner chooses.
