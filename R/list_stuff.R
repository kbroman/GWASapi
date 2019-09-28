#' List chromosomes
#'
#' List chromosomes
#'
#' @param url URL for GWAS catalog API
#'
#' @return Vector of chromosome numbers (as integers)
#'
#' @examples
#' chr <- list_chr()
#'
#' @export
list_chr <-
    function(url=gwascat_url())
{
    z <- query_gwascat("chromosomes", url=url)

    chr <- vapply(z[["_embedded"]]$chromosomes, "[[", "", "chromosome")
    sort(as.numeric(chr))
}

#' List studies
#'
#' List studies
#'
#' @param url The URL of the GWAS Catalog API
#' @param start First record to retrieve (starting at 0)
#' @param size Maximum number of results to retrieve
#'
#' @return Vector of study accessions
#'
#' @examples
#' first20 <- list_studies() # returns 20 studies
#' next20 <- list_studies(start=20) # returns the next 20 studies
#' first100 <- list_studies(size=100) # returns 100 studies
list_studies <-
    function(url=gwascat_url(), start=NULL, size=NULL)
{
    query_param <- NULL
    if(!is.null(start)) query_param$start <- start
    if(!is.null(size)) query_param$size <- size

    result <- query_gwascat("studies", query_param=query_param, url=url)

    # need to jump in one extra level
    result <- lapply(result[["_embedded"]]$studies, "[[", 1)

    # pull out just study_accession
    vapply(result, "[[", "", "study_accession")
}
