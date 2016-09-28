cr_base <- function() "http://%s.eventdata.crossref.org"

cmp <- function(x) Filter(Negate(is.null), x)

crev_GET <- function(x, ...) {
  out <- httr::GET(x, ...)
  httr::stop_for_status(out)
  tt <- httr::content(out, as = "text", encoding = "UTF-8")
  jsonlite::fromJSON(tt, TRUE, flatten = TRUE)
}

pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

concat_ids <- function(x){
  if (names(x) == "doi") {
    paste(sapply(x, function(y) gsub("/", "%2F", y)), collapse = ",")
  } else { 
    paste(x[[1]], collapse = ",") 
  }
}

metadf <- function(x){
  tmp <- x[!names(x) == 'data']
  tmp[vapply(tmp, is.null, logical(1))] <- NA
  data.frame(tmp, stringsAsFactors = FALSE)
}

`%||%` <- function(x, y) if (length(x)) x else y

set_df <- function(x) {
  x$events <- tibble::as_data_frame(x$events)
  return(x)
}
