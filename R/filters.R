filter_handler <- function(x){
  if (is.null(x)) {
    NULL
  } else {
    nn <- names(x)
    if (any(nn %in% other_filters)) {
      nn <- sapply(nn, function(x) {
        if (x %in% other_filters) {
          switch(x,
                 subj_id_prefix = 'subj-id.prefix',
                 obj_id_prefix = 'obj-id.prefix',
                 subj_id_domain = 'subj-id.domain',
                 obj_id_domain = 'obj-id.domain',
                 subj_url = 'subj.url',
                 obj_url = 'obj.url',
                 subj_url_domain = 'subj.url.domain',
                 obj_url_domain = 'obj.url.domain',
                 subj_alternative_id = 'subj.alternative-id',
                 obj_alternative_id = 'obj.alternative-id')
        } else {
          x
        }
      }, USE.NAMES = FALSE)
    }
    newnn <- gsub("_", "-", nn)
    names(x) <- newnn
    x <- sapply(x, asl)
    args <- list()
    for (i in seq_along(x)) {
      args[[i]] <- paste(names(x[i]), unname(x[i]), sep = ":")
    }
    paste0(args, collapse = ",")
  }
}

other_filters <- c('subj_id_prefix', 'obj_id_prefix', 'subj_id_domain', 
                   'obj_id_domain', 'subj_url', 'obj_url', 'subj_url_domain', 
                   'obj_url_domain', 'subj_alternative_id', 
                   'obj_alternative_id')

#' Filters information
#' 
#' @name filters
#' @details The filters:
#' \itemize{
#'  \item from-occurred-date - as YYYY-MM-DD
#'  \item until-occurred-date - as YYYY-MM-DD
#'  \item from-collected-date - as YYYY-MM-DD
#'  \item until-collected-date - as YYYY-MM-DD
#'  \item subj-id - quoted URL or a DOI
#'  \item obj-id - quoted URL or a DOI
#'  \item subj-id.prefix - DOI prefix like 10.5555
#'  \item obj-id.prefix - DOI prefix like 10.5555
#'  \item subj-id.domain - domain of the subj_id e.g. en.wikipedia.org
#'  \item obj-id.domain - domain of the obj_url e.g. en.wikipedia.org
#'  \item subj.url - quoted full URL
#'  \item obj.url - quoted full URL
#'  \item subj.url.domain - domain of the optional subj.url, if present 
#'  e.g. en.wikipedia.org
#'  \item obj.url.domain - domain of the optional obj.url, if present 
#'  e.g. en.wikipedia.org
#'  \item subj.alternative-id - optional subj.alternative-id
#'  \item obj.alternative-id - optional obj.alternative-id
#'  \item relation - relation type ID
#'  \item source - source ID
#' }
NULL
