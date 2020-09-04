## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE, error = TRUE)

## ------------------------------------------------------------------------
## Coerce a 'Date' object from character
x <- as.Date("1970-01-01")   
x

## ------------------------------------------------------------------------
unclass(x)
unclass(as.Date("1970-01-02"))

## ------------------------------------------------------------------------
x <- Sys.time()
x
class(x)   ## 'POSIXct' object

## ------------------------------------------------------------------------
p <- as.POSIXlt(x)
names(unclass(p))
p$wday     ## day of the week

## ------------------------------------------------------------------------
x <- Sys.time()
x             ## Already in ‘POSIXct’ format
unclass(x)    ## Internal representation
x$sec         ## Can't do this with 'POSIXct'!
p <- as.POSIXlt(x)
p$sec         ## That's better

## ------------------------------------------------------------------------
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)

## ------------------------------------------------------------------------
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S") 
x-y
x <- as.POSIXlt(x) 
x-y

## ------------------------------------------------------------------------
x <- as.Date("2012-03-01") 
y <- as.Date("2012-02-28") 
x-y

## ------------------------------------------------------------------------
## My local time zone
x <- as.POSIXct("2012-10-25 01:00:00")     
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT") 
y-x

