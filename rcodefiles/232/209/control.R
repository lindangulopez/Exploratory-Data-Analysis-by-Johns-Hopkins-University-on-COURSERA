## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE)

## ----prompt=FALSE--------------------------------------------------------
## Generate a uniform random number
x <- runif(1, 0, 10)  
if(x > 3) {
        y <- 10
} else {
        y <- 0
}

## ----prompt=FALSE--------------------------------------------------------
y <- if(x > 3) {
        10
} else { 
        0
}

## ------------------------------------------------------------------------
for(i in 1:10) {
        print(i)
}

## ------------------------------------------------------------------------
x <- c("a", "b", "c", "d")

for(i in 1:4) {
        ## Print out each element of 'x'
        print(x[i])  
}

## ------------------------------------------------------------------------
## Generate a sequence based on length of 'x'
for(i in seq_along(x)) {   
        print(x[i])
}

## ------------------------------------------------------------------------
for(letter in x) {
        print(letter)
}

## ------------------------------------------------------------------------
for(i in 1:4) print(x[i])

## ------------------------------------------------------------------------
count <- 0
while(count < 10) {
        print(count)
        count <- count + 1
}

## ------------------------------------------------------------------------
z <- 5
set.seed(1)

while(z >= 3 && z <= 10) {
        coin <- rbinom(1, 1, 0.5)
        
        if(coin == 1) {  ## random walk
                z <- z + 1
        } else {
                z <- z - 1
        } 
}
print(z)

## ----eval=FALSE,prompt=FALSE---------------------------------------------
## x0 <- 1
## tol <- 1e-8
## 
## repeat {
##         x1 <- computeEstimate()
## 
##         if(abs(x1 - x0) < tol) {  ## Close enough?
##                 break
##         } else {
##                 x0 <- x1
##         }
## }

## ----eval=FALSE,prompt=FALSE---------------------------------------------
## for(i in 1:100) {
##         if(i <= 20) {
##                 ## Skip the first 20 iterations
##                 next
##         }
##         ## Do something here
## }

## ----eval=FALSE,prompt=FALSE---------------------------------------------
## for(i in 1:100) {
##       print(i)
## 
##       if(i > 20) {
##               ## Stop loop after 20 iterations
##               break
##       }		
## }

