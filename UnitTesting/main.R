
# References --------------------------------------------------------------

## https://medium.com/@JeffLombardJr/opinion-when-should-i-write-unit-tests-164b245bffbc

# Functions ---------------------------------------------------------------

#' as_factor_dataframe
#' @importFrom dplyr as_tibble
#' @importFrom dplyr mutate_at
#' @importFrom forcats as_factor
#' @importFrom magrittr not
#' @param cars_df A renaming of the mtcars dataset
#' @export as_factor_dataframe
as_factor_dataframe <- function(df = NULL, columns = NULL) {

  df_check <- is.data.frame(df)
  if (not(df_check)) {
    stop('Argument df is not a dataframe')
  }

  column_check <- is.character(columns)
  if (not(column_check)) {
    stop('Argument columns is not a character vector')
  }

  df %>%
    mutate_at(
      all_of(columns),
      as.factor
    )

}

#' build_model
#' @param df A renaming of the mtcars dataset
#' @param x Predictor column, character
#' @param y Response column, character
#' @export build_model
build_model <- function(df = NULL, x = NULL , y = NULL) {
  model_form <- as.formula(glue('{y} ~ {x}'))
  glm(model_form, data = df, family=binomial(link="logit"))
}

# Libraries ---------------------------------------------------------------


library(nycflights13)
library(dplyr)
library(magrittr)
library(forcats)
library(glue)

# 1. Create a function which converts columns to factors
# 2. Prevent NA's from being allowed in column


cars <- as_tibble(mtcars)
# cars['am'][1:5,][[1]] = NA
cars <- as_factor_dataframe(df = cars, columns = c('cyl', 'vs', 'am', 'gear', 'carb'))

# Run Model ---------------------------------------------------------------
cars_model <- build_model(cars, y = 'carb', x = 'am')
print(summary(cars_model))


