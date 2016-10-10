# Include all library() calls to the packages 
# that are used in the project
sink('session-info.txt')
print('Packages used for this project:')
library(stats)
library(base)
library(utils)
library(grDevices)
library(graphics)
library(testthat)
print('R Session Infomation')
sessionInfo()
sink()
