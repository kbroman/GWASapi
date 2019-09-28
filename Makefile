.PHONY: doc vignette

all: doc docs/GWAScat.html

# build package documentation
doc:
	R -e 'devtools::document()'

docs/GWAScat.html: vignettes/GWAScat.Rmd
	R -e "rmarkdown::render('$<')"
	mv $(<D)/$(@F) $@
