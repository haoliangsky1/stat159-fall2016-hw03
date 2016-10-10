# Test for residual_sum_squares()
context('Test for residual_sum_squares()')
test_that('Residuals Sum of Squares: Non-negative', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(residual_sum_squares(fit), throws_error())
  # Test for non-negative
  expect_gte(residual_sum_squares(fit), 0)
  # Test for length
  expect_length(residual_sum_squares(fit), 1)
  # Test for type
  expect_type(residual_sum_squares(fit), 'double')
})
test_that('Residuals Sum of Squares: Same as BuiltIn--Relative Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  builtInRSS = sum(fit$residuals^2)
  err = abs(residual_sum_squares(fit) - builtInRSS)/residual_sum_squares(fit)
  expect_lte(err, 10^-3)
})
test_that('Residuals Sum of Squares: Same as BuiltIn--Absolute Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  builtInRSS = sum(fit$residuals^2)
  err = abs(residual_sum_squares(fit) - builtInRSS)
  expect_lte(err, 10^-3)
})

# Test for total_sum_squares()
context("Test for total_sum_squares()")
test_that('Total Sum of Squares: Non-negative', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(total_sum_squares(fit), throws_error())
  # Test for non-negative
  expect_gte(total_sum_squares(fit), 0)
  # Test for length
  expect_length(total_sum_squares(fit), 1)
  # Test for type
  expect_type(total_sum_squares(fit), 'double')
})
test_that('Total Sum of Squares: Same as BuiltIn--Relative Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  builtInTSS = sum((mtcars$mpg - mean(mtcars$mpg))^2)
  err = abs(total_sum_squares(fit) - builtInTSS)/total_sum_squares(fit)
  expect_lte(err, 10^-3)
})
test_that('Total Sum of Squares: Same as BuiltIn--Absolute Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  builtInTSS = sum((mtcars$mpg - mean(mtcars$mpg))^2)
  err = abs(total_sum_squares(fit) - builtInTSS)
  expect_lte(err, 10^-3)
})

# Test for r_squared()
context("Test for r_squared()")
test_that('R Square: Non-negative', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(r_squared(fit), throws_error())
  # Test for non-negative
  expect_gte(r_squared(fit), 0)
  # Test for length
  expect_length(r_squared(fit), 1)
  # Test for type
  expect_type(r_squared(fit), 'double')
})
test_that('R Square: Same as Built-in--Relative Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInR2 = summary(fit)$r.squared
  err = abs(r_squared(fit) - builtInR2)/r_squared(fit)
  expect_lte(err, 10^-3)
})
test_that('R Square: Same as Built-in--Absolute Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInR2 = summary(fit)$r.squared
  err = abs(r_squared(fit) - builtInR2)
  expect_lte(err, 10^-3)
})

# Test for f_statistic()
context('Test for f_statistic()')
test_that('F-Statistic: Non-negative', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(f_statistic(fit), throws_error())
  # Test for non-negative
  expect_gte(f_statistic(fit), 0)
  # Test for length
  expect_length(f_statistic(fit), 1)
  # Test for type
  expect_type(f_statistic(fit), 'double')
})
test_that('F-Statistic: Same as Built-in--Relative Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInF = summary(fit)$fstatistic[1]
  err = abs(f_statistic(fit) - builtInF)/f_statistic(fit)
  expect_lte(err, 10^-3)
})
test_that('F-Statistic: Same as Built-in--Absolute Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInF = summary(fit)$fstatistic[1]
  err = abs(f_statistic(fit) - builtInF)
  expect_lte(err, 10^-3)
})


# Test for residual_std_error()
context("Test for residual_std_error()")
test_that('Residual Standard Error: Non-negative', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(residual_std_error(fit), throws_error())
  # Test for non-negative
  expect_gte(residual_std_error(fit), 0)
  # Test for length
  expect_length(residual_std_error(fit), 1)
  # Test for type
  expect_type(residual_std_error(fit), 'double')
})
test_that('Residual Standard Error: Same as Built-in--Relative Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInRSE = summary(fit)$sigma
  err = abs(residual_std_error(fit) - builtInRSE)/residual_std_error(fit)
  expect_lte(err, 10^-3)
})
test_that('Residual Standard Error: Same as Built-in--Absolute Error', {
  fit = lm(mpg~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInRSE = summary(fit)$sigma
  err = abs(residual_std_error(fit) - builtInRSE)
  expect_lte(err, 10^-3)
})

