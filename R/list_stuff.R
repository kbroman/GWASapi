#' List chromosomes
#'
#' List chromosomes
#'
#' @return Vector of chromosome numbers (as integers)
#'
#' @examples
#' chr <- list_chr()
#'
#' @seealso [list_studies()], [list_traits()]
#' @export
list_chr <-
    function()
{
    url <- gwasapi_url()
    z <- query_gwasapi("chromosomes", url=url)

    chr <- vapply(z[["_embedded"]]$chromosomes, "[[", "", "chromosome")
    sort(as.numeric(chr))
}

#' List studies
#'
#' List studies
#'
#' @param trait If provided, restrict search to studies that included the specified trait.
#' @param start First record to retrieve (starting at 0)
#' @param size Maximum number of results to retrieve
#'
#' @return Vector of study accessions
#'
#' @examples
#' first20 <- list_studies() # returns 20 studies
#' next20 <- list_studies(start=20) # returns the next 20 studies
#' first100 <- list_studies(size=100) # returns 100 studies
#' with_trait <- list_studies(trait="EFO_0001360")
#' @seealso [list_chr()], [list_traits()]
#' @export
list_studies <-
    function(trait=NULL, start=NULL, size=NULL)
{
    url <- gwasapi_url()
    query_param <- NULL
    if(!is.null(start)) query_param$start <- start
    if(!is.null(size)) query_param$size <- size

    query <- "studies"
    if(!is.null(trait)) { query <- glue("traits/{trait}/studies") }

    result <- query_gwasapi(query, query_param=query_param, url=url)

    result <- result[["_embedded"]]$studies
    # if you didn't specify the trait, need to jump in one extra level
    if(is.null(trait)) {
        result <- lapply(result, "[[", 1)
    }

    # pull out just study_accession
    vapply(result, "[[", "", "study_accession")
}

#' List traits
#'
#' List traits
#'
#' @param start First record to retrieve (starting at 0)
#' @param size Maximum number of results to retrieve
#'
#' @return Vector of trait IDs
#'
#' @examples
#' first20 <- list_traits() # first 20 traits
#' next20 <- list_traits(start=20) # the next 20 traits
#' first100 <- list_traits(size=100) # returns 100 traits
#' @export
#' @seealso [list_studies()], [list_chr()]
list_traits <-
    function(start=NULL, size=NULL)
{
    url <- gwasapi_url()
    query_param <- NULL
    if(!is.null(start)) query_param$start <- start
    if(!is.null(size)) query_param$size <- size

    result <- query_gwasapi("traits", query_param=query_param, url=url)

    # pull out just trait IDs
    vapply(result[["_embedded"]]$trait, "[[", "", "trait")
}
