context("cred_query: works")

test_that("cred_collected works - single date, across all sources", {
  skip_on_cran()

  aa <- cred_query(rows = 10)

  expect_is(aa, "list")
  expect_equal(aa$status, "ok")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$message$`total-results`, "integer")
  expect_is(aa$message$`items-per-page`, "integer")
  expect_is(aa$message$events, "tbl_df")
  
  expect_equal(NROW(aa$message$events), 10)
})


context("cred_query: fails well")
test_that("cred_query fails well", {
  skip_on_cran()

  expect_error(cred_query(rows = "asdf"), "For input string: \"asdf\"")
  expect_error(cred_query(filter = "stuff"), "Filter NA specified")
  expect_error(cred_query(cursor = "asdfadf"), "Invalid cursor supplied")

  # FIXME: this used to fail - but no I guess silently drops the param?
  # expect_error(cred_query(from_updated_date = '2016-08-xx'),
  #   "to from-updated-date incorrect"
  # )
})
