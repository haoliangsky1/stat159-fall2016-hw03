#setwd("~/Desktop/Fall_2016/Stat159/stat159-fall2016-hw03")
#advertising = read.csv('data/Advertising.csv')
args = commandArgs(trailingOnly =TRUE)
advertising = read.csv(args[1], header = TRUE)

# TV
tvFit = lm(advertising$Sales~advertising$TV, data = advertising)
tvInfo = summary(tvFit)
png('images/scatterplot-tv-sales.png')
plot(x = advertising$TV, y = advertising$Sales, main = 'Regression of Sales on TV', xlab = 'TV', ylab = 'Sales')
abline(a = tvInfo$coefficients[1], b = tvInfo$coefficients[2], col = 'red')
dev.off()

# Radio
radioFit = lm(advertising$Sales~advertising$Radio, data = advertising)
radioInfo = summary(radioFit)
png('images/scatterplot-radio-sales.png')
plot(x = advertising$Radio, y = advertising$Sales, main = 'Regression of Sales on Radio', xlab = 'Radio', ylab = 'Sales')
abline(a = radioInfo$coefficients[1], b = radioInfo$coefficients[2], col = 'red')
dev.off()


# Newspaper
newspaperFit = lm(advertising$Sales~advertising$Newspaper, data = advertising)
newspaperInfo = summary(newspaperFit)
png('images/scatterplot-newspaper-sales.png')
plot(x = advertising$Newspaper, y = advertising$Sales, main = 'Regression of Sales on Newspaper', xlab = 'Newspaper', ylab = 'Sales')
abline(a = newspaperInfo$coefficients[1], b = newspaperInfo$coefficients[2], col = 'red')
dev.off()

# Together
multiFit = lm(Sales~TV+Radio+Newspaper, data = advertising)
multiInfo = summary(multiFit)

# Save the models
save(tvFit, radioFit, newspaperFit, multiFit, file = 'data/regression.RData')

png('images/residual-plot.png')
plot(multiFit, which = 1)
dev.off()

png('images/normal-qq-plot.png')
plot(multiFit, which = 2)
dev.off()

png('images/scale-location-plot.png')
plot(multiFit, which = 3)
dev.off()

