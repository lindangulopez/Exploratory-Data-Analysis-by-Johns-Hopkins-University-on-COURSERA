## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE, fig.path = "images/")
set.seed(10)

## ------------------------------------------------------------------------
## Simulate standard Normal random numbers
x <- rnorm(10)   
x

## ------------------------------------------------------------------------
x <- rnorm(10, 20, 2) 
x
summary(x)

## ------------------------------------------------------------------------
pnorm(2)

## ------------------------------------------------------------------------
set.seed(1)
rnorm(5)

## ------------------------------------------------------------------------
rnorm(5)

## ------------------------------------------------------------------------
set.seed(1)
rnorm(5)    ## Same as before

## ------------------------------------------------------------------------
rpois(10, 1)    ## Counts with a mean of 1
rpois(10, 2)    ## Counts with a mean of 2
rpois(10, 20)   ## Counts with a mean of 20

## ------------------------------------------------------------------------
## Always set your seed!
set.seed(20)             

## Simulate predictor variable
x <- rnorm(100)          

## Simulate the error term
e <- rnorm(100, 0, 2)    

## Compute the outcome via the model
y <- 0.5 + 2 * x + e     
summary(y)

## ----Linear Model--------------------------------------------------------
plot(x, y)

## ------------------------------------------------------------------------
set.seed(10)
x <- rbinom(100, 1, 0.5)
str(x)    ## 'x' is now 0s and 1s

## ----Linear Model Binary-------------------------------------------------
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
plot(x, y)

## ------------------------------------------------------------------------
set.seed(1)

## Simulate the predictor variable as before
x <- rnorm(100)    

## ----Poisson Log-Linear Model--------------------------------------------
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

## ------------------------------------------------------------------------
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)

## Doesn't have to be numbers
sample(letters, 5)    

## Do a random permutation
sample(1:10)          
sample(1:10)

## Sample w/replacement
sample(1:10, replace = TRUE)  

## ------------------------------------------------------------------------
library(datasets)
data(airquality)
head(airquality)

## ------------------------------------------------------------------------
set.seed(20)

## Create index vector
idx <- seq_len(nrow(airquality))    

## Sample from the index vector
samp <- sample(idx, 6)              
airquality[samp, ]

