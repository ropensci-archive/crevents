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
