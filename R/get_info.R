#' Information about a study
#'
#' Information about a particular study
#'
#' @param study Study identifieer
#'
#' @return List of meta-data
#'
#' @export

info_study <-
    function(study)
{
    url <- gwasapi_oldurl()
    result <- query_gwasapi(glue("studies/{study}"), url=url)

    # strip off links
    result[!(names(result) %in% "_links")]
}
