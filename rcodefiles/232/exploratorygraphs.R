## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, fig.path = "images/exploratorygraphs-", prompt = TRUE, collapse = TRUE)

## ----readpm25data--------------------------------------------------------
class <- c("numeric", "character", "factor", "numeric", "numeric")
pollution <- read.csv("data/avgpm25.csv", colClasses = class)

## ------------------------------------------------------------------------
head(pollution)

## ------------------------------------------------------------------------
str(pollution)

## ------------------------------------------------------------------------
fivenum(pollution$pm25)

## ------------------------------------------------------------------------
summary(pollution$pm25)

## ----,fig.cap="Boxplot of PM2.5 data",fig.width=5------------------------
boxplot(pollution$pm25, col = "blue")

## ----,message=FALSE,warning=FALSE----------------------------------------
library(dplyr)
filter(pollution, pm25 > 15)

## ----,fig.cap="Map of California counties"-------------------------------
library(maps)
map("county", "california")
with(filter(pollution, pm25 > 15), points(longitude, latitude))

## ----,fig.height=5,fig.cap="Histogram of PM2.5 data"---------------------
hist(pollution$pm25, col = "green")

## ----,fig.height=5,fig.cap="Histogram of PM2.5 data with rug"------------
hist(pollution$pm25, col = "green")
rug(pollution$pm25)

## ----,fig.height=5,fig.cap="Histogram of PM2.5 data with more breaks"----
hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

## ----,fig.cap="Boxplot of PM2.5 data with added line",fig.width=5--------
boxplot(pollution$pm25, col = "blue")
abline(h = 12)

## ----,fig.height=5,fig.cap="Histogram of PM2.5 data with annotation"-----
hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

## ------------------------------------------------------------------------
library(dplyr)
table(pollution$region) %>% barplot(col = "wheat")

## ----,fig.cap="Boxplot of PM2.5 by region"-------------------------------
boxplot(pm25 ~ region, data = pollution, col = "red")

## ----,fig.width=8,fig.height=5,fig.cap="Histogram of PM2.5 by region"----
par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

## ----,fig.height=6,fig.cap="Scatterplot of PM2.5 and latitude"-----------
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2)

## ----,fig.height=5,fig.cap="Scatterplot of PM2.5 and latitude by region"----
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)

## ------------------------------------------------------------------------
levels(pollution$region)

## ----,fig.height=5.5,fig.width=12,fig.cap="Multiple Scatterplots of PM2.5 and latitude by region"----
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

## ----,eval=FALSE---------------------------------------------------------
## ## Lattice
## library(lattice)
## xyplot(pm25 ~ latitude | region, data = pollution)
## 
## ## ggplot2
## library(ggplot2)
## qplot(latitude, pm25, data = pollution, facets = . ~ region)

