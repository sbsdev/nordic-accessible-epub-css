---
title: "Guidelines for accessible CSS"
date: 2024-11-01
author: "Oscar Lagerström Carlsson, Christian Egli, Jonas Lillqvist, Linda Lindhé"
---

# {{ page.title }}

{{ page.author }}

{{ page.date }}

# Introduction

This document provides general guidelines for creating a common,
accessible CSS stylesheet for EPUB publications produced by Nordic
special libraries serving print-disabled readers. The aim is to ensure
that EPUB content is inclusive and adaptable, meeting the diverse
needs of library patrons. While these guidelines draw on the [Web
Content Accessibility Guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/) (WCAG) and resources such as the
[DAISY Knowledge Base](https://kb.daisy.org/publishing/docs/), they extend beyond the basic criteria offered by
these sources to address broader aspects of readability, text
formatting, and layout.

The CSS rules outlined here are intended to align with EPUBs created
according to the Nordic Guidelines for the Production of Accessible
EPUB 3. This document does not, however, cover every element and
attribute that may be used in books produced according to the Nordic
Guidelines, as it operates on a more general level than the CSS
stylesheet itself. As we continue to refine our approach, this document
will be adjusted and expanded to reflect ongoing learning and
collaboration.


# Accessible CSS and WCAG

WCAG and resources such as the Daisy Knowledge Base provide limited
guidance on CSS and styling. While certain WCAG success criteria and
techniques cover specific issues (e.g., link styling, color contrast,
text reflow), aspects like typography and layout are largely
unaddressed. Success Criterion 1.4.8 Visual Presentation (Level AAA) is
an exception, as it includes requirements for the visual presentation of
text blocks, though it only mandates that a mechanism be available to
achieve the required styling, potentially provided by the reading system
itself.


## WCAG criterions relevant to e-book styling

-   [Success Criterion 1.4.1 Use of Color](https://www.w3.org/TR/WCAG21/#use-of-color) (A)
-   [Technique G182](https://www.w3.org/WAI/WCAG21/Techniques/general/G182): Ensuring that additional visual cues are available
    when text color differences are used to convey information
-   [Technique G183](https://www.w3.org/WAI/WCAG21/Techniques/general/G183): Using a contrast ratio of 3:1 with surrounding text
    and providing additional visual cues on hover for links or controls
    where color alone is used to identify them
    -   See also Daisy KB, [Color](https://kb.daisy.org/publishing/docs/css/color.html)
-   [Success Criterion 1.4.3 Contrast (Minimum)](https://www.w3.org/TR/WCAG21/#contrast-minimum) (AA)
    -   See also Daisy KB, [Contrast](https://kb.daisy.org/publishing/docs/css/contrast.html)
-   [Success Criterion 1.4.4 Resize Text](https://www.w3.org/TR/WCAG21/#resize-text) (AA)
    -   See also Daisy KB, [Text Resizing](https://kb.daisy.org/publishing/docs/css/text-resize.html)
-   [Success Criterion 1.4.8 Visual Presentation](https://www.w3.org/TR/WCAG21/#visual-presentation) (AAA)
-   [Success Criterion 1.4.10 Reflow](https://www.w3.org/TR/WCAG21/#reflow) (AA)
    -   See also Daisy KB, [Reflow](https://kb.daisy.org/publishing/docs/css/reflow.html)
-   [Success Criterion 1.4.12 Text Spacing](https://www.w3.org/TR/WCAG21/#text-spacing) (AA)
    -   See also Daisy KB, [Text Spacing](https://kb.daisy.org/publishing/docs/css/text-spacing.html)


# Who is impacted by e-book styling and layout?

-   People with vision disabilities
    -   Low vision
        -   WCAG Resize text
        -   WCAG Reflow
        -   WCAG Contrast
    -   Colour blindness
        -   WCAG Use of colour
        -   WCAG Contrast
    -   Blindness
        -   Styling not an issue in general
        -   All caps can be a problem
-   People with dyslexia, cognitive or learning disabilities
    -   WCAG Text spacing
    -   WCAG Visual presentation
    -   Legible and readable text
    -   Simple, clear layout


<a id="e-book_readers_ref"></a>

# E-book readers and CSS

Most e-book readers render the content using a browser engine, so
styling is handled through CSS. This allows for flexibility in layout,
fonts, colors, and other visual aspects. In e-book readers, there are
three layers of styling:

-   **Default styles of the app:** These provide a fallback when no
    specific styling is defined in the book's CSS.

-   **The stylesheet included in the book:** This is the CSS authored by
    the e-book creator, which defines the intended look and feel.
-   **User settings:** These take precedence over both the default styles
    and the book's CSS, allowing readers to customize the reading
    experience according to their preferences.

The reading app typically applies these layers in a cascading manner,
with user settings having the highest priority. In some cases, however,
the app may override or ignore parts of the book's stylesheet. And in
extreme cases, the reading app may completely disregard the book's CSS,
rendering the content purely based on default styles and user settings.

The recommendations in this document focus on the CSS included in the
e-book, as the development of reading apps is beyond its scope. These
guidelines are based on the assumption that the reading apps we offer or
recommend to our patrons will support the book's CSS.


## The importance of CSS in accessible e-books

Including a CSS stylesheet in the book is important for several reasons.

-   **Enhancing accessibility for visual reading:** Thoughtfully crafted
    CSS can benefit readers with dyslexia or those who are visually
    impaired but are able to read visually. It allows for clear
    headings, proper contrast, customized line spacing, and font choices
    that improve readability, making the content more accessible and
    easier to process.

-   **Supporting complex layouts and structure:** Books with tables,
    footnotes, or multi-level headings often require precise styling to
    remain clear and accessible. CSS helps maintain this structure,
    ensuring that even complex content is navigable and understandable
    for all readers.
    
    Some elements found in more complex books, such as image
    descriptions or text boxes, will not be distinguishable from
    ordinary body text when relying solely on the app's default
    stylesheet. Additionally, some elements will be distinguishable but
    easily confused with another. For example, the default styling of
    headings at different levels may not allow the reader to
    differentiate them visually. Similarly, image captions and
    blockquotes can appear identical in some reading apps.

-   **Maintaining consistency across reading apps:** E-book reading apps
    can differ significantly in how they handle default styles. By
    including a CSS stylesheet, you provide a consistent baseline,
    ensuring that the book is presented in a reader-friendly way,
    regardless of the device or app.


## Balancing CSS with user customization

Including a CSS stylesheet in the book does not generally prevent
users from applying their own settings to fit their needs. As outlined
in [E-book readers and CSS](#e-book_readers_ref), user settings typically have the highest
priority and will override the book's CSS. This ensures that readers
can adjust aspects such as font size, line spacing, and background
color according to their preferences.

However, certain CSS practices can inadvertently restrict user
customization, so it's important to write the CSS thoughtfully. Here
are a few key considerations:

-   **Avoid absolute units:** Using absolute units like pixels (`px`) can
    prevent text from resizing correctly, limiting the reader's ability
    to adjust font sizes. Instead, use relative units like `em` or `rem`,
    which adapt more flexibly to different user settings and screen
    sizes.

-   **Be cautious with text colors:** Defining text or background colors
    should be avoided unless there's a specific need. If the text color
    is set without considering background contrast, it might conflict
    with a user's chosen background color scheme, potentially making the
    text difficult to read.

By following these guidelines, you can ensure that your CSS enhances
the book's presentation without hindering the reader's ability to
customize their experience.


## Keep the CSS general

Since special libraries often apply the same CSS to a wide range of
books, it's essential to keep the stylesheet as general and adaptable as
possible. Attempting to account for highly specific cases can lead to
overly complex or bloated stylesheets, which may be harder to maintain
and could even interfere with the styling of other books. For unique or
exceptional cases, consider handling them individually with tailored
CSS, rather than trying to cover every possibility in a single
stylesheet.

With these general principles in mind, the following sections provide
detailed recommendations and examples for styling various elements.
These guidelines aim to help you create a consistent and accessible
reading experience across a wide range of books.


# Body text typography

-   **Font choice:** Generally, it only makes sense to specify a specific
    font in the CSS if the font is embedded in the publication or is a
    widely used system font. Alternatively, you can specify a generic
    font family (e.g. sans-serif, serif). It is always a good idea to
    specify a generic font family as a fallback when you specify a font.

-   **Line spacing:** The default line spacing in reading apps is often
    too tight. For a better reading experience, we recommend setting the
    line spacing for body text to roughly 1.4-1.5.

-   **Paragraph spacing:** As a default, reading systems generally add
    spacing between paragraphs. This may be good enough, or you might
    want to add rules specifying a certain spacing between paragraphs
    (for example using `margin-top`).

-   **Page margins:** The body text or page margin is usually handled by
    the reading system, so there is no need to set in your CSS.


# Headings

Headings should stand out and be easily distinguishable by level to
convey the text's structure clearly. Larger fonts, increased font
weight, and added spacing before and after headings are effective ways
to indicate hierarchical importance. Avoid using all caps, especially
for long headings. Typically, spacing before a heading is larger than
after, and higher-level headings have greater spacing overall. Using a
different font or generic font family for headings than body text can
also enhance their visibility.


# Pagination

In books produced according to the Nordic Guidelines, page break markers
are by default empty elements, with the page number indicated in the
aria-label attribute. Since the page number is not part of the text
content, it remains invisible unless CSS is applied to display it. These
guidelines do not provide a specific recommendation on whether to
display page numbers visually, as this decision may depend on factors
such as the type of book, the intended audience, and other
considerations.

There are many possible ways of displaying page numbers. To emphasize
the page number, it may be displayed as a block element, and a border,
along with margin and paddings, can be added. For consistency in the
page numbers' appearance, the font family, weight and style can be
defined. The page number should be extracted from the aria-label
attribute, only if the page break element has no text node.

[CSS example: Pagination](#pagination_ref)


# Blockquotes

To make blockquotes stand out, indent them on the left, and optionally
on the right as well. Add extra spacing before and after the blockquote
and consider using a slightly smaller font and line spacing.

[CSS example: Blockquotes](#blockquotes_ref)

If italics are used for blockquotes, make sure that text that was
italicized in the source still stands out. You can do it by removing the
italics through CSS (apply font-style=normal).

[CSS example: Blockquotes with emphasis](#blockquotes_emph_ref)


# Lists

Indent lists and make sure that the line spacing is not too big. Ordered
and unordered lists can be handled with the same CSS. Specific list
styles can be applied for different types of ordered lists if required.
This can be used for different levels in nested lists to make them more
legible.

[CSS example: Lists](#lists_ref)


# Text boxes

Use bordered boxes to make text boxes stand out from the rest of the
text. You can use a different background-color for the text box than
what is used for the main text to make it stand out more. If you do,
make sure that the contrast between the text and the background is
sufficient (<http://kb.daisy.org/publishing/docs/css/contrast.html>).

[CSS example: Text boxes](#text-box_ref)


# Poems

For poems, use a left indent. Since blockquotes have a left indent as
well, consider using a larger left indent for poems than for
blockquotes. The CSS must also work for cases where the poem is part
of a blockquote.

If a poem consists of several stanzas, spacing between them needs to be
taken into consideration.


## Poem/verse lines

Poems need to be marked up on a line-by-line basis. Use a hanging indent
for lines that automatically overflow to a new line.

[CSS example: Poems](#poems_ref)


## Line numbers

For poems containing line-numbers, offset the line number to the left
using a negative left indent so that it does not disturb the layout of
the poem.

[CSS example: Line numbers](#line-number_ref)


# Links

To make links stand out, use a different color than the main text if
that is not applied automatically. For further definition of links, use
underline. To make them even more noticeable, you can apply styles that
activate when a user hovers the mouse over the link.

[CSS example: Links](#link_ref)


# Note references

Note references should be superscripted and styling should be similar to
other links. While this can be done using `<sup>` in the markup, we
suggest the styling is achieved through CSS instead.

[CSS example: Notes](#note_ref)


# Endnotes

Since list markup is used for endnotes, they can partly be handled with
the CSS rules used for lists.

[CSS example: Endnotes](#endnote_ref)


# Computer code

Reading systems automatically use a monospace font for text marked up
with a `<code>`-tag. While this can be considered sufficient, an
adjustment of the font family or the font size might be required for the
text to match the main text.

In books produced according to the Nordic Guidelines, blocks of computer
code containing several lines will be contained in a `<pre>`-element in
order to preserve white space and lines breaks. As this will also
prevent long lines from breaking, it is advisable to use the overflow
property to make a horizontal scroll bar appear when lines do not fit in
the available space.

[CSS example: Computer code](#code_ref)


# Figures

The figure element groups images or tables with their captions and
descriptions. Use CSS to adjust its margins, padding, and to keep
captions and descriptions on the same page as the image when possible.

[CSS example: Figures](#figure_ref)


## Images

Images can serve different purposes. Some need to be as large as
possible while others, like a logo or a portrait, do not.

It is a good idea to define a general rule that restricts the width of
images to 100%. To ensure the caption stays with the image, consider
limiting the image height relative to the viewport.

For specific use cases, you can define different image sizes using
classes. It is always a good idea to use relative units for defining
image size (%, `em`), and to use `max-width` or similar rather than
`min-width`.

[CSS example: Images](#image_ref)


## Figure captions

Ensure figure captions are distinct from the body text, stay close to
the image, and have sufficient spacing from surrounding content.

[CSS example: Figure cations](#fig-caps_ref)


## Figure descriptions and table descriptions (extended descriptions)

If an `<aside>` element is used for extended descriptions: Use bordered
boxes with a background color to make the description stand out. Make
sure that the color contrast between the text and the background is
sufficient (<http://kb.daisy.org/publishing/docs/css/contrast.html>).
Use a different color for image descriptions from what is used for text
boxes.

[CSS example: Figure descriptions](#fig-desc_ref)


# Tables

It is not clear whether a visible grid (table and cell borders)
increases the accessibility of a table. However, we recommend that as a
default, tables should have a visible grid so that the cells are more
defined. Make sure to differentiate between table headers and other
table cells. Some tables may have captions. Make sure they stand out
from body text. It is usually a good idea to left-align and top-align
text in all cells.

[CSS example: Tables](#table_ref)

[CSS example: Tables captions](#table-caps_ref)

Since tables are not as easily reflowable as other elements in ebooks,
larger tables should include a horizontal scroll bar to ensure that they
are easily viewed. The Nordic Guidelines recommend wrapping large tables
in `<div class="table-wrapper>`. This is referenced in the CSS to make
the table scrollable.

[CSS example: Tables wrapper](#table-wrapper_ref)


# Media overlays

Titles that are produced with media overlays need additional CSS-rules
for text and audio synchronization. To highlight text that is being read
aloud, the opf-file and the CSS need to include information regarding
text-synchronization.

The markup in the xhtml-files decides if the highlighting occurs on a
paragraph, sentence or word level. Additionally, it is possible to fade
the text that is not being read.

Keep color contrasts in mind when choosing text and background colors.

[CSS example: Media overlays - CSS](#media-css_ref)

[CSS example: Media overlays - opf-file](#media-opf_ref)


# Appendix 1: Typeface accessibility

An accessible typeface should be:

-   Legible (how effectively a person can distinguish individual
    letters)
-   Readable (how effectively a person can understand sentences, read
    comfortably for a period of time)

Accessible typeface tips:

-   Choose a taller x-height
-   Choose more open typefaces (larger apertures)
-   Choose larger white spaces within letters
-   Avoid ligatures (joined letters)
-   Choose typefaces with recognizable letters
    -   avoid letters that are easily mistaken for one another
    -   avoid letters that are mirror images of one another
-   Look at spacing between letters - not too tight, not too large
-   Limit using all caps text
-   Avoid images of text

Consider the context:

-   What tone do you want to convey?
-   Who is your audience?
-   What type of text content is it? (Body text, headings &#x2026;)
-   Where/on what platforms will the text be read? Type of screen?

Key typeface families:

-   Sans serif &#x2013; generally a good choice for digital use
-   Serif &#x2013; can be an accessible choice for digital use
    -   not the best for: small text, lower resolution screens

“Serifs form word shapes to enable more fluid readability however sans
serif can aid individual character recognition for less advanced
readers.” (Gareth Ford Williams, [A Guide to Understanding What Makes a
Typeface Accessible](https://medium.com/the-readability-group/a-guide-to-understanding-what-makes-a-typeface-accessible-and-how-to-make-informed-decisions-9e5c0b9040a0))


## Choosing a sans serif typeface

Humanist sans serifs have the most accessible characteristics.

Examples: Calibri, Verdana, Tahoma; new Microsoft fonts: Seaford, Skeena

Note: Not a recommendation to use these specifically


### Choosing a serif typeface

Examples with more accessible characteristics: Georgia, Sabon


## Typographic layout and styling

-   Create visual hierarchy with variations in font weight and size
-   Avoid italics
-   Headings should be sized relative to body text
-   Use suitable line spacing
-   Avoid more than 80 characters paragraph width
-   Left align paragraphs


## Resources

Daisy Accessible Publishing Knowledge Base, [CSS](https://kb.daisy.org/publishing/docs/css/)

Vision Australia Digital Access webinar: Typography in Inclusive
Design, <https://youtu.be/ha768Ih6J8M?si=zfIc5ZL78okwUiMS>

Gareth Ford Williams, [A Guide to Understanding What Makes a Typeface
Accessible](https://medium.com/the-readability-group/a-guide-to-understanding-what-makes-a-typeface-accessible-and-how-to-make-informed-decisions-9e5c0b9040a0)


# Appendix 2: CSS examples


<a id="pagination_ref"></a>

## CSS example: Pagination

    [epub|type='pagebreak'] {
        font-family: arial, sans-serif;
        font-weight: bold;
        font-style: normal;
        display: block;
        text-align: right;
        margin-right: 2em;
        border-top: solid 1px #E5E5E5;
        padding-top: 2em;
        margin-top: 3em;
    }
    
    [epub|type='pagebreak']:empty:before {
        content: attr(aria-label);
    }


<a id="blockquotes_ref"></a>

## CSS example: Blockquotes

    blockquote {
    margin-top: 1.5em;
    margin-bottom: 1.5em;
    margin-left: 2em;
    font-size: 90%;
    }


<a id="blockquotes_emph_ref"></a>

## CSS example: Blockquote with emphasis

    blockquote {
        margin-top: 1.5em;
        margin-bottom: 1.5em;
        margin-left: 2em;
        font-size: 90%;
        font-style: italic;
    }
    
    blockquote em {
        font-style: normal;
    }


<a id="lists_ref"></a>

## CSS example: Lists

    ol, ul {
        margin-left: 0.5em;
    }
    
    ul.plain, ol.plain {
        list-style-type: none;
    }
    
    ul li, ol li {
        margin-top: 1em;
    }

    dl {
        margin-top: 2em;
        margin-bottom: 2em;
    }
    
    dt {
        margin-top: 1em;
        font-weight: bold;
    }
    
    dl + dl {
        margin-top: 1.5em;
        padding-top: 1em;
    }


<a id="text-box_ref"></a>

## CSS example: Text-boxes

    .text-box {
        border: 1px solid gray;
        background-color: #E8FBFF;
        margin-top: 1em;
        margin-bottom: 1.5em;
        padding-left: 1em;
        padding-right: 1em;
        padding-top: 0.5em;
        padding-bottom: 0.5em;
    }
    
    aside.text-box {
        background-color: #F3F2F1;
    }


<a id="poems_ref"></a>

## CSS example: Poems

    div.verse {
        margin-top: 1.5em;
        margin-bottom: 1.5em;
        margin-left: 2em;
    }
    
    /* for cases where the poem is in a blockquote, assuming margin-left
       of blockquote is 1.5em: */
    
    blockquote div.verse {
        margin-top: 0;
        margin-left: 0.5em;
        margin-bottom: 0;
    }
    
    blockquote div.verse + blockquote div.verse {
        margin-top: 1.5em;
    }
    
    p.linegroup + p.linegroup {
        margin-top: 1em;
    }
    
    span.line {
        display: inline-block;
        margin-left: 1.2em;
        text-indent: -1.2em;
    }


<a id="line-number_ref"></a>

## CSS example: Line numbers

    span.linenum{
        position: absolute;
        margin-left: -1.5em;
        font-weight: normal;
    }


<a id="link_ref"></a>

## CSS example: Links

    a {
        text-decoration: underline;
    }
    
    a:hover, a:active, a:focus {
        text-decoration: none;
        color: #CC3333;
        background-color: #FFFFCC;
    }


<a id="note_ref"></a>

## CSS example: Note references

    a[role="doc-noteref"] {
        font-family: arial, helvetica, verdana, sans-serif;
        vertical-align: super;
        line-height: normal;
        font-size: 75%;
        border: 1px solid #FF0000;
    }
    
    /* some books rely on reading systems' default styling for links
       (usually blue, underline); it would be a good idea to define link
       styling elsewhere in the stylesheet */
    
    a[role="doc-noteref"] {
        vertical-align: baseline;
        position: relative;
        top: -0.4em;
        font-size: 0.85em;
        font-style: normal;
    }


<a id="footnote_ref"></a>

## CSS example: Footnotes

    a[role="doc-backlink"] {
        font-size: 85%;
        text-decoration: none;
        border: 1px solid #FF0000;
    }
    
    aside[role="doc-footnote"] {
        border: thin #FF0000 solid;
        padding: 1em;
        margin: 1em;
    }


<a id="endnote_ref"></a>

## CSS example: Endnotes

    section[role="doc-endnotes"] ol {
        padding-left: 1.2em;
        font-size: 0.85em;
    }


<a id="code_ref"></a>

## CSS example: Code

    code {
        font-family: courier, monospace;
    }
    
    pre {
        overflow-x: auto;
        whitespace: pre;
    }


<a id="figure_ref"></a>

## CSS example: Figures

    figure {
        margin: 1.5em 0 1.5em 0em;
        padding: 0;
        page-break-inside: avoid;
    }


<a id="image_ref"></a>

## CSS example: Images

    img {
        max-width: 100%;
        max-height: 80vh; /* to leave room for the caption */
    }


<a id="fig-caps_ref"></a>

## CSS-examples: Figcaption

    figcaption {
        font-style: italic;
        margin-bottom: 2em;
    }
    
    figcaption {
        font-size: 0.85rem;
        text-indent: 0;
        margin-top: 0.5em;
        line-height: 1.3;
        font-family: "Source Sans", sans-serif;
    }


<a id="fig-desc_ref"></a>

## CSS example: Figure and table descriptions

    aside.fig-desc, aside.table-desc, aside[epub|type='z3998:production'] {
        border: 1px solid #A7A7A7;
        background-color: white;
        color: black;
        margin-top: 1em;
        margin-bottom: 1em;
        padding: 1em;
    }
    
    aside.fig-desc > *, aside.table-desc > *,
    aside[epub|type='z3998:production'] > * {
        color: black;
    }


<a id="table_ref"></a>

## CSS example: Tables

    table {
        border: 2px solid gray;
        padding: 1em;
        font-size: 80%;
        margin-top: 1.5em;
        margin-bottom: 2em;
        border-collapse: collapse;
    }
    
    th {
        border: 1px solid gray;
        font-weight: bold;
        text-align: left;
        vertical-align: top;
        padding: 0.5em;
    }
    
    td {
        border: 1px solid gray;
        padding: 0.5em;
    }
    
    table caption {
        text-align: left;
        margin-bottom: 0.5em;
        font-weight: bold;
    }


<a id="table-caps_ref"></a>

## CSS example: Table caption (for table style without borders for table and td cells)

    caption {
        font-weight: 700;
        text-align: left;
        background-color: #F5F5F5;
        padding: 0.25em 0.2em 0.25em 0.2em;
        border-top: 1px solid #595959;
        border-bottom: 1px solid #595959;
    }


<a id="table-wrapper_ref"></a>

## CSS example: Table wrapper

    div.table-wrapper {
        overflow-x: auto;
        /* workaround for Calibre: add a vertical scrollbar
             to prevent clipping of table at page breaks */
        overflow-y: auto;
        max-width: 100%;
        max-height: 100%; /* for Calibre */
    }


## CSS example: Math

      math[display~='block'] {
        overflow-x: auto;
        overflow-y: hidden;
    }


<a id="media-css_ref"></a>

## CSS example: Media overlays - CSS

    /* for highlighting active text */
    
    .my-active-item {
        background-color: yellow;
        color: black !important;
    }
    
    /* for fading text that is not being read*/
    html.my-document-playing * {
        color: gray;
    }


<a id="media-opf_ref"></a>

## Example: Media overlays - opf-file

    <package>
    
      [...]
    
      <!-- for highlighting active text -->
    
      <meta property="media:active-class">my-active-item</meta>
    
      <!-- for fading text that is not being read -->
      <meta property="media:playback-active-class">my-document-playing</meta>
    
    </package>

