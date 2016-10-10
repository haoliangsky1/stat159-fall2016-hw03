# This function takes in a lm model and returns the
#  residual sum of squares of the model
residual_sum_squares = function(model) {
  info = summary(model)
  residuals = info$residuals
  rss = sum(residuals ^ 2)
  return(rss)
}

# This function takes in a lm model and returns the
# total sum of squares of the model
total_sum_squares = function(model) {
  yMean = mean(model$model[[1]])
  tss = sum((model$model[[1]] - yMean)^2)
  return(tss)
}


# This function takes in a lm model and returns the
# r squared value of the model
r_squared = function(model) {
  r2 = 1 - residual_sum_squares(model)/total_sum_squares(model)
  return(r2)
}

# This function takes in a lm model and returns the
# F-statistics of the model
f_statistic = function(model) {
  p = length(coefficients(model)) - 1
  n = length(summary(model)$residuals)
  fNumerator = (total_sum_squares(model) - residual_sum_squares(model)) / p
  fDenominator = residual_sum_squares(model) / (n - p - 1)
  f = fNumerator / fDenominator
  return(f)
}
# This function takes in a lm model and returns the
# residual standard error of the model 
residual_std_error = function(model) {
  p = length(coefficients(model)) - 1
  n = length(summary(model)$residuals)
  rse = sqrt(residual_sum_squares(model)/(n - p - 1))
  return(rse)
}


