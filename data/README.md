This folder contains the data used to generate the analysis and the data output of the analysis.

The raw data of this project is greatly contributed by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. Without their kindly data opening, none of the analysis would be possible. This data set *Advertising.csv* could be found [here](http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv).


*eda-output.txt* is a text file containing the summary statistics of all the variables, including *TV*, *Radio*, *Newspaper* and *Sales*, and the correlation matrix between the variables.


*correlation-matrix.RData* is an R's binary formate file containing the matrix of correlations among all variables.


*regression.RData* is an R's binary format file containning the regression object obtained when running *regression-script.R*, including multiple linear regression models on each of the variables and one multivariant regression model on the three of them.