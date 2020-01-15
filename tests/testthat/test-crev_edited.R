context("crev_edited: works")

test_that("crev_edited", {
  vcr::use_cassette("crev_edited", {
    aa <- crev_edited(rows = 3)
  })

  expect_is(aa, "list")
  expect_equal(aa$status, "ok")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$message$`total-results`, "integer")
  expect_is(aa$message$`items-per-page`, "integer")
  expect_is(aa$message$events, "tbl_df")
  
  expect_equal(NROW(aa$message$events), 3)
})


context("crev_edited: fails well")
test_that("crev_edited fails well", {
  vcr::use_cassette("crev_edited_fails", {
    expect_error(crev_edited(rows = "asdf"), "For input string: \"asdf\"",
      class = "error")
    expect_error(crev_edited(from_updated_date = "stuff"), 
      "Date format suplied to from-updated-date incorrect. Expected YYYY-MM-DD, got: stuff",
      class = "error")
    expect_error(crev_edited(cursor = "asdfadf"), "Invalid cursor supplied",
      class = "error")
  })
})
