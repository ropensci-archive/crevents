#' Share email with Crossref in `.Renviron`
#' 
#' @noRd
get_email <- function() {
  email <- Sys.getenv("crossref_email")
  if (identical(email, "")) {
    NULL
  } else {
    val_email(email)
  }
}

#' Email checker
#'
#' It implementents the following regex stackoverflow solution
#' http://stackoverflow.com/a/25077140
#'
#' @param email email address (character string)
#'
#' @noRd
val_email <- function(email) {
  if (!grepl(email_regex(), email))
    stop("Email address seems not properly formatted - Please check your .Renviron!",
         call. = FALSE)
  return(email)
}

#' Email regex
#'
#' From \url{http://stackoverflow.com/a/25077140}
#'
#' @noRd
email_regex <-
  function()
    "^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})$"
