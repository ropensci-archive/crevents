#' @section Collected vs. Occurred:
#' \itemize{
#'  \item \strong{collected} is useful when you want to run a daily query to 
#'  fetch all Events for a given filter and you want to be sure you always 
#'  have all available Events
#'  \item \strong{collected} is useful when you want to reference a dataset 
#'  and be sure it never changes
#'  \item \strong{occurred} is useful when you want to retrieve Events that
#'  occurred at a particular time
#'  \item when using \strong{occurred} you should be aware that new Events 
#'  may be collected at any time in the future that occurred at a date 
#'  in the past
#' }
#' 
#' @section Pagination:
#' Pagination is not done in a typical fashion with query parameters 
#' like \code{page = 1} and \code{per_page=10}, but rather is done 
#' by requesting data by date. Unfortunately, each request can only 
#' include data for one date. 
#' 
#' @section Sources:
#' The following data sources can be passed to the \code{source} 
#' parameter:
#' \itemize{
#'  \item crossref_datacite
#'  \item facebook
#'  \item mendeley
#'  \item newsfeed
#'  \item reddit
#'  \item twitter
#'  \item wikipedia
#'  \item wordpressdotcom
#'  \item datacite_crossref
#' }
#' 
#' @section Async notes:
#' Async usees \pkg{curl} directly for doing async requests, while
#' non-async requests use \pkg{httr}, which depends on \pkg{curl}. 
#' 
#' Async requests return essentially the same results compared to 
#' non-async, although the order is different since the requests from
#' async are not given back in order given. Just be aware of this.
#' 
#' If you run into any problems with async let us know at 
#' \url{http://www.github.com/ropenscilabs/crevents/issues}
#' 
#' Note that for now, when doing async you can't pass on curl options - 
#' will try to add later.
