## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, fig.path = "images/example-", collapse = TRUE, prompt = TRUE)

## ----read 1999 data,cache=TRUE,tidy=FALSE--------------------------------
pm0 <- read.table("pm25_data/RD_501_88101_1999-0.txt", 
                  comment.char = "#", 
                  header = FALSE, 
                  sep = "|", 
                  na.strings = "")

## ----check first few rows------------------------------------------------
dim(pm0)
head(pm0[, 1:13])

## ----set column names----------------------------------------------------
cnames <- readLines("pm25_data/RD_501_88101_1999-0.txt", 1)
cnames <- strsplit(cnames, "|", fixed = TRUE)
## Ensure names are properly formatted
names(pm0) <- make.names(cnames[[1]])  
head(pm0[, 1:13])

## ------------------------------------------------------------------------
x0 <- pm0$Sample.Value
summary(x0)

## ------------------------------------------------------------------------
## Are missing values important here?
mean(is.na(x0))

## ----read 2012 data,cache=TRUE,tidy=FALSE--------------------------------
pm1 <- read.table("pm25_data/RD_501_88101_2012-0.txt", 
                  comment.char = "#", 
                  header = FALSE, sep = "|", 
                  na.strings = "", 
                  nrow = 1304290)

## ------------------------------------------------------------------------
names(pm1) <- make.names(cnames[[1]])

## ----,message = FALSE, warning = FALSE-----------------------------------
library(dplyr)
pm <- rbind(pm0, pm1)

## ----,cache=TRUE---------------------------------------------------------
pm <- mutate(pm, year = factor(rep(c(1999, 2012), c(nrow(pm0), nrow(pm1))))) %>%
        rename(PM = Sample.Value)

## ----boxplot log values, warning = FALSE---------------------------------
library(ggplot2)

## Take a random sample because it's faster
set.seed(2015)
idx <- sample(nrow(pm), 1000)
qplot(year, log2(PM), data = pm[idx, ], geom = "boxplot")

## ----summaries-----------------------------------------------------------
with(pm, tapply(PM, year, summary))

## ----check negative values-----------------------------------------------
filter(pm, year == "2012") %>% summarize(negative = mean(PM < 0, na.rm = TRUE))

## ----converting dates,cache=TRUE-----------------------------------------
dates <- filter(pm, year == "2012")$Date
dates <- as.Date(as.character(dates), "%Y%m%d")

## ----check dates for negative values-------------------------------------
missing.months <- month.name[as.POSIXlt(dates)$mon + 1]
tab <- table(factor(missing.months, levels = month.name))
round(100 * tab / sum(tab))

## ----,cache=TRUE---------------------------------------------------------
sites <- filter(pm, State.Code == 36) %>% select(County.Code, Site.ID, year) %>% unique

## ------------------------------------------------------------------------
sites <- mutate(sites, site.code = paste(County.Code, Site.ID, sep = "."))
str(sites)

## ------------------------------------------------------------------------
site.year <- with(sites, split(site.code, year))
both <- intersect(site.year[[1]], site.year[[2]])
print(both)

## ----,cache=TRUE---------------------------------------------------------
count <- mutate(pm, site.code = paste(County.Code, Site.ID, sep = ".")) %>% 
        filter(site.code %in% both)

## ------------------------------------------------------------------------
group_by(count, site.code) %>% summarize(n = n())

## ------------------------------------------------------------------------
pmsub <- filter(pm, State.Code == 36 & County.Code == 63 & Site.ID == 2008)

## ----,fig.height=4,fig.width=8-------------------------------------------
pmsub <- mutate(pmsub, date = as.Date(as.character(Date), "%Y%m%d"))
rng <- range(pmsub$PM, na.rm = TRUE)

par(mfrow = c(1, 2), mar = c(4, 5, 2, 1))
with(filter(pmsub, year == "1999"), {
        plot(date, PM, ylim = rng)
        abline(h = median(PM, na.rm = TRUE))
})
with(filter(pmsub, year == "2012"), {
        plot(date, PM, ylim = rng)
        abline(h = median(PM, na.rm = TRUE))
})

## ----,echo=FALSE---------------------------------------------------------
med <- group_by(pmsub, year) %>% summarize(PM = median(PM, na.rm = TRUE))

## ------------------------------------------------------------------------
mn <- group_by(pm, year, State.Code) %>% summarize(PM = mean(PM, na.rm = TRUE))
head(mn)
tail(mn)

## ----,fig.width=9--------------------------------------------------------
qplot(xyear, PM, data = mutate(mn, xyear = as.numeric(as.character(year))), 
      color = factor(State.Code), 
      geom = c("point", "line"))

