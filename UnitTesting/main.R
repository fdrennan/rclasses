# Libraries --------------------------------------------------------------
library(UnitTesting) # not source('R/code/')

# debug(as_factor_dataframe)
model_output <- as_factor_dataframe(
  df = model_results_df,
  columns = c('pred', 'actual')
)

# Create table of our model data
model_table <- table(model_output)

# Generate Summary Statistics
model_summary <- confusionMatrix(model_table)

# Display Model Results
data.frame(model_results = model_summary$byClass)

# model_results
# Sensitivity             0.09090909
# Specificity             0.82051282
# Pos Pred Value          0.12500000
# Neg Pred Value          0.76190476
# Precision               0.12500000
# Recall                  0.09090909
# F1                      0.10526316
# Prevalence              0.22000000
# Detection Rate          0.02000000
# Detection Prevalence    0.16000000