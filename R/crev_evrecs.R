#' Parse Crossref Events evidence records
#' 
#' @export
#' @param x (character) one or more urls for evidence records
#' @param ... curl options passed through to [crul::verb-GET]
#' @return an unnamed list of results, one for each URL passed in.
#' @details this function doesn't parse results other than converting
#' JSON to an R list, because the data is deeply nested, so coercing
#' to data.frame's is an exercise left to the user
#' 
#' From [crev_query()] you will get  urls like
#' "https://evidence.eventdata.crossref.org/evidence" in the
#' `$message$events$evidence_record` slot of results. These links
#' hold JSOn data with the evidence record details for the record. This
#' function simply retrieves that JSON and parses to a list
#' @examples \dontrun{
#' res <- crev_query(rows = 4)
#' recs <- res$message$events$evidence_record
#' crev_evrecs(recs[1])
#' crev_evrecs(recs)
#' }
crev_evrecs <- function(x, ...) {
  # FIXME: assert that inputs are URLs with pattern
  assert(x, "character")
  lapply(x, crev_evrecs_one, ...)
}

crev_evrecs_one <- function(x, ...) {
  con <- crul::HttpClient$new(
    url = x,
    opts = list(useragent = crevents_ua())
  )
  res <- con$get(...)
  res$raise_for_status()
  jsonlite::fromJSON(res$parse("UTF-8"), FALSE)
}
