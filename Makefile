
SOURCE = CSS_guidelines.org

PDF = $(patsubst %.org, %.pdf, $(SOURCE))
DOCX = $(patsubst %.org, %.docx, $(SOURCE))
ODT = $(patsubst %.org, %.odt, $(SOURCE))
HTML = $(patsubst %.org, %.html, $(SOURCE))
GH_PAGES = doc/index.md

%.pdf: %.org
	pandoc --variable=lang:en --variable=geometry:a4paper --variable=fontfamily:libertinus --variable=fontsize:12pt --variable=colorlinks:true --number-sections -o $@ $<

%.docx: %.org
	pandoc --variable=lang:en -o $@ $<

%.odt: %.org
	pandoc --variable=lang:en -o $@ $<

%.html: %.org
	pandoc --variable=lang:en --standalone --embed-resources -o $@ $<

doc/index.md: CSS_guidelines.org
	pandoc --variable=lang:en --to=gfm -o $@ $<

all: $(PDF) $(DOCX) $(HTML) $(GH_PAGES)

.PHONY : clean
clean :
	rm -f $(PDF) $(DOCX) $(HTML) $(ODT)
