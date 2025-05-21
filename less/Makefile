CSS = sbs.css

all: $(CSS)

%.css: %.less
	lessc $< $@

clean:
	rm -rf $(CSS)
