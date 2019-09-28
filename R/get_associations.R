#' Get associations for a given variant
#'
#' Get all associations for a given variant
#'
#' @param rsnum RS number for a variant
#' @param chr chromosome number if known
#' @param p_lower Lower bound on p-values
#' @param p_upper Upper bound of p-values
#' @param url The URL of the GWAS Catalog API
#' @param start First record to retrieve (starting at 0)
#' @param size Maximum number of results to retrieve
#'
#' @return Data frame with associations as rows
#'
#' @importFrom glue glue
#'
#' @examples
#' # get associations for a given variant
#' get_variant("rs2228603")
#' # use information about the chromosome it's on
#' get_variant("rs2228603", 19)
#' # return just the associations with P < 1e-8
#' get_variant("rs2228603", 19, p_upper=1e-8)
#' @export
get_variant <-
    function(rsnum, chr=NULL, p_lower=NULL, p_upper=NULL,
             url=gwascat_url(), start=NULL, size=NULL)
{
    query <- glue("associations/{rsnum}")
    if(!is.null(chr)) query <- glue("chromosomes/{chr}/{query}")

    query_param <- NULL
    if(!is.null(p_lower)) query_param$p_lower <- p_lower
    if(!is.null(p_upper)) query_param$p_upper <- p_upper
    if(!is.null(p_lower) && !is.null(p_upper) && p_lower > p_upper) {
        stop("p_lower should be < p_upper")
    }
    if(!is.null(start)) query_param$start <- start
    if(!is.null(size)) query_param$size <- size

    result <- query_gwascat(query, query_param=query_param, url=url)
    list2df(result[["_embedded"]]$associations, exclude="_links")
}
