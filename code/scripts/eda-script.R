#setwd("~/Desktop/Fall_2016/Stat159/stat159-fall2016-hw03")
#advertising = read.csv('data/Advertising.csv', header=T)
args = commandArgs(trailingOnly =TRUE)
advertising = read.csv(args[1], header = T)
advertising = advertising[,2:5]

# Compute the summary statistics
getSummary = function(data, name){
  current = 0
  if (name == 'TV') {
    current = data$TV
  } else if (name == 'Radio') {
    current = data$Radio
  }  else if (name == 'Newspaper') {
    current = data$Newspaper
  } else if (name == 'Sales') {
    current = data$Sales
  }
  currentSummary = summary(current)
  currentSummary = c(currentSummary, var(current), sd(current))
  names(currentSummary)[7] = 'Variance'
  names(currentSummary)[8] = 'Standard Deviation'
  return(currentSummary)
}

tvSummary = getSummary(advertising, 'TV')
radioSummary = getSummary(advertising, 'Radio')
newspaperSummary = getSummary(advertising, 'Newspaper')
saleSummary = getSummary(advertising, 'Sales')

# Overall summary statistics table
overallSummary = matrix(ncol = 8, nrow = 4)
overallSummary[1,] = tvSummary
overallSummary[2,] = radioSummary
overallSummary[3,] = newspaperSummary
overallSummary[4,] = saleSummary
rownames(overallSummary) = c('TV', 'Radio', 'Newspaper', 'Sales')
colnames(overallSummary) = names(tvSummary)

# Correlation matrix
correlationMatrix = cor(advertising)

# Data Output
sink('data/eda-output.txt')

overallSummary

correlationMatrix
sink()

save(correlationMatrix, file = 'data/correlation-matrix.RData')
save(overallSummary, file = 'data/overallSummary.RData')
# Images Output
# TV
png('images/histogram-tv.png')
hist(advertising$TV, main = 'Histogram of TV', xlab = 'TV')
dev.off()

# Radio
png('images/histogram-radio.png')
hist(advertising$Radio, main = 'Histogram of Radio', xlab = 'Radio')
dev.off()

# Newspaper
png('images/histogram-newspaper.png')
hist(advertising$Newspaper, main = 'Histogram of Newspaper', xlab = 'Newspaper')
dev.off()

# Sales
png('images/histogram-sales.png')
hist(advertising$Sales, main = 'Histogram of Sales', xlab = 'Sales')
dev.off()

#Scatterplot Matrix
png('images/scatterplot-matrix.png')
pairs(~TV+Radio+Newspaper+Sales, data = advertising, main = 'Simple Scatterplot Matrix', cex = 0.8)
dev.off()

