## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE, 
                      error = TRUE, warning = TRUE, message = TRUE)
options(width = 50)

## ----,eval=FALSE---------------------------------------------------------
## library(readr)
## ozone <- read_csv("data/hourly_44201_2014.csv",
##                   col_types = "ccccinnccccccncnncccccc")

## ----,read RDS file,echo=FALSE-------------------------------------------
ozone <- readRDS("data/hourly_ozone.rds")

## ------------------------------------------------------------------------
names(ozone) <- make.names(names(ozone))

## ------------------------------------------------------------------------
nrow(ozone)
ncol(ozone)

## ------------------------------------------------------------------------
str(ozone)

## ------------------------------------------------------------------------
head(ozone[, c(6:7, 10)])

## ------------------------------------------------------------------------
tail(ozone[, c(6:7, 10)])

## ------------------------------------------------------------------------
table(ozone$Time.Local)

## ----,warning=FALSE,message=FALSE----------------------------------------
library(dplyr)
filter(ozone, Time.Local == "13:14") %>% 
        select(State.Name, County.Name, Date.Local, 
               Time.Local, Sample.Measurement)

## ------------------------------------------------------------------------
filter(ozone, State.Code == "36" 
       & County.Code == "033" 
       & Date.Local == "2014-09-30") %>%
        select(Date.Local, Time.Local, 
               Sample.Measurement) %>% 
        as.data.frame

## ------------------------------------------------------------------------
select(ozone, State.Name) %>% unique %>% nrow

## ------------------------------------------------------------------------
unique(ozone$State.Name)

## ------------------------------------------------------------------------
summary(ozone$Sample.Measurement)

## ------------------------------------------------------------------------
quantile(ozone$Sample.Measurement, seq(0, 1, 0.1))

## ------------------------------------------------------------------------
ranking <- group_by(ozone, State.Name, County.Name) %>%
        summarize(ozone = mean(Sample.Measurement)) %>%
        as.data.frame %>%
        arrange(desc(ozone))

## ------------------------------------------------------------------------
head(ranking, 10)

## ------------------------------------------------------------------------
tail(ranking, 10)

## ------------------------------------------------------------------------
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% nrow

## ------------------------------------------------------------------------
ozone <- mutate(ozone, Date.Local = as.Date(Date.Local))

## ------------------------------------------------------------------------
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>%
        mutate(month = factor(months(Date.Local), levels = month.name)) %>%
        group_by(month) %>%
        summarize(ozone = mean(Sample.Measurement))

## ------------------------------------------------------------------------
filter(ozone, State.Name == "Oklahoma" & County.Name == "Caddo") %>% nrow

## ------------------------------------------------------------------------
filter(ozone, State.Name == "Oklahoma" & County.Name == "Caddo") %>%
        mutate(month = factor(months(Date.Local), levels = month.name)) %>%
        group_by(month) %>%
        summarize(ozone = mean(Sample.Measurement))

## ------------------------------------------------------------------------
set.seed(10234)
N <- nrow(ozone)
idx <- sample(N, N, replace = TRUE)
ozone2 <- ozone[idx, ]

## ------------------------------------------------------------------------
ranking2 <- group_by(ozone2, State.Name, County.Name) %>%
        summarize(ozone = mean(Sample.Measurement)) %>%
        as.data.frame %>%
        arrange(desc(ozone))

## ------------------------------------------------------------------------
cbind(head(ranking, 10),
      head(ranking2, 10))

## ------------------------------------------------------------------------
cbind(tail(ranking, 10),
      tail(ranking2, 10))

