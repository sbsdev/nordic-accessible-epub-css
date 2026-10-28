# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A shared effort by Nordic accessible-literature libraries (MTM, SBS, Nota, SPSM, …) to define a common, accessible CSS for EPUB3 books. It has two deliverables:

1. **Guidelines document** — `CSS_guidelines.org` (org-mode source of truth) explaining what an accessible EPUB CSS must cater for, with CSS examples in Appendix 2.
2. **The stylesheet itself** — `sbs.css`, a cleaned-up port of `samples/mtm.css` (MTM's CSS, already enhanced to comply with the guidelines).

There are no tests or linters.

## Build

```sh
make    # CSS_guidelines.org -> .pdf/.docx/.html via pandoc (outputs are gitignored)
```

## Publishing the guidelines

`docs/index.md` is what GitHub Pages publishes (https://sbsdev.github.io/nordic-accessible-epub-css/). It is **not** built by the Makefile: it is a manual org-mode export to markdown of `CSS_guidelines.org`, with a hand-added Jekyll front matter (title, date, author, version) and `{{ page.* }}` header. When the guidelines change, edit the `.org` file and re-export to `docs/index.md`, preserving that front matter and bumping version/date.

## Stylesheet workflow

- `samples/mtm.css` is the upstream reference. When MTM releases a new version, it is first committed to `samples/mtm.css`, then the changes are migrated by hand into `sbs.css`. Keep `sbs.css` formatted like `mtm.css` so the two stay diffable.
- `sbs.css` is plain CSS with literal values on purpose: don't introduce `var()`, nesting or a preprocessor, since many e-reader engines don't support them.
- Calibre-specific workarounds are kept as commented-out rules.
- The other files in `samples/` (`samples/sbs.css` — SBS's older production CSS, not the same as the root `sbs.css` — `nota.css`, `epub3-to-daisy202.css`) are reference CSS from other producers/the DAISY pipeline, kept for comparison only.

## Comparison.org

Tracks, item by item, how the MTM CSS differs from the guidelines and how each difference was resolved (org column view over `:COMMENT:`/`:RESOLUTION:` properties). Update it when reconciling the CSS against the guidelines.
