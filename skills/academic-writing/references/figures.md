# Figures for papers and talks
Paraphrased from Rougier et al. (2014); the size and tooling notes are this repo's conventions (marked).

## Ten simple rules for better figures (Rougier, Droettboom & Bourne 2014)
1. Know your audience: a figure for specialists differs from one for a broad audience or a talk.
2. Identify your message: decide what the figure must show before making it.
3. Adapt the figure to the medium: a paper is read close up and slowly; a slide is seen from afar for a minute.
4. Captions are not optional: say what to see, not only what is plotted.
5. Do not trust the defaults of plotting software: sizes, fonts, colors and ticks need choosing.
6. Use color effectively: to separate or highlight, with colormaps suited to the data.
7. Do not mislead the reader: areas, scales and axes must keep proportions honest.
8. Avoid chartjunk: every element that does not carry information is noise.
9. Message trumps beauty.
10. Get the right tool for the job.

## Size and fonts (owner's convention)
- Make each figure at its final size: `\linewidth` of the paper (about 6.3 in for a one-column A4 article with default margins; check with `\the\linewidth`) or of the slide (about 14 cm on a 16:9 Beamer slide). Never scale it in LaTeX.
- Use the document's font size for labels (about 9–10 pt in a paper, 10–11 pt on slides).
- For an exact font match, matplotlib's `pgf` backend (`savefig(..., backend="pgf")`, `pgf.texsystem: lualatex`) typesets the labels with LaTeX.
- If PGFPlots/TikZ code is needed instead of PDF, `tikzplotlib` is no longer maintained; its successor is `matplot2tikz`.

## Uncertainty and honesty (urutau method)
Show intervals or the spread over runs or cases; say how many. Compare against the baseline with the same inputs and effort. A figure made from a single best run is labelled as such or not used.

## Sources
- Rougier, N. P., Droettboom, M., & Bourne, P. E. (2014). Ten Simple Rules for Better Figures. *PLOS Computational Biology* 10(9): e1003833. https://pmc.ncbi.nlm.nih.gov/articles/PMC4161295
- Matplotlib pgf backend: https://matplotlib.org/3.6.1/tutorials/text/pgf.html (older version page; same backend in current releases)
- matplot2tikz: https://pypi.org/project/matplot2tikz/
