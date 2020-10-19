library(UnitTesting)
library(testthat)

test_that("as_factor_dataframe returns the correct value", {
  expect_equal(
    # Function from package
    {
      df <-
        data.frame(
          numbers = c('one', 'two', 'three', 'four')
        )

      as_factor_dataframe(df, 'numbers')$numbers
    },
    # Test result
    {
      factor(
        x = c('one', 'two', 'three', 'four'),
        levels = c("four", "one", "three", "two")
      )
    }
  )
})




