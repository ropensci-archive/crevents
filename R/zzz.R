cred_base <- function() "https://api.eventdata.crossref.org"

cmp <- function(x) Filter(Negate(is.null), x)

crevents_ua <- function() {
  versions <- c(
    paste0("r-curl/", utils::packageVersion("curl")),
    paste0("crul/", utils::packageVersion("crul")),
    sprintf("rOpenSci(crevents/%s)", utils::packageVersion("crevents")))
  paste0(versions, collapse = " ")
}

eg_data <- function(x) {
  switch(x,
    'events' = dat_crev_query,
    'events/edited' = dat_crev_edited,
    'events/deleted' = dat_crev_deleted
  )
}

crev_GET <- function(endpoint, args, ...) {
  if (identical(Sys.getenv("NOT_CRAN"), "true")) return(eg_data(endpoint))
  cli <- crul::HttpClient$new(
    url = cred_base(),
    opts = list(useragent = crevents_ua())
  )
  temp <- cli$get(file.path("v1", endpoint), query = args, ...)
  if (temp$status_code > 201) {
    tt <- temp$parse("UTF-8")
    res <- jsonlite::fromJSON(tt, FALSE)
    stat <- temp$status_http()
    stop(sprintf('(%s) %s\n  %s', stat$status_code, stat$message, res$message[[1]]$message))
  }
  x <- temp$parse("UTF-8")
  jsonlite::fromJSON(x, TRUE, flatten = TRUE)
}

no_res_result <- function(x) {
  list(
    `message-type` = NULL,
    `total-events` = NULL,
    events = tibble::data_frame(),
    `previous` = NULL,
    `next` = NULL
  )  
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

asl <- function(z) {
  if (is.logical(z) || tolower(z) == "true" || tolower(z) == "false") {
    if (z) {
      return('true')
    } else {
      return('false')
    }
  } else {
    return(z)
  }
}

`%||%` <- function(x, y) if (length(x)) x else y

set_df <- function(x) {
  if (NROW(x) != 0) {
    x$message$events <- tibble::as_tibble(x$message$events)
  }
  return(x)
}

make_paths <- function(type, date, source, work) {
  da_te <- file.path(type, date)
  sou_rce <- file.path("sources", source) %||% ""
  wo_rk <- file.path("works", work) %||% ""
  gsub("//", "/", gsub("/+$", "", file.path(da_te, wo_rk, sou_rce)))
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
        paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
