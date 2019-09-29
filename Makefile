.PHONY: doc vignette

all: doc docs/GWASapi.html

# build package documentation
doc:
	R -e 'devtools::document()'

# run tests
test:
	R -e 'devtools::test()'

docs/GWASapi.html: vignettes/GWASapi.Rmd
	R -e "rmarkdown::render('$<')"
	mv $(<D)/$(@F) $@
