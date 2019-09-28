#' List chromosomes
#'
#' List chromosomes
#'
#' @param url URL for GWAS catalog API
#'
#' @return Vector of character strings with chromosome numbers
#'
#' @examples
#' chr <- list_chromosomes()
#'
#' @export
list_chromosomes <-
    function(url=gwascat_url())
{
    z <- query_gwascat("chromosomes", url=url)

    vapply(z[["_embedded"]]$chromosomes, "[[", "", "chromosome")
}
