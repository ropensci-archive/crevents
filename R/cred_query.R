#' Query
#' 
#' @export
#' @param rows (character) the number of Events you want to retrieve per page. 
#' The default, and recommended, value is 10,000, which allows you to retrieve 
#' large numbers of Events quickly. There are typically between 10,000 and 
#' 100,000 Events collected per day.
#' @param filter (list) supply a filter that allows you to restrict results.
#' @param cursor (character) allows you to iterate through a search result set.
#' @param from_updated_date (character) a special filter that includes updated 
#' and deleted Events, to allow you to keep your dataset up to date.
#' @template curl
#' @examples \dontrun{
#' (res <- cred_query(rows = 10))
#' res$status
#' res$`message-type`
#' res$message$`total-results`
#' res$message$`items-per-page`
#' res$message$events
#' 
#' # filters
#' ## filter with source = reddit
#' (res <- cred_query(rows = 10, filter = list(source = "reddit")))
#' }
cred_query <- function(rows = 1000, filter = NULL, cursor = NULL, 
                       from_updated_date = NULL, ...) {
  
  args <- cmp(list(rows = rows, filter = filter_handler(filter), 
                   cursor = cursor, `from-updated-date` = from_updated_date))
  set_df(
    crev_GET(sprintf(cred_base(), "query"), args = args, ...)
  )
}
