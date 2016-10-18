context("cred_collected")

test_that("cred_collected works - single date, across all sources", {
  skip_on_cran()

  aa <- cred_collected(date = '2016-08-27')

  expect_is(aa, "list")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$`total-events`, "integer")
  expect_is(aa$events, "tbl_df")
  expect_is(aa$previous, "character")
  expect_is(aa$`next`, "character")
})

test_that("cred_collected works - single source on a single date", {
  skip_on_cran()

  aa <- cred_collected(date = '2016-08-27', source = 'twitter')

  expect_is(aa, "list")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$`total-events`, "integer")
  expect_is(aa$events, "tbl_df")
  expect_is(aa$previous, "character")
  expect_is(aa$`next`, "character")
})

test_that("cred_collected works - single work, on a single date, for all sources", {
  skip_on_cran()

  aa <- cred_collected(date = '2016-08-27', work = '10.1107/S2056989016013359')

  expect_is(aa, "list")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$`total-events`, "integer")
  expect_is(aa$events, "tbl_df")
  expect_is(aa$previous, "character")
  expect_is(aa$`next`, "character")

  expect_equal(aa$`total-events`, 1)
  expect_equal(NROW(aa$events), 1)
})

test_that("cred_collected works - single work, on a single date, for a single source", {
  skip_on_cran()
  
  aa <- cred_collected(date = '2016-08-27', work = '10.1107/S2056989016013359',
                       source = 'twitter')
  
  expect_is(aa, "list")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$`total-events`, "integer")
  expect_is(aa$events, "tbl_df")
  expect_is(aa$previous, "character")
  expect_is(aa$`next`, "character")
  
  expect_equal(aa$`total-events`, 1)
  expect_equal(NROW(aa$events), 1)
})

test_that("cred_collected works - single work, with a range of dates, for a single source", {
  skip_on_cran()
  
  aa <- cred_collected_(date = c('2016-08-01', '2016-08-02'), 
                       work = '10.1056/NEJMP1608511')
  
  expect_is(aa, "list")
  expect_is(aa[[1]]$`message-type`, "character")
  expect_type(aa[[1]]$`total-events`, "integer")
  expect_is(aa[[1]]$events, "tbl_df")
  expect_is(aa[[1]]$previous, "character")
  expect_is(aa[[1]]$`next`, "character")
  
  expect_equal(length(aa), 2)
})

test_that("cred_collected fails well", {
  skip_on_cran()

  expect_error(cred_collected(), "argument \"date\" is missing")
  expect_warning(cred_collected(date = "stuff"), "NoSuchKey")
  expect_warning(cred_collected(date = "2016-10-18", source = "asdfadf"), "NoSuchKey")
  expect_warning(
    cred_collected(date = '2016-08-27', work = 'asdsd',
                  source = 'twitter'),
    "NoSuchKey"
  )
})
