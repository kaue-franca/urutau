# Charts: choosing and cleaning the visual for each slide
Paraphrased from Knaflic (2015) and Rougier et al. (2014); sources at the end. Rules marked "owner's convention" are this repo's choices, not from a source.

## Pick the chart by the message of the title
| The title says… | Use | Avoid |
|---|---|---|
| one or two numbers matter | the number in large text, one line of context | a chart with two bars |
| items differ (ranking, comparison) | horizontal bars, sorted by value | pie, donut, 3D |
| a quantity changed over time | a line | bars for long series |
| a forecast or estimate | a line with its interval band (or fan) | a single line without uncertainty |
| parts of a whole (2–3 parts) | simple text or one 100% stacked bar | pie with many slices |
| how values are spread | histogram or box plot | a mean alone |
| two measures relate | scatter, with the key points labelled | dual-axis lines |
| before vs after, for several items | slope chart or dot plot | grouped bars with many groups |

## Clean it (Knaflic: clutter is your enemy; Rougier: do not trust defaults, avoid chartjunk)
- Remove borders, background, heavy gridlines, data markers that add nothing.
- Label lines and bars directly; drop the legend when direct labels fit.
- Every axis has a label with its unit. Bars start at zero.
- Grey for context; **one** accent color for the data the title talks about. Color has meaning, not decoration.
- The chart's own title is not needed when the slide's action title states the takeaway; use a short subtitle for units or the data date.
- Do not mislead: equal intervals on axes, no truncated bar axes, areas proportional to values.

## Make it at its final size (owner's convention, from Rougier: adapt the figure to the medium)
- A 16:9 Beamer slide is 16 cm × 9 cm; the text width is about 14 cm. Create the figure at that width (about 5.5 × 3 in) with a font size equal to the slide text (about 10–11 pt), so it is never scaled and its text matches the slides.
- Save as vector PDF. For an exact font match, matplotlib's `pgf` backend (`savefig(..., backend="pgf")` with `pgf.texsystem: lualatex`) typesets the labels with LaTeX itself.
- One figure per script, or one script that writes all figures, run from a saved data snapshot. The script is the source of every number in the figure.

## Show uncertainty
When a number comes from a model, a sample or repeated runs, show its interval or spread (error bars, bands, ranges in the text) and say over how many runs or cases. A single best run shown as typical is a form of misleading.

## Sources
- Knaflic, C. N. (2015). *Storytelling with Data*, chapters 2–5. https://www.oreilly.com/library/view/storytelling-with-data/9781119002253/
- Rougier, N. P., Droettboom, M., & Bourne, P. E. (2014). Ten Simple Rules for Better Figures. *PLOS Computational Biology* 10(9): e1003833. https://pmc.ncbi.nlm.nih.gov/articles/PMC4161295
- Matplotlib pgf backend: https://matplotlib.org/3.6.1/tutorials/text/pgf.html (older version page; same backend in current releases)
