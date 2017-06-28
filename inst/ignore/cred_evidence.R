#' collected
#' 
#' @export
#' @param id (character) an event id. required.
#' @template curl
#' @template deets
#' @examples \dontrun{
#' # get some data
#' res <- cred_collected(date = '2016-08-27', source = 'twitter', config=verbose())
#' 
#' # get a single event id
#' cred_evidence(id = "06630d1f-3add-4478-a2c8-faa38728e0d8", config=verbose())
#' 
#' # get many events
#' foo <- lapply(res$events$id[1:5], cred_evidence)
#' }
cred_evidence <- function(id, ...) {
  url <- file.path(sprintf(cr_base(), "evidence"), "events", id, "evidence")
  crev_GET(url, ...)
}
