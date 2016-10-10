# Read in the file being tested:
source('code/functions/regression-functions.R')

# Test for residual_sum_squares()
test_that('Residuals Sum of Squares: Non-negative', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(residual_sum_squares(fit), throws_error())
  # Test for non-negative
  expect_that(residual_sum_squares(fit) > 0, is_true())
})

# Test for total_sum_squares()
test_that('Total Sum of Squares: Non-negative', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(total_sum_squares(fit), throws_error())
  # Test for non-negative
  expect_that(total_sum_squares(fit) > 0, is_true())
})

# Test for r_squared()
test_that('R Square: Non-negative', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(r_squared(fit), throws_error())
  # Test for non-negative
  expect_that(r_squared(fit) >= 0, is_true())
})
test_that('R Square: Same as Built-in--Relative Error', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInR2 = summary(fit)$r.squared
  err = abs(r_squared(fit) - builtInR2)/r_squared(fit)
  expect_that(err < 10^-3, is_true())
})
test_that('R Square: Same as Built-in--Absolute Error', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInR2 = summary(fit)$r.squared
  err = abs(r_squared(fit) - builtInR2)
  expect_that(err < 10^-3, is_true())
})

# Test for f_statistic()
test_that('F-Statistic: Non-negative', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(f_statistic(fit), throws_error())
  # Test for non-negative
  expect_that(f_statistic(fit) >= 0, is_true())
})
test_that('F-Statistic: Same as Built-in--Relative Error', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInF = summary(fit)$r.squared
  err = abs(f_statistic(fit) - builtInR2)/f_statistic(fit)
  expect_that(err < 10^-3, is_true())
})
test_that('F-Statistic: Same as Built-in--Absolute Error', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInF = summary(fit)$r.squared
  err = abs(f_statistic(fit) - builtInR2)
  expect_that(err < 10^-3, is_true())
})


# Test for residual_std_error()
test_that('Residual Standard Error: Non-negative', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for ANY error
  expect_that(residual_std_error(fit), throws_error())
  # Test for non-negative
  expect_that(residual_std_error(fit) >= 0, is_true())
})
test_that('Residual Standard Error: Same as Built-in--Relative Error', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInR2 = summary(fit)$r.squared
  err = abs(residual_std_error(fit) - builtInR2)/residual_std_error(fit)
  expect_that(err < 10^-3, is_true())
})
test_that('Residual Standard Error: Same as Built-in--Absolute Error', {
  fit = lm(mpq~cyl+disp+hp+drat+wt, data = mtcars)
  # Test for relative error
  builtInR2 = summary(fit)$r.squared
  err = abs(residual_std_error(fit) - builtInR2)
  expect_that(err < 10^-3, is_true())
})

