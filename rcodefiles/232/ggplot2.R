## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(message = F, error = F, warning = F, comment = NA, 
                      tidy = F, fig.path = "images/ggplot2-", fig.height = 4)


## ----,fig.height=5,fig.cap="Scatterplot of Temperature and Ozone in New York (base graphics)"----
with(airquality, { 
        plot(Temp, Ozone)
        lines(loess.smooth(Temp, Ozone))
})

## ----,fig.cap="Scatterplot of Temperature and Ozone in New York (ggplot2)"----
library(ggplot2)
ggplot(airquality, aes(Temp, Ozone)) + 
        geom_point() + 
        geom_smooth(method = "loess", se = FALSE)

## ------------------------------------------------------------------------
library(ggplot2)
str(mpg)

## ----,fig.cap="Plot of engine displacement and highway mileage"----------
qplot(displ, hwy, data = mpg)

## ----,fig.cap="Engine displacement and highway mileage by drive class"----
qplot(displ, hwy, data = mpg, color = drv)

## ----,fig.cap="Engine displacement and highway mileage w/smoother"-------
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))

## ----,fig.cap="Histogram of highway mileage by drive class"--------------
qplot(hwy, data = mpg, fill = drv, binwidth = 2)

## ----,fig.cap="Boxplots of highway mileage by drive class"---------------
qplot(drv, hwy, data = mpg, geom = "boxplot")

## ----,fig.width=5,fig.cap="Histogram of highway mileage by drive class"----
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)

## ----, fig.width=6,fig.cap="Engine displacement and highway mileage by drive class"----
qplot(displ, hwy, data = mpg, facets = . ~ drv)

## ----, fig.width=6,fig.cap="Engine displacement and highway mileage by drive class w/smoother"----
qplot(displ, hwy, data = mpg, facets = . ~ drv) + geom_smooth()

## ----,eval=FALSE---------------------------------------------------------
## qplot(displ, hwy, data = mpg, facets = . ~ drv, geom = c("point", "smooth"))

## ----,echo=FALSE---------------------------------------------------------
maacs <- read.csv("data/maacs_sim.csv")
str(maacs)

## ----,fig.cap="Histogram of log eNO"-------------------------------------
qplot(log(eno), data = maacs)

## ----,fig.cap="Histogram of log eNO by mouse allergic status"------------
qplot(log(eno), data = maacs, fill = mopos)

## ----, fig.cap="Density smooth of log eNO"-------------------------------
qplot(log(eno), data = maacs, geom = "density")

## ----,fig.cap="Density smooth of log eNO by mouse allergic status"-------
qplot(log(eno), data = maacs, geom = "density", color = mopos)

## ----,fig.cap="eNO and PM2.5"--------------------------------------------
qplot(log(pm25), log(eno), data = maacs, geom = c("point", "smooth"))

## ----,fig.cap="eNO and PM2.5 by mouse allergic status"-------------------
qplot(log(pm25), log(eno), data = maacs, shape = mopos)

## ----,fig.cap="eNO and PM2.5 by mouse allergic status"-------------------
qplot(log(pm25), log(eno), data = maacs, color = mopos)

## ------------------------------------------------------------------------
qplot(log(pm25), log(eno), data = maacs, color = mopos, 
      geom = c("point", "smooth"), method = "lm")

## ----, fig.width=9-------------------------------------------------------
qplot(log(pm25), log(eno), data = maacs, geom = c("point", "smooth"), 
      method = "lm", facets = . ~ mopos)

## ----,echo=TRUE----------------------------------------------------------
maacs <- read.csv("data/bmi_pm25_no2_sim.csv")
str(maacs)

## ------------------------------------------------------------------------
head(maacs)
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
summary(g)
class(g)

## ----, error=TRUE--------------------------------------------------------
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
print(g)

## ----,Scatterplot of PM2.5 and days with nocturnal symptoms--------------
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
g + geom_point()

## ----, fig.cap="Scatterplot with smoother"-------------------------------
g + geom_point() + geom_smooth()

## ----,fig.cap="Scatterplot with linear regression line"------------------
g + geom_point() + geom_smooth(method = "lm")

## ----, fig.width=9,fig.cap="Scatterplot of PM2.5 and nocturnal symptoms by BMI category"----
g + geom_point() + 
        geom_smooth(method = "lm") +
        facet_grid(. ~ bmicat) 

## ----,fig.cap="Modifying point color with a constant"--------------------
g + geom_point(color = "steelblue", size = 4, alpha = 1/2)

## ----,fig.cap="Mapping color to a variable"------------------------------
g + geom_point(aes(color = bmicat), size = 4, alpha = 1/2)

## ------------------------------------------------------------------------
g + geom_point(aes(color = bmicat)) + 
        labs(title = "MAACS Cohort") + 
        labs(x = expression("log " * PM[2.5]), y = "Nocturnal Symptoms")

## ------------------------------------------------------------------------
g + geom_point(aes(color = bmicat), size = 2, alpha = 1/2) + 
  geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)

## ------------------------------------------------------------------------
g + geom_point(aes(color = bmicat)) + theme_bw(base_family = "Times")

## ------------------------------------------------------------------------
cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = TRUE)

## ------------------------------------------------------------------------
maacs$no2tert <- cut(maacs$logno2_new, cutpoints)

## ------------------------------------------------------------------------
## See the levels of the newly created factor variable
levels(maacs$no2tert)

## ----,fig.cap="PM2.5 and nocturnal symptoms by BMI category and NO2 tertile",fig.width=9, fig.height=5----
## Setup ggplot with data frame
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

## Add layers
g + geom_point(alpha = 1/3) + 
  facet_wrap(bmicat ~ no2tert, nrow = 2, ncol = 4) + 
  geom_smooth(method="lm", se=FALSE, col="steelblue") + 
  theme_bw(base_family = "Avenir", base_size = 10) + 
  labs(x = expression("log " * PM[2.5])) + 
  labs(y = "Nocturnal Symptoms") + 
  labs(title = "MAACS Cohort")

## ----, fig.cap="Time series plot with base graphics"---------------------
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100  ## Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

## ----,fig.cap="Time series plot with default settings"-------------------
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()

## ----,fig.cap="Time series plot with modified ylim"----------------------
g + geom_line() + ylim(-3, 3)

## ----,fig.cap="Time series plot with restricted y-axis range"------------
g + geom_line() + coord_cartesian(ylim = c(-3, 3))

