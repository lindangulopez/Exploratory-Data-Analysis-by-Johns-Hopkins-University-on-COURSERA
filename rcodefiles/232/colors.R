## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, fig.path = "images/color-", prompt = TRUE, collapse = TRUE)

## ----,fig.cap="Default colors in R"--------------------------------------
set.seed(19)
x <- rnorm(30)
y <- rnorm(30)
plot(x, y, col = rep(1:3, each = 10), pch = 19)
legend("bottomright", legend = paste("Group", 1:3), col = 1:3, pch = 19, bty = "n")

## ----,fig.width=12,fig.cap="Image plots in R"----------------------------
par(mfrow = c(1, 2))
image(volcano, col = heat.colors(10), main = "heat.colors()")
image(volcano, col = topo.colors(10), main = "topo.colors()")

## ------------------------------------------------------------------------
pal <- colorRamp(c("red", "blue"))
pal(0)

## ------------------------------------------------------------------------
## blue
pal(1)

## purple-ish
pal(0.5)

## ------------------------------------------------------------------------
pal(seq(0, 1, len = 10))

## ------------------------------------------------------------------------
pal <- colorRampPalette(c("red", "yellow"))

## ------------------------------------------------------------------------
## Just return red and yellow
pal(2)

## ------------------------------------------------------------------------
## Return 10 colors in between red and yellow
pal(10)

## ------------------------------------------------------------------------
rgb(0, 0, 234, maxColorValue = 255)

## ----,fig.cap="RColorBrewer palettes", fig.width=8,fig.height=7----------
library(RColorBrewer)
display.brewer.all()

## ------------------------------------------------------------------------
library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols

## ------------------------------------------------------------------------
pal <- colorRampPalette(cols)

## ----,fig.cap="Volcano data with color ramp palette"---------------------
image(volcano, col = pal(20))

## ----,fig.cap="smoothScatter function"-----------------------------------
set.seed(1)
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)

## ------------------------------------------------------------------------
rgb(1, 0, 0, 0.1)

## ----,fig.cap="Scatterplot with no transparency"-------------------------
set.seed(2)
x <- rnorm(2000)
y <- rnorm(2000)
plot(x, y, pch = 19)

## ----,fig.cap="Scatterplot with transparency"----------------------------
plot(x, y, pch = 19, col = rgb(0, 0, 0, 0.15))

