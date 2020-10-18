# Functions ---------------------------------------------------------------

#' factor_conversion
#' @importFrom dplyr as_tibble
#' @importFrom dplyr mutate_at
#' @importFrom forcats as_factor
#' @importFrom magrittr not
#' @param cars_df A renaming of the mtcars dataset
#' @export factor_conversion
factor_conversion <- function(df = NULL, columns = NULL) {

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
      vars(columns),
      as_factor
    )

}



# Libraries ---------------------------------------------------------------


library(dplyr)
library(magrittr)
library(forcats)

cars <- as_tibble(mtcars)
cars <- factor_conversion(
  df = cars,
  columns = c('cyl', 'vs', 'am', 'gear', 'carb')
)

print(cars)

