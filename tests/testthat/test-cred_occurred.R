context("cred_occurred")

test_that("cred_occurred works - single date, across all sources", {
  skip_on_cran()
  
  aa <- cred_occurred(date = '2016-08-27')
  
  expect_is(aa, "list")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$`total-events`, "integer")
  expect_is(aa$events, "tbl_df")
  expect_is(aa$previous, "character")
  expect_is(aa$`next`, "character")
})

test_that("cred_occurred works - with source parameter", {
  skip_on_cran()
  
  aa <- cred_occurred(date = '2016-08-27', source = 'twitter')
  
  expect_is(aa, "list")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$`total-events`, "integer")
  expect_is(aa$events, "tbl_df")
  expect_is(aa$previous, "character")
  expect_is(aa$`next`, "character")
})

test_that("cred_occurred works - single work, on a single date, for a single source", {
  skip_on_cran()
  
  aa <- cred_occurred(date = '2016-08-27', work = '10.1107/S2056989016013359',
                      source = 'twitter')
  
  expect_is(aa, "list")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$`total-events`, "integer")
  expect_is(aa$events, "tbl_df")
  expect_is(aa$previous, "character")
  expect_is(aa$`next`, "character")
  
  expect_equal(NROW(aa$events), 1)
})

test_that("cred_occurred fails well", {
  skip_on_cran()
  
  expect_error(cred_occurred(), "argument \"date\" is missing")
  expect_warning(cred_occurred(date = "stuff"), "NoSuchKey")
  expect_warning(cred_occurred(date = "2016-10-18", source = "asdfadf"), "NoSuchKey")
  expect_warning(
    cred_occurred(date = '2016-08-27', work = 'asdsd',
                  source = 'twitter'), 
    "NoSuchKey"
  )
})
