## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, fig.path = "images/plottingsystems-", prompt = TRUE, collapse = TRUE)

## ----,fig.width=5,fig.height=5,fig.cap="Scatterplot with loess curve"----
data(airquality)
with(airquality, {
        plot(Temp, Ozone)
        lines(loess.smooth(Temp, Ozone))
})

## ----,fig.height=5,fig.width=5,fig.cap="Base plot with title"------------
data(cars)

## Create the plot / draw canvas
with(cars, plot(speed, dist))

## Add annotation
title("Speed vs. Stopping distance")

## ------------------------------------------------------------------------
library(lattice)

## ----,fig.height=4,fig.width=8,fig.cap="Lattice plot"--------------------
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))

## ----,eval=FALSE---------------------------------------------------------
## install.packages("ggplot2")

## ------------------------------------------------------------------------
library(ggplot2)

## ----, message=FALSE,fig.height=5,fig.width=6,fig.cap="ggplot2 plot"-----
data(mpg)
qplot(displ, hwy, data = mpg)

