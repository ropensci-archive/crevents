#' Query Crossref Deleted Events data
#' 
#' @export
#' @inherit crev_query
#' @examples \dontrun{
#' (res <- crev_deleted(rows = 3))
#' res$status
#' res$`message-type`
#' res$message$`total-results`
#' res$message$`items-per-page`
#' res$message$events
#' res$message$events$obj_id
#' 
#' # filter with source
#' crev_deleted(rows = 3, source = "reddit")
#' crev_deleted(rows = 3, source = "twitter")
#' 
#' # on the first of March 2017s
#' crev_deleted(rows=3, from_collected_date = "2017-03-01", 
#'   until_collected_date = "2017-03-01")
#'   
#' # in the month of March 2017: occurred
#' crev_deleted(rows=3, from_occurred_date = "2017-03-01", 
#'   until_occurred_date = "2017-03-31")
#'   
#' # in the month of March 2017: collected
#' crev_deleted(rows=3, from_collected_date = "2017-03-01",
#'   until_collected_date = "2017-03-31")
#'   
#' # Up to ten Events for a DOI prefix
#' crev_deleted(rows = 3, obj_id_prefix = "10.1186")
#' 
#' # Up to ten events for a given DOI
#' crev_deleted(rows = 3, obj_id = "10.1186/s40536-017-0036-8")
#' 
#' # Use cursor
#' res <- crev_deleted(rows = 3)
#' crev_deleted(rows = 3, cursor = res$message$`next-cursor`)
#' 
#' # facet
#' crev_deleted(rows = 0, source = 'reddit', facet = "subj-id.domain:10")
#' crev_deleted(rows = 0, source = 'reddit', facet = "subj-id.domain:10")
#' crev_deleted(rows = 0, source = 'newsfeed', 
#'  subj_id_domain = "www.theguardian.com", facet = "obj-id.prefix:*")
#' }
crev_deleted <- fxn_factory('events/deleted')
