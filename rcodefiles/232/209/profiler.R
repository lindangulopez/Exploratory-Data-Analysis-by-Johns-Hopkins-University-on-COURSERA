## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE)

## ------------------------------------------------------------------------
system.time({
        n <- 1000
        r <- numeric(n)
        for(i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})

## ----eval=FALSE----------------------------------------------------------
## Rprof()    ## Turn on the profiler

## ----eval=FALSE----------------------------------------------------------
## Rprof(NULL)    ## Turn off the profiler

