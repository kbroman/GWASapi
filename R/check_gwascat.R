#' Check if the GWAS Catalog is live
#'
#' Check if the GWAS Catalog is live
#'
#' @param url URL for the GWAS Catalog
#'
#' @return Character string.
#'
#' @export
#'
#' @examples
#' check_gwascat()
check_gwascat <-
    function(url=gwascat_url())
{
    listresult <- query_gwascat("profile", url=url)

    if(length(listresult) == 1 && names(listresult)=="_links" &&
       length(listresult[["_links"]]) == 5 &&
       all(sort(names(listresult[["_links"]])) ==
           c("associations", "efoTraits", "self",
             "singleNucleotidePolymorphisms", "studies"))) {
        return("The GWAS Catalog says hello.")
    }

    stop("result not as expected:", listresult)
}
