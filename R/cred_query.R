#' Query Crossref Events data
#' 
#' @export
#' @param rows (character) the number of Events you want to retrieve per page. 
#' The default, and recommended, value is 10,000, which allows you to retrieve 
#' large numbers of Events quickly. There are typically between 10,000 and 
#' 100,000 Events collected per day. Default: 1000
#' @param cursor (character) allows you to iterate through a search result set.
#' @param from_updated_date,until_updated_date (character) from or until updated
#' date, as YYYY-MM-DD
#' @param from_occurred_date,until_occurred_date (character) from or until occurred
#' date, as YYYY-MM-DD
#' @param from_collected_date,until_collected_date (character) from or until updated
#' date, as YYYY-MM-DD
#' @param subj_id quoted URL or a DOI
#' @param subj_id_prefix DOI prefix like 10.5555
#' @param obj_id quoted URL or a DOI
#' @param obj_id_prefix DOI prefix like 10.5555
#' @param subj_id_domain domain of the subj_id e.g. en.wikipedia.org
#' @param obj_id_domain domain of the obj_url e.g. en.wikipedia.org
#' @param subj_url quoted full URL
#' @param obj_url quoted full URL
#' @param subj_url_domain domain of the optional subj.url, if present 
#'  e.g. en.wikipedia.org
#' @param obj_url_domain domain of the optional obj.url, if present 
#'  e.g. en.wikipedia.org
#' @param subj_alternative_id optional subj.alternative-id
#' @param obj_alternative_id optional obj.alternative-id
#' @param relation relation type ID
#' @param source source ID
#' @param facet a facet value, can be just the facet name, or facet name plus 
#' the limit (`*` or an integer)
#' @template curl
#' 
#' @section facets:
#' 
#' Remember that these totals don't refer to unique links necessarily, 
#' so you should be cautious about using the numbers for anything 
#' other than exploration.
#' 
#' - source: source ID
#' - relation-type: relation type ID
#' - obj-id.prefix: DOI prefix like 10.5555, if Object is a DOI
#' - subj-id.prefix: DOI prefix like 10.5555, if Subject is a DOI
#' - subj-id.domain: Domain of the subj_id URL
#' - obj-id.domain: Domain of the obj_id URL
#' - subj.url.domain: Domain of the subj.url URL. This may or may not be 
#' the same as the subj_id.
#' - obj.url.domain: Domain of the obj.url URL. This may or may not be 
#' the same as the obj_id.
#' 
#' @examples \dontrun{
#' (res <- crev_query(rows = 10))
#' res$status
#' res$`message-type`
#' res$message$`total-results`
#' res$message$`items-per-page`
#' res$message$events
#' res$message$events$obj.url
#' res$message$events$`subj.original-tweet-url`
#' 
#' # filter with source
#' crev_query(rows = 10, source = "reddit")
#' crev_query(rows = 10, source = "twitter")
#' 
#' # on the first of March 2017s
#' crev_query(rows=10, from_collected_date = "2017-03-01", 
#'   until_collected_date = "2017-03-01")
#'   
#' # in the month of March 2017
#' crev_query(rows=10, from_occurred_date = "2017-03-01", 
#'   until_occurred_date = "2017-03-31")
#'   
#' # in the month of March 2017
#' crev_query(rows=10, from_collected_date = "2017-03-01",
#'   until_collected_date = "2017-03-31")
#'   
#' # Up to ten Events for a DOI prefix
#' crev_query(rows = 10, obj_id_prefix = "10.1186")
#' 
#' # Up to ten events for a given DOI
#' crev_query(rows = 10, obj_id = "10.1186/s40536-017-0036-8")
#' 
#' # Use cursor
#' res <- crev_query(rows = 10)
#' crev_query(rows = 10, cursor = res$message$`next-cursor`)
#' 
#' # facet
#' crev_query(rows = 0, source = 'reddit', facet = "subj-id.domain:10")
#' crev_query(rows = 0, source = 'reddit', facet = "subj-id.domain:10")
#' crev_query(rows = 0, source = 'newsfeed', 
#'  subj_id_domain = "www.theguardian.com", facet = "obj-id.prefix:*")
#' }
crev_query <- function(rows = 1000L, cursor = NULL, source = NULL,
  from_updated_date = NULL, until_updated_date = NULL, 
  from_collected_date = NULL, until_collected_date = NULL, 
  from_occurred_date = NULL, until_occurred_date = NULL, obj_id = NULL, 
  obj_id_prefix = NULL, subj_id = NULL, subj_id_prefix = NULL, 
  subj_id_domain = NULL, obj_id_domain = NULL, subj_url = NULL, 
  obj_url = NULL, subj_url_domain = NULL, obj_url_domain = NULL, 
  subj_alternative_id = NULL, obj_alternative_id = NULL, 
  relation = NULL, facet = NULL, ...) {
  
  args <- cmp(list(rows = rows, cursor = cursor, source = source, 
    `from-updated-date` = from_updated_date, 
    `from-collected-date` = from_collected_date,
    `from-occurred-date` = from_occurred_date, 
    `until-updated-date` = until_updated_date, 
    `until-collected-date` = until_collected_date,
    `until-occurred-date` = until_occurred_date, 
    `obj-id` = obj_id, `obj-id.prefix` = obj_id_prefix,
    `subj-id` = subj_id, `subj-id.prefix` = subj_id_prefix, 
    `subj-id.domain` = subj_id_domain, `obj-id.domain` = obj_id_domain, 
    `subj.url` = subj_url, `obj.url` = obj_url, 
    `subj.url.domain` = subj_url_domain, `obj.url.domain` = obj_url_domain, 
    `subj.alternative-id` = subj_alternative_id, 
    `obj.alternative-id` = obj_alternative_id, relation = relation,
    facet = facet, mailto = get_email()))
  set_df(
    crev_GET(args = args, ...)
  )
}
