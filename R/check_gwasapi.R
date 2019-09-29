#' Check if the GWAS Catalog is live
#'
#' Check if the GWAS Catalog is live
#'
#' @return Character string.
#'
#' @export
#'
#' @examples
#' check_gwasapi()
check_gwasapi <-
    function()
{
    url<- gwasapi_url()
    listresult <- query_gwasapi("", url=url)

    if(length(listresult) == 1 && names(listresult)=="_links" &&
       length(listresult[["_links"]]) == 4 &&
       all(sort(names(listresult[["_links"]])) ==
           c("associations", "chromosomes", "studies", "traits"))) {
        return("Successfully connected to the NHGRI-EBI GWAS Catalog.")
    }

    stop("result not as expected:", listresult)
}
