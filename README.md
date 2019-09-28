## GWAScat - R package to connect to the [NHGRI-EBI GWAS Catalog of Summary Statistics](https://www.ebi.ac.uk/gwas)


[![Build Status](https://travis-ci.org/rqtl/GWAScat.svg?branch=master)](https://travis-ci.org/rqtl/GWAScat)

---

See the [API documentation](https://www.ebi.ac.uk/gwas/summary-statistics/docs/)
as well as [Pjotr Prins](http://thebird.nl/)'s [documentation at
github](https://github.com/pjotrp/racket-summary-stats).

---

### Installation

You can install GWAScat from
[GitHub](https://github.com/rqtl/GWAScat).

You first need to install the
[devtools](https://github.com/hadley/devtools).

    install.packages("devtools")

Then use `devtools::install_github()` to install GWAScat.

    library(devtools)
    install_github("rqtl/GWAScat")

---

### Usage

For an understanding of the
[NHGRI-EBI GWAS Catalog of Summary Statistics](https://www.ebi.ac.uk/gwas)
API, see [its documentation](https://www.ebi.ac.uk/gwas/summary-statistics/docs/),
as well as [Pjotr Prins](http://thebird.nl/)'s [documentation at
github](https://github.com/pjotrp/racket-summary-stats)

The GWAScat package has a set of functions for connecting to the
GWAS Catalog:

- `check_gwascat()` - Check connection.


For further examples, see the [online
vignette](https://kbroman.org/GWAScat/GWAScat.html), which is also
available from within R:

```r
vignette("GWAScat")
```

Note that we enforce a delay between calls to the API, to slow
repeated calls within a loop. The default is 1 sec; it can be
controlled with the option `GWAScat_delay`. For example, to make the
delay 0.5 seconds, use:

```r
options(GWAScat_delay=0.5)
```

---

### License

[GWAScat](https://github.com/rqtl/GWAScat) is released under the
[MIT license](LICENSE.md).
