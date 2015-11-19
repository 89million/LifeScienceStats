library(RCurl)
x <- getURL("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv")
population <- read.csv(text = x)
population <- unlist(population)
set.seed(1)
control <- sample(population, 12)
mean(control)
treatment <- sample(population, 12)
mean(treatment)
n <- 10000
null <- vector("numeric", n)
for (i in 1:n) {
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  null[i] <- mean(treatment) - mean(control)
}
obsdiff <- 3.02
mean(null >= obsdiff)

# exercise 5
x <- vector('numeric', 1000)
set.seed(1)
for (i in 1:1000) {
  x[i] <- mean(sample(population, 5))
}
xdiff <- x - mean(population)
table(abs(xdiff) > 1)

# exercise 6
x6 <- vector("numeric", 10000)
set.seed(1)
for (i in 1:10000){
  x6[i] <- mean(sample(population, 5))
}
x6diff <- x6 - mean(population)
table(abs(x6diff) > 1)

x <- ChickWeight
x <- reshape(x, idvar=c('Chick', 'Diet'), timevar="Time", direction='wide')
x <- na.omit(x)
sd(c(x$weight.4, 3000)) / sd(x$weight.4) # 100 times higher
mad(c(x$weight.4, 3000)) / mad(x$weight.4)
