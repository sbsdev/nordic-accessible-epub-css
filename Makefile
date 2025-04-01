
SOURCE = CSS_guidelines.org

PDF = $(patsubst %.org, %.pdf, $(SOURCE))
DOCX = $(patsubst %.org, %.docx, $(SOURCE))
ODT = $(patsubst %.org, %.odt, $(SOURCE))
HTML = $(patsubst %.org, %.html, $(SOURCE))
MD = $(patsubst %.org, %.md, $(SOURCE))

%.pdf: %.org
	pandoc --variable=lang:en --variable=geometry:a4paper --variable=fontfamily:libertinus --variable=fontsize:12pt --variable=colorlinks:true --number-sections -o $@ $<

%.docx: %.org
	pandoc --variable=lang:en -o $@ $<

%.odt: %.org
	pandoc --variable=lang:en -o $@ $<

%.html: %.org
	pandoc --variable=lang:en --standalone --embed-resources -o $@ $<

%.md: %.org
	pandoc --variable=lang:en --reference-links -o $@ $<

all: $(PDF) $(DOCX) $(HTML)

.PHONY : clean
clean :
	rm -f $(PDF) $(DOCX) $(HTML) $(ODT) $(MD)
