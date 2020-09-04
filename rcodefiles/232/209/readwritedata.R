## ----echo=FALSE----------------------------------------------------------
opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE)

## ----eval=FALSE----------------------------------------------------------
## data <- read.table("foo.txt")

## ----eval=FALSE----------------------------------------------------------
## initial <- read.table("datatable.txt", nrows = 100)
## classes <- sapply(initial, class)
## tabAll <- read.table("datatable.txt", colClasses = classes)

## ------------------------------------------------------------------------
## Create a data frame
y <- data.frame(a = 1, b = "a")  
## Print 'dput' output to console
dput(y)                          

## ------------------------------------------------------------------------
## Send 'dput' output to a file
dput(y, file = "y.R")            
## Read in 'dput' output from a file
new.y <- dget("y.R")             
new.y

## ------------------------------------------------------------------------
x <- "foo"
y <- data.frame(a = 1L, b = "a")

## ------------------------------------------------------------------------
dump(c("x", "y"), file = "data.R") 
rm(x, y)

## ------------------------------------------------------------------------
source("data.R")
str(y)
x

## ------------------------------------------------------------------------
a <- data.frame(x = rnorm(100), y = runif(100))
b <- c(3, 4.4, 1 / 3)

## Save 'a' and 'b' to a file
save(a, b, file = "mydata.rda") 

## Load 'a' and 'b' into your workspace
load("mydata.rda")              

## ------------------------------------------------------------------------
## Save everything to a file
save.image(file = "mydata.RData")   

## load all objects in this file
load("mydata.RData")                

## ------------------------------------------------------------------------
x <- list(1, 2, 3)
serialize(x, NULL)

## ------------------------------------------------------------------------
str(file)

## ----eval=FALSE----------------------------------------------------------
## ## Create a connection to 'foo.txt'
## con <- file("foo.txt")
## 
## ## Open connection to 'foo.txt' in read-only mode
## open(con, "r")
## 
## ## Read from the connection
## data <- read.csv(con)
## 
## ## Close the connection
## close(con)

## ----eval=FALSE----------------------------------------------------------
## data <- read.csv("foo.txt")

## ------------------------------------------------------------------------
## Open connection to gz-compressed text file
con <- gzfile("words.gz")   
x <- readLines(con, 10) 
x

## ------------------------------------------------------------------------
## Open a URL connection for reading
con <- url("http://www.jhsph.edu", "r")  

## Read the web page
x <- readLines(con)                      

## Print out the first few lines
head(x)                                  

