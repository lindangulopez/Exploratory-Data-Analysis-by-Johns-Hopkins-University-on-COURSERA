## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE, fig.path = "images/parallel-")

## ------------------------------------------------------------------------
library(parallel)
detectCores()

## ------------------------------------------------------------------------
detectCores(logical = FALSE)  ## Same answer?

## ---- eval=FALSE---------------------------------------------------------
## r <- mclapply(1:10, function(i) {
##         Sys.sleep(10)  ## Do nothing for 10 seconds
## }, mc.cores = 10)      ## Split this job across 10 cores

## ----cache = TRUE--------------------------------------------------------
infiles <- dir("specdata", full.names = TRUE)
specdata <- lapply(infiles, read.csv)

## ------------------------------------------------------------------------
s <- system.time({
        mn <- lapply(specdata, function(df) {
                quantile(df$sulfate, 0.9, na.rm = TRUE)
        })
})
s

## ------------------------------------------------------------------------
s <- system.time({
        mn <- mclapply(specdata, function(df) {
                quantile(df$sulfate, 0.9, na.rm = TRUE)
        }, mc.cores = 24)
})
s

## ------------------------------------------------------------------------
s["user.self"]  ## Main process
s["user.child"] ## Child processes

## ------------------------------------------------------------------------
r <- mclapply(1:5, function(i) {
        if(i == 3L)
                stop("error in this process!")
        else
                return("success!")
}, mc.cores = 5)

## ------------------------------------------------------------------------
str(r)

## ------------------------------------------------------------------------
class(r[[3]])
inherits(r[[3]], "try-error")

## ------------------------------------------------------------------------
bad <- sapply(r, inherits, what = "try-error")
bad

## ------------------------------------------------------------------------
r.good <- r[!bad]
str(r.good)

## ------------------------------------------------------------------------
sulf <- specdata[[1]]$sulfate  ## Use the first monitor
sulf <- sulf[!is.na(sulf)]     ## Remove missing values
hist(sulf, xlab = expression("Sulfate PM (" * mu * g/m^3 * ")"))

## ------------------------------------------------------------------------
summary(sulf)

## ------------------------------------------------------------------------
set.seed(1)
med.boot <- replicate(5000, {
        xnew <- sample(sulf, replace = TRUE)
        median(xnew)
})

## ------------------------------------------------------------------------
quantile(med.boot, c(0.025, 0.975))

## ------------------------------------------------------------------------
r <- mclapply(1:5, function(i) {
        rnorm(3)
}, mc.cores = 5)
str(r)

## ------------------------------------------------------------------------
## Reproducible random numbers
RNGkind("L'Ecuyer-CMRG")
set.seed(1)
r <- mclapply(1:5, function(i) {
        rnorm(3)
}, mc.cores = 5)
str(r)

## ------------------------------------------------------------------------
RNGkind("L'Ecuyer-CMRG")
set.seed(1)
med.boot <- mclapply(1:5000, function(i) {
        xnew <- sample(sulf, replace = TRUE)
        median(xnew)
}, mc.cores = 24)
med.boot <- unlist(med.boot)  ## Collapse list into vector
quantile(med.boot, c(0.025, 0.975))

## ------------------------------------------------------------------------
library(boot)
b <- boot(sulf, function(x, i) median(x[i]), R = 5000, parallel = "multicore", ncpus = 24)
boot.ci(b, type = "perc")

## ------------------------------------------------------------------------
cl <- makeCluster(24)

## ---- error=TRUE---------------------------------------------------------
med.boot <- parLapply(cl, 1:5000, function(i) {
        xnew <- sample(sulf, replace = TRUE)
        median(xnew)
})

## ------------------------------------------------------------------------
clusterExport(cl, "sulf")

## ------------------------------------------------------------------------
med.boot <- parLapply(cl, 1:5000, function(i) {
        xnew <- sample(sulf, replace = TRUE)
        median(xnew)
})
med.boot <- unlist(med.boot)  ## Collapse list into vector
quantile(med.boot, c(0.025, 0.975))

## ------------------------------------------------------------------------
stopCluster(cl)

