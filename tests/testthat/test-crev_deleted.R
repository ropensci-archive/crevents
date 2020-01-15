context("crev_deleted: works")

test_that("crev_deleted", {
  vcr::use_cassette("crev_deleted", {
    aa <- crev_deleted(rows = 3)
  })

  expect_is(aa, "list")
  expect_equal(aa$status, "ok")
  expect_is(aa$`message-type`, "character")
  expect_type(aa$message$`total-results`, "integer")
  expect_is(aa$message$`items-per-page`, "integer")
  expect_is(aa$message$events, "tbl_df")
  
  expect_equal(NROW(aa$message$events), 3)
})


context("crev_deleted: fails well")
test_that("crev_deleted fails well", {
  vcr::use_cassette("crev_deleted_fails", {
    expect_error(crev_deleted(rows = "asdf"), "For input string: \"asdf\"",
      class = "error")
    expect_error(crev_deleted(from_updated_date = "stuff"), 
      "Date format suplied to from-updated-date incorrect. Expected YYYY-MM-DD, got: stuff",
      class = "error")
    expect_error(crev_deleted(cursor = "asdfadf"), "Invalid cursor supplied",
      class = "error")
  })
})
