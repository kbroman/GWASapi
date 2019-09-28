# convert a list of lists into a data frame
# where the inner lists are the rows
#
# exclude is a vector of columns to exclude
list2df <-
    function(x, exclude=NULL, stringsAsFactors=FALSE)
{
    nam <- unique(unlist(lapply(x, names)))
    if(!is.null(exclude)) {
        nam <- nam[!(nam %in% exclude)]
    }

    output <- lapply(nam, function(a) unlist(lapply(x, function(xx) {
                                          if(a %in% names(xx) && !is.null(xx[[a]]))
                                              return(xx[[a]])
                                          NA })))
    names(output) <- nam

    as.data.frame(output, stringsAsFactors=stringsAsFactors)
}
