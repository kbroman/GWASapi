#' Get associations for a given variant
#'
#' Get all associations for a given variant
#'
#' @param rsnum RS number for a variant
#' @param chr chromosome number if known
#' @param p_lower Lower bound on p-values
#' @param p_upper Upper bound of p-values
#'
#' @return Data frame with associations as rows
#'
#' @importFrom glue glue
#'
#' @examples
#' get_variant("rs2228603")
#' )get_variant("rs2228603", 19)

#' @export
get_variant <-
    function(rsnum, chr=NULL, p_lower=NULL, p_upper=NULL, url=gwascat_url())
{
    query <- glue("associations/{rsnum}")
    if(!is.null(chr)) query <- glue("chromosomes/{chr}/{query}")

    query_param <- NULL
    if(!is.null(p_lower)) query_param$p_lower <- p_lower
    if(!is.null(p_upper)) query_param$p_upper <- p_upper
    if(!is.null(p_lower) && !is.null(p_upper) && p_lower > p_upper) {
        stop("p_lower should be < p_upper")
    }

    result <- query_gwascat(query, query_param=query_param, url=url)
    list2df(result[["_embedded"]]$associations, exclude="_links")
}
