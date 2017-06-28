#' collected
#' 
#' @export
#' @param date (character) a POSIX date. required.
#' @param dates (character) Two or more dates. required. dates must be of the 
#' form YYYY-MM-DD. You can easily create a sequence of dates like 
#' `seq(from = as.Date("2016-08-01"), to = as.Date("2016-10-18"), 
#' by = "day")`
#' @param source (character) alt-metric Source name. optional
#' @param work (character) a work DOI. optional
#' @param async (logical) do requests asynchronously. default: `FALSE`
#' @template curl
#' @template deets
#' @examples \dontrun{
#' # all works for a single date, across all sources
#' res <- cred_collected(date = '2016-08-27')
#' res$`message-type`
#' res$`total-events`
#' res$events
#' 
#' # all works, for a single source on a single date
#' res <- cred_collected(date = '2016-08-27', source = 'twitter')
#' res$`message-type`
#' res$`total-events`
#' res$events
#' 
#' # single work, on a single date, for all sources
#' res <- cred_collected(date = '2016-08-27', work='10.1107/S2056989016013359')
#' res$`message-type`
#' res$`total-events`
#' res$events
#' 
#' # single work, on a single date, for a single source
#' res <- cred_collected(date = '2016-08-27', work='10.1107/S2056989016013359',
#'   source = 'twitter')
#' res$`message-type`
#' res$`total-events`
#' res$events
#' 
#' # single work, with a range of dates, for a single source
#' dates <- seq(from = as.Date("2016-08-01"), to = as.Date("2016-10-18"), 
#'   by = "day")
#' res <- cred_collected_(dates, work = '10.1056/NEJMP1608511')
#' res[[1]]
#' res[[2]]
#' lapply(res, "[[", "events")
#' do.call("rbind.data.frame", lapply(res, "[[", "events"))
#' 
#' # use curl async
#' dates <- seq(from = as.Date("2016-08-01"), to = as.Date("2016-10-18"), 
#'   by = "day")
#' res_async <- cred_collected_(dates, work = '10.1056/NEJMP1608511', 
#'   async = TRUE)
#' res_async[[1]]
#' res_async[[2]]
#' lapply(res_async, "[[", "events")
#' do.call("rbind.data.frame", lapply(res_async, "[[", "events"))
#' }
cred_collected <- function(date, source = NULL, work = NULL, ...) {
  set_df(
    crev_GET(
      file.path(sprintf(cr_base(), "query.api"), 
                make_paths("collected", date, source, work), "events.json"), 
      ...
    )
  )
}

#' @export
#' @rdname cred_collected
cred_collected_ <- function(dates, source = NULL, work = NULL, 
                            async = FALSE, ...) {
  
  if (async) {
    crev_GET_async(
      file.path(sprintf(cr_base(), "query.api"), 
                make_paths("collected", dates, source, work), "events.json")
    )
  } else {
    lapply(dates, cred_collected, source = source, work = work, ...)
  }
}
