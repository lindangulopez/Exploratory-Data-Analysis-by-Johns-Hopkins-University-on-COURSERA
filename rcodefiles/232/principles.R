## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, fig.path = "images/principles-", prompt = TRUE, collapse = TRUE)

## ----,echo=FALSE,fig.width=5,fig.height=5,fig.cap="Change in symptom-free days with air cleaner"----
source("regmodel.R")
with(subset(dd, group == 1), boxplot(diffsymfree, xaxt = "n", ylab = "Change in symptom-free days"))
axis(1, 1, "Air Cleaner")
abline(h = 0, lty = 3, lwd = 1.5)
nobs <- sum(dd$group == 1)
med <- with(subset(dd, group == 1), median(diffsymfree, na.rm = TRUE))

## ----,echo=FALSE,fig.cap="Change in symptom-free days by treatment group",fig.width=5,fig.height=5----
source("regmodel.R")
boxplot(diffsymfree ~ group, dd, xaxt = "n", ylab = "Change in symptom-free days")
axis(1, 1:2, c("Control", "Air Cleaner"))
abline(h = 0, lty = 3, lwd = 1.5)

## ----,echo=FALSE,fig.width=5,fig.height=5,fig.cap="Change in symptom-free days by treatment group"----
source("regmodel.R")
boxplot(diffsymfree ~ group, dd, xaxt = "n", ylab = "Change in symptom-free days", main = "Symptom-free Days")
axis(1, 1:2, c("Control", "Air Cleaner"))
abline(h = 0, lty = 3, lwd = 1.5)

## ----,echo=FALSE,fig.width=10,fig.height=5,fig.cap="Change in symptom-free days and change in PM2.5 levels in-home"----
source("regmodel.R")
par(mfrow = c(1, 2))
ddm$group <- factor(ddm$group, labels = c("Control", "Air Cleaner"))
boxplot(diffsymfree ~ group, ddm, ylab = "Change in symptom-free days", main = "Symptom-free Days")
abline(h = 0, lty = 3, lwd = 1.5)
boxplot(diffpm25 ~ group, ddm, ylab = expression("Change in " * PM[2.5] * " (" * mu * g/m^3 * ")"), main = "Fine Particulate Matter")
abline(h = 0, lty = 3, lwd = 1.5)

## ----,echo=FALSE,fig.height=5,fig.width=5,warning=FALSE,message=FALSE,fig.cap="PM10 and mortality in New York City"----
library(dplyr)
library(tsModel)
d <- readRDS("ny.rds")
dd <- filter(d, date < as.Date("2001-01-01")) %>%
        select(date, death) %>% group_by(date) %>% 
        summarize(death = sum(death))
pm <- select(d, pm10tmean, date) %>% unique %>% 
        mutate(pm10 = Lag(pm10tmean, 1)) %>%
        filter(date < as.Date("2001-01-01"))
m <- merge(dd, pm, by = "date") %>% 
        mutate(season = factor(quarters(date), 
                               labels = c("Winter","Spring","Summer","Fall")))

library(ggplot2)
qplot(pm10, death, data = m, geom = c("point", "smooth"), method = "lm", xlab = expression(PM[10] * " concentration (centered)"), ylab = "Daily mortality (all cuases)")

## ----,warning=FALSE,echo=FALSE,fig.height=4,fig.width=6.5,fig.cap="Daily mortality in New York City"----
d <- readRDS("ny.rds")
dd <- filter(d, date < as.Date("1991-01-01")) %>%
        select(date, death) %>% group_by(date) %>% 
        summarize(death = sum(death))
## idx <- sample(nrow(dd), round(nrow(dd) / 5))
library(ggplot2)
qplot(date, death, data = dd, ylab = "Daily mortality", geom = c("point", "smooth"), method = "loess", span = 1/10)

## ----,warning=FALSE,echo=FALSE,fig.height=4,fig.width=6.5,fig.cap="Daily PM10 in New York City"----
d <- readRDS("ny.rds")
pm <- select(d, pm10tmean, date) %>% unique %>% 
        filter(date < as.Date("2001-01-01"))
qplot(date, pm10tmean, data = pm, geom = c("point", "smooth"), method = "loess", span = 1/10, ylab = expression(PM[10]))

## ----,echo=FALSE,fig.width=10,fig.height=4,warning=FALSE,message=FALSE,fig.cap="PM10 and mortality in New York City by season"----
library(dplyr)
library(tsModel)
d <- readRDS("ny.rds")
dd <- filter(d, date < as.Date("2001-01-01")) %>%
        select(date, death) %>% group_by(date) %>% 
        summarize(death = sum(death))
pm <- select(d, pm10tmean, date) %>% unique %>% 
        mutate(pm10 = Lag(pm10tmean, 1)) %>%
        filter(date < as.Date("2001-01-01"))
m <- merge(dd, pm, by = "date") %>% 
        mutate(season = factor(quarters(date), 
                               labels = c("Winter","Spring","Summer","Fall")))

library(ggplot2)
qplot(pm10, death, data = m, facets = . ~ season, geom = c("point", "smooth"), method = "lm", xlab = expression(PM[10] * " concentration (centered)"), ylab = "Daily mortality (all cuases)")

## ----,fig.width=10,fig.height=5,echo=FALSE,fig.cap="Labelling and annotation of data graphics"----
d <- readRDS("ny.rds")
par(mfrow = c(1, 2))
pm <- select(d, pm10tmean, date) %>% unique %>% 
        filter(date < as.Date("1995-01-01"))
with(pm, plot(date, pm10tmean))

with(pm, plot(date, pm10tmean, ylab = expression("Mean Centered " * PM[10] * " level (" * mu * g/m^3 * ")"), xlab = "Source: U.S. EPA web site", main = "Daily Particulate Matter\nLevels in New York, NY"))

