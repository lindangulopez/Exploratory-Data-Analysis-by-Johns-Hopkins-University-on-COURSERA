## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE, error = TRUE)

## ------------------------------------------------------------------------
f <- function() {
        ## This is an empty function
}
## Functions have their own class
class(f)  
## Execute this function
f()       

## ------------------------------------------------------------------------
f <- function() {
        cat("Hello, world!\n")
}
f()

## ------------------------------------------------------------------------
f <- function(num) {
        for(i in seq_len(num)) {
                cat("Hello, world!\n")
        }
}
f(3)

## ------------------------------------------------------------------------
f <- function(num) {
        hello <- "Hello, world!\n"
        for(i in seq_len(num)) {
                cat(hello)
        }
        chars <- nchar(hello) * num
        chars
}
meaningoflife <- f(3)
print(meaningoflife)

## ------------------------------------------------------------------------
f()

## ------------------------------------------------------------------------
f <- function(num = 1) {
        hello <- "Hello, world!\n"
        for(i in seq_len(num)) {
                cat(hello)
        }
        chars <- nchar(hello) * num
        chars
}
f()    ## Use default value for 'num'
f(2)   ## Use user-specified value

## ------------------------------------------------------------------------
f(num = 2)

## ------------------------------------------------------------------------
str(rnorm)
mydata <- rnorm(100, 2, 1)              ## Generate some data

## ------------------------------------------------------------------------
## Positional match first argument, default for 'na.rm'
sd(mydata)                     
## Specify 'x' argument by name, default for 'na.rm'
sd(x = mydata)                 
## Specify both arguments by name
sd(x = mydata, na.rm = FALSE)  

## ------------------------------------------------------------------------
## Specify both arguments by name
sd(na.rm = FALSE, x = mydata)     

## ------------------------------------------------------------------------
sd(na.rm = FALSE, mydata)

## ------------------------------------------------------------------------
args(lm)

## ------------------------------------------------------------------------
f <- function(a, b) {
        a^2
} 
f(2)

## ------------------------------------------------------------------------
f <- function(a, b) {
        print(a)
        print(b)
}
f(45)

## ------------------------------------------------------------------------
mean

## ------------------------------------------------------------------------
args(paste)
args(cat)

## ------------------------------------------------------------------------
args(paste)

## ------------------------------------------------------------------------
paste("a", "b", sep = ":")

## ------------------------------------------------------------------------
paste("a", "b", se = ":")

