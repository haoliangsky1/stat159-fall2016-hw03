This folder has the *functions* folder for *regression-functjions.R*, the *scripts* folder for *eda-script.R*, *regression-script.R* and *sessoin-info-script.R*, the *tests* folder for *test-regression.R* and the *test-that.r* script.


Specifically, *functions* contains the **regression-functions.R** script. The files has the following functions:
* *residual_sum_squares()* calculates the Residual Sum of Squares of any given linear regression model.
* *total_sum_squares()* calculates the Total Sum of Squares of any given linear regression model.
* *r_squared()* calculates the R-squared (coefficient of determination) of any given linear regression model.
* *f_statistic()* calculates the F-Statistic of any given linear regression model.
* *residual_std_error()* calculates the Residual Standard Error of any given linear model.


The *scripts* folder contains three R scripts, including:
* *eda-script.R*: the script that reads in the *Advertising.csv* data set and computes the summary statistics, histograms for all the variables(*TV*, *Radio*, *Newspaper*, and *Sales*), matrix of correlations among variables, and scatterplot matrix (pairwise scatterplots).
* *regression-script.R*: the script that reads in the *Advertising.csv* data set, computes multiple regression objects as well as the summary of such regression objects, and produces the three diagnostics plots, including *residual-plot.png*, *scale-location-plot.png* and *normal-qq-plot.png*
* *session-info-script.R*: the script that includes *library()* calls to all the packages used for this project as well as the output of the function *sessionInfo()*.


The *test-regression.R* folder has the *test-regression.R* script, which contains the unit test for functions in *regression-functions.R*.


Lastly, the *test-that.R* script runs the unit tests in *test-regression.R* for functions in *regression-functions.R*.
