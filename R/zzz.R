cr_base <- function() "http://%s.eventdata.crossref.org"

cmp <- function(x) Filter(Negate(is.null), x)

crevents_ua <- function() {
  versions <- c(paste0("r-curl/", utils::packageVersion("curl")),
                paste0("httr/", utils::packageVersion("httr")),
                sprintf("rOpenSci(crevents/%s)", utils::packageVersion("crevents")))
  paste0(versions, collapse = " ")
}

make_cr_ua <- function() {
  c(
    httr::user_agent(crevents_ua()),
    httr::add_headers(`X-USER-AGENT` = crevents_ua())
  )
}

crev_GET <- function(x, ...) {
  out <- httr::GET(x, make_cr_ua(), ...)
  if (handle_errors(out)) {
    tt <- httr::content(out, as = "text", encoding = "UTF-8")
    jsonlite::fromJSON(tt, TRUE, flatten = TRUE)
  } else {
    no_res_result()
  }
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

handle_errors <- function(x) {
  if (x$status_code > 201) {
    tmp <- httr::content(x, as = "text", encoding = "UTF-8")
    html <- xml2::read_html(tmp)
    mssg <- paste(
      xml2::xml_text(xml2::xml_find_first(html, "//li[contains(text(),'Code:')]")),
      xml2::xml_text(xml2::xml_find_first(html, "//li[contains(text(),'Message:')]")),
      sep = "\n       "
    )
    warning(mssg, call. = FALSE)
    return(FALSE)
  } else {
    return(TRUE)
  }
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
  if (NROW(x) != 0) {
    x$events <- tibble::as_data_frame(x$events)
  }
  return(x)
}

make_paths <- function(type, date, source, work) {
  da_te <- file.path(type, date)
  sou_rce <- file.path("sources", source) %||% ""
  wo_rk <- file.path("works", work) %||% ""
  gsub("//", "/", gsub("/+$", "", file.path(da_te, wo_rk, sou_rce)))
}

