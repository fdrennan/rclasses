# Libraries ---------------------------------------------------------------
library(UnitTesting)
library(caret)

model_output <- as_factor_dataframe(
  df = model_results_df,
  columns = c('pred', 'actual')
)

model_table <- table(model_output)

model_summary <- confusionMatrix(model_table)

model_summary


