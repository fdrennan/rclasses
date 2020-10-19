
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

#' build_model_workbook
#' @importFrom openxlsx createWorkbook
#' @importFrom openxlsx addWorksheet
#' @importFrom openxlsx writeDataTable
#' @importFrom openxlsx insertPlot
#' @importFrom openxlsx saveWorkbook
#' @export build_model_workbook
build_model_workbook <- function(df) {
  wb <- createWorkbook()

  addWorksheet(wb, sheetName = 'cars')
  writeDataTable(wb, sheet = 'cars', x = df,
                 colNames = TRUE, rowNames = TRUE)

  addWorksheet(wb, sheetName = 'plot')
  insertPlot(wb, 'plot', xy=c("B", 16))

  saveWorkbook(wb, "model_output.xlsx", overwrite = TRUE)
}

# Libraries ---------------------------------------------------------------


library(magrittr)
library(forcats)
library(dplyr)
library(glue)
library(broom)
library(ggplot2)
library(openxlsx)


# 1. Create a function which converts columns to factors
# 2. Prevent NA's from being allowed in column
cars_input <- as_tibble(mtcars)

cars_input <- as_factor_dataframe(
  df = cars_input,
  columns = c('cyl', 'vs', 'am', 'gear', 'carb')
)

# Run Model ---------------------------------------------------------------
cars_model <- build_model(cars_input, y = 'carb', x = 'am')

# Make a Plot
p <-
  ggplot(cars_input, aes(x = mpg, y = wt)) +
  geom_point()

# Store Data --------------------------------------------------------------
excel_data <- list(
  data = cars_input,
  summary_data = tidy(cars_model),
  augment_lm = augment(cars_model)
)

build_model_workbook(df = excel_data)

