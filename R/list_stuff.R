#' List chromosomes
#'
#' List chromosomes
#'
#' @param url URL for GWAS catalog API
#'
#' @return Vector of chromosome numbers (as integers)
#'
#' @examples
#' chr <- list_chromosomes()
#'
#' @export
list_chromosomes <-
    function(url=gwascat_url())
{
    z <- query_gwascat("chromosomes", url=url)

    chr <- vapply(z[["_embedded"]]$chromosomes, "[[", "", "chromosome")
    sort(as.numeric(chr))
}
