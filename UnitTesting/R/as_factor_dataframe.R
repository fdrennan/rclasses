#' as_factor_dataframe
#' 
#' @description Converts columns in a dataframe to factors
#' @importFrom dplyr as_tibble
#' @importFrom dplyr mutate_at
#' @importFrom dplyr all_of
#' @importFrom magrittr  %>%
#' @importFrom magrittr not
#' @examples
#'
#' as_factor_dataframe(model_results_df, c('pred', 'actual'))
#'
#' @param df A dataframe to perform the operation on
#' @param columns The columns you wish to convert to factors
#' 
#' @family tutorial
#' 
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
