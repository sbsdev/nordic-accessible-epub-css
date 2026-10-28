# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A shared effort by Nordic accessible-literature libraries (MTM, SBS, Nota, SPSM, …) to define a common, accessible CSS for EPUB3 books. It has two deliverables:

1. **Guidelines document** — `CSS_guidelines.org` (org-mode source of truth) explaining what an accessible EPUB CSS must cater for, with CSS examples in Appendix 2.
2. **The stylesheet itself** — `less/sbs.less`, a LESS port of `samples/mtm.css` (MTM's CSS, already enhanced to comply with the guidelines).

There are no tests or linters.

## Build

```sh
make            # CSS_guidelines.org -> .pdf/.docx/.html via pandoc (outputs are gitignored)
make -C less    # less/sbs.less -> less/sbs.css via lessc (output gitignored)
```

## Publishing the guidelines

`docs/index.md` is what GitHub Pages publishes (https://sbsdev.github.io/nordic-accessible-epub-css/). It is **not** built by the Makefile: it is a manual org-mode export to markdown of `CSS_guidelines.org`, with a hand-added Jekyll front matter (title, date, author, version) and `{{ page.* }}` header. When the guidelines change, edit the `.org` file and re-export to `docs/index.md`, preserving that front matter and bumping version/date.

## Stylesheet workflow

- `samples/mtm.css` is the upstream reference. When MTM releases a new version, it is first committed to `samples/mtm.css`, then the changes are migrated by hand into `less/sbs.less` (see commit history, e.g. "Migrate changes from latest mtm.css to sbs.less").
- `sbs.less` factors fonts, colors and margins into variables at the top and uses a `.margin(@top, @bottom)` mixin; keep new rules consistent with that.
- Calibre-specific rules are guarded by `& when (@handle-calibre)`; the `@handle-calibre` option at the top of the file defaults to `false`.
- The other files in `samples/` (`sbs.css`, `nota.css`, `epub3-to-daisy202.css`) are reference CSS from other producers/the DAISY pipeline, kept for comparison only.

## Comparison.org

Tracks, item by item, how the MTM CSS differs from the guidelines and how each difference was resolved (org column view over `:COMMENT:`/`:RESOLUTION:` properties). Update it when reconciling the CSS against the guidelines.
