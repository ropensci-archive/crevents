crev_GET_async <- function(x) {
  cr_multi_res <- vector("list", length(x))
  suc_cess <- function(res) cr_multi_res <<- c(cr_multi_res, list(res))
  crpool <- curl::new_pool()
  invisible(lapply(x, curl::curl_fetch_multi, done = suc_cess, pool = crpool))
  curl::multi_run(pool = crpool)
  remain <- curl::multi_list(crpool)      
  if (length(remain)) lapply(remain, curl::multi_cancel)
  cr_multi_res <- cmp(cr_multi_res)
  lapply(cr_multi_res, function(z) {
    tmp <- list(
      status_code = z$status_code,
      url = z$url,
      content = rawToChar(z$content)
    )
    if (handle_errors_async(tmp)) {
      set_df(jsonlite::fromJSON(tmp$content, TRUE, flatten = TRUE))
    } else {
      no_res_result()
    }
  })
}

handle_errors_async <- function(x) {
  if (x$status_code > 201) {
    html <- xml2::read_html(x$content)
    mssg <- paste(
      xml2::xml_text(xml2::xml_find_first(html, "//li[contains(text(),'Code:')]")),
      xml2::xml_text(xml2::xml_find_first(html, "//li[contains(text(),'Message:')]")),
      sep = "\n       "
    )
    warning(mssg, call. = FALSE)
    return(FALSE)
  } else {
    return(TRUE)
  }
}

####
# data <- list()
# success <- function(res){
#   cat("Request done! Status:", res$status, "\n")
#   data <<- c(data, list(res))
#   #multi_evn <- res
# }
# failure <- function(msg){
#   cat("Oh noes! Request failed!", msg, "\n")
# }
# curl_fetch_multi("http://httpbin.org/get", success)
# curl_fetch_multi("http://httpbin.org/status/418", success)
# curl_fetch_multi("https://urldoesnotexist.xyz", success)
# multi_run()
# str(data)
