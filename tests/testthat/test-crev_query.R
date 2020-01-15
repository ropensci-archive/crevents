context("crev_query: works")

test_that("crev_query", {
  skip_on_cran()
  vcr::use_cassette("crev_query", {
    aa <- crev_query(rows = 10)
  })

  expect_is(aa, "list")
  expect_equal(aa$status, "ok")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$message$`total-results`, "integer")
  expect_is(aa$message$`items-per-page`, "integer")
  expect_is(aa$message$events, "tbl_df")
  
  expect_equal(NROW(aa$message$events), 10)
})


context("crev_query: fails well")
test_that("crev_query fails well", {
  skip_on_cran()
  vcr::use_cassette("crev_query_fails", {
    expect_error(crev_query(rows = "asdf"), "For input string: \"asdf\"",
      class = "error")
    expect_error(crev_query(from_updated_date = "stuff"), 
      "Date format suplied to from-updated-date incorrect. Expected YYYY-MM-DD, got: stuff",
      class = "error")
    expect_error(crev_query(cursor = "asdfadf"), "Invalid cursor supplied",
      class = "error")
  })
})

# FIXME: this used to fail - but no I guess silently drops the param?
# expect_error(crev_query(from_updated_date = '2016-08-xx'),
#   "to from-updated-date incorrect"
# )
