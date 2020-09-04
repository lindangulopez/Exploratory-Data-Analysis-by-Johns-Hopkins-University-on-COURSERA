## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE, 
                      error = TRUE, warning = TRUE, message = TRUE)
set.seed(1)

## ------------------------------------------------------------------------
log(-1)

## ------------------------------------------------------------------------
printmessage <- function(x) {
        if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)        
}

## ------------------------------------------------------------------------
printmessage(1)

## ------------------------------------------------------------------------
printmessage(NA)

## ------------------------------------------------------------------------
printmessage2 <- function(x) {
        if(is.na(x))
                print("x is a missing value!")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

## ------------------------------------------------------------------------
printmessage2(NA)

## ------------------------------------------------------------------------
x <- log(c(-1, 2))
printmessage2(x)

## ------------------------------------------------------------------------
printmessage3 <- function(x) {
        if(length(x) > 1L)
                stop("'x' has length > 1")
        if(is.na(x))
                print("x is a missing value!")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

## ------------------------------------------------------------------------
printmessage3(1:2)

## ------------------------------------------------------------------------
printmessage4 <- Vectorize(printmessage2)
out <- printmessage4(c(-1, 2))

