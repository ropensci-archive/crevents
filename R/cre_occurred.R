#' occurred
#' 
#' @export
#' @param date (character) a POSIX date. required.
#' @param source (character) alt-metric Source name. optional
#' @param work (character) a work DOI. optional
#' @template curl
#' @examples \dontrun{
#' # all works for a single date, across all sources
#' res <- cred_occurred(date = '2016-08-27', config=verbose())
#' 
#' # all works, for a single source on a single date
#' res <- cred_occurred(date = '2016-08-27', source = 'twitter', config=verbose())
#' 
#' # single work, on a single date, for a single source
#' res <- cred_occurred(date = '2016-08-27', work = '10.1107/S2056989016013359', source = 'twitter', config=verbose())
#' res$`message-type`
#' res$`total-events`
#' res$events
#' }
cred_occurred <- function(date, source = NULL, work = NULL, ...) {
  da_te <- file.path("occurred", date)
  sou_rce <- file.path("sources", source) %||% ""
  wo_rk <- file.path("works", work) %||% ""
  pth <- gsub("//", "/", gsub("/+$", "", file.path(da_te, wo_rk, sou_rce)))
  crev_GET(file.path(sprintf(cr_base(), "query.api"), pth, "events.json"), ...)
}
