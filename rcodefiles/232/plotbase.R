## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, fig.path = "images/plotbase-", prompt = TRUE, collapse = TRUE)

## ----,fig.height=5,fig.width=5,fig.cap="Ozone levels in New York City"----
library(datasets)

## Draw a new plot on the screen device
hist(airquality$Ozone)  

## ----,fig.height=5,fig.width=5,fig.cap="Ozone levels by month in New York City",message=FALSE----
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

## ----,fig.height=5,fig.width=5,fig.cap="Scatterplot of wind and ozone in New York City"----
with(airquality, plot(Wind, Ozone))

## ------------------------------------------------------------------------
par("lty")
par("col")
par("pch")

## ------------------------------------------------------------------------
par("bg")
par("mar")
par("mfrow")

## ----,fig.height=5,fig.cap="Base plot with annotation"-------------------
library(datasets)

## Make the initial plot
with(airquality, plot(Wind, Ozone))

## Add a title
title(main = "Ozone and Wind in New York City")  

## ----,fig.height=5,fig.cap="Base plot with annotation"-------------------
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

## ----,fig.height=5,fig.cap="Base plot with multiple annotations"---------
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

## ----,fig.height=5,fig.cap="Scatterplot with linear regresion line"------
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))

## Fit a simple linear regression model
model <- lm(Ozone ~ Wind, airquality)

## Draw regression line on plot
abline(model, lwd = 2)

## ----,fig.height=5,fig.width=12,fig.cap="Panel plot with two plots"------
par(mfrow = c(1, 2))
with(airquality, {
	plot(Wind, Ozone, main = "Ozone and Wind")
	plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

## ----,fig.height=4,fig.width=12,fig.cap="Panel plot with three plots"----
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
	plot(Wind, Ozone, main = "Ozone and Wind")
	plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
	plot(Temp, Ozone, main = "Ozone and Temperature")
	mtext("Ozone and Weather in New York City", outer = TRUE)
})

