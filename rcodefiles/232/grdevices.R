## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, prompt = TRUE, collapse = TRUE, 
                      error = TRUE, warning = TRUE, message = TRUE)

## ----,eval=FALSE---------------------------------------------------------
## ## Make plot appear on screen device
## with(faithful, plot(eruptions, waiting))
## 
## ## Annotate with a title
## title(main = "Old Faithful Geyser data")

## ----,eval=FALSE---------------------------------------------------------
## ## Open PDF device; create 'myplot.pdf' in my working directory
## pdf(file = "myplot.pdf")
## 
## ## Create plot and send to a file (no plot appears on screen)
## with(faithful, plot(eruptions, waiting))
## 
## ## Annotate plot; still nothing on screen
## title(main = "Old Faithful Geyser data")
## 
## ## Close the PDF file device
## dev.off()
## 
## ## Now you can view the file 'myplot.pdf' on your computer

## ----,eval=FALSE---------------------------------------------------------
## library(datasets)
## 
## ## Create plot on screen device
## with(faithful, plot(eruptions, waiting))
## 
## ## Add a main title
## title(main = "Old Faithful Geyser data")
## 
## ## Copy my plot to a PNG file
## dev.copy(png, file = "geyserplot.png")
## 
## ## Don't forget to close the PNG device!
## dev.off()

