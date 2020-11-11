# Libraries --------------------------------------------------------------
library(UnitTesting) # not source('R/code/')

# debug(as_factor_dataframe)
model_output <- as_factor_dataframe(
  df = model_results_df,
  columns = c('pred', 'actual')
)

model_table <- table(model_output)

model_summary <- confusionMatrix(model_table)

data.frame(model_results = model_summary$byClass)


# model_results
# Sensitivity             0.82051282
# Specificity             0.09090909
# Pos Pred Value          0.76190476
# Neg Pred Value          0.12500000
# Precision               0.76190476
# Recall                  0.82051282
# F1                      0.79012346
# Prevalence              0.78000000
# Detection Rate          0.64000000
# Detection Prevalence    0.84000000
# Balanced Accuracy       0.45571096

# actual
# pred   one zero
# one    2   14
# zero  20   64

# actual
# pred   zero one
# zero   64  20
# one    14   2