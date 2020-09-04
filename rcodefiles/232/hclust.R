## ----,echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(comment = NA, fig.path = "images/hclust-", prompt = TRUE, collapse = TRUE)

## ----,tidy=TRUE,fig.cap="Simulated clustered data"-----------------------
set.seed(1234)
x <- rnorm(12, rep(1:3,each=4), 0.2)
y <- rnorm(12, rep(c(1,2,1),each=4), 0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))

## ------------------------------------------------------------------------
dataFrame <- data.frame(x=x, y=y)
dist(dataFrame)

## ----,tidy=TRUE----------------------------------------------------------
rdistxy <- as.matrix(dist(dataFrame))

## Remove the diagonal from consideration
diag(rdistxy) <- diag(rdistxy) + 1e5

# Find the index of the points with minimum distance
ind <- which(rdistxy == min(rdistxy),arr.ind=TRUE)
ind

## ----,tidy=TRUE,fig.cap="Two closest points"-----------------------------
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
points(x[ind[1,]],y[ind[1,]],col="orange",pch=19,cex=2)

## ----,tidy=TRUE,fig.width=12,warning=FALSE,message=FALSE,fig.cap="Merging of first two points"----
par(mfrow = c(1, 2))
plot(x,y,col="blue",pch=19,cex=2, main = "Data")
text(x+0.05,y+0.05,labels=as.character(1:12))
points(x[ind[1,]],y[ind[1,]],col="orange",pch=19,cex=2)

# Make a cluster and cut it at the right height
library(dplyr)
hcluster <- dist(dataFrame) %>% hclust
dendro <- as.dendrogram(hcluster)
cutDendro <- cut(dendro,h=(hcluster$height[1]+0.00001) )
plot(cutDendro$lower[[11]],yaxt="n",main="Begin building tree")

## ----,echo=FALSE,fig.cap="First set of merged points/cluster"------------
rdistxy <- dist(dataFrame) %>% as.matrix
diag(rdistxy) <- diag(rdistxy) + 1e5

# Find the index of the points with minimum distance
ind <- which(rdistxy == min(rdistxy),arr.ind=TRUE)

# Plot the points with the minimum overlayed
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
points(x[ind[1,]],y[ind[1,]],col="orange",pch=19,cex=2)
points(mean(x[ind[1,]]),mean(y[ind[1,]]),col="black",cex=3,lwd=3,pch=3)
points(mean(x[ind[1,]]),mean(y[ind[1,]]),col="orange",cex=5,lwd=3,pch=1)

## ------------------------------------------------------------------------
nextmin <- rdistxy[order(rdistxy)][3]
ind <- which(rdistxy == nextmin,arr.ind=TRUE)
ind

## ----,fig.width=14,echo=FALSE,fig.cap="Second set of merged points"------
par(mfrow=c(1,3))
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
points(x[c(5,6)],y[c(5,6)],col="orange",pch=19,cex=2)
points(x[ind[1,]],y[ind[1,]],col="red",pch=19,cex=2)

# Make dendogram plots
distxy <- dist(dataFrame)
hcluster <- hclust(distxy)
dendro <- as.dendrogram(hcluster)
cutDendro <- cut(dendro,h=(hcluster$height[2]) )
plot(cutDendro$lower[[10]],yaxt="n")
plot(cutDendro$lower[[5]],yaxt="n")

## ----,fig.cap="Full hierarchical clustering dendrogram"------------------
hClustering <- data.frame(x=x,y=y) %>% dist %>% hclust
plot(hClustering)

## ----plclust,tidy=TRUE---------------------------------------------------
myplclust <- function( hclust, lab=hclust$labels, lab.col=rep(1,length(hclust$labels)), hang=0.1,...){
  ## modifiction of plclust for plotting hclust objects *in colour*!
  ## Copyright Eva KF Chan 2009
  ## Arguments:
  ##    hclust:    hclust object
  ##    lab:        a character vector of labels of the leaves of the tree
  ##    lab.col:    colour for the labels; NA=default device foreground colour
  ##    hang:     as in hclust & plclust
  ## Side effect:
  ##    A display of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height,2); x <- as.numeric(hclust$merge)
  y <- y[which(x<0)]; x <- x[which(x<0)]; x <- abs(x)
  y <- y[order(x)]; x <- x[order(x)]
  plot( hclust, labels=FALSE, hang=hang, ... )
  text( x=x, y=y[hclust$order]-(max(hclust$height)*hang),
        labels=lab[hclust$order], col=lab.col[hclust$order], 
        srt=90, adj=c(1,0.5), xpd=NA, ... )
}

## ----, tidy=TRUE, fig.cap="Prettier dendrogram"--------------------------
hClustering <- data.frame(x=x,y=y) %>% dist %>% hclust
myplclust(hClustering,lab=rep(1:3,each=4),
          lab.col=rep(1:3,each=4))

## ----,echo=FALSE,fig.cap="Complete merging"------------------------------
dataFrame <- data.frame(x=x,y=y)
plot(x,y,col="blue",pch=19,cex=2)
points(x[8],y[8],col="orange",pch=3,lwd=3,cex=3)
points(x[1],y[1],col="orange",pch=3,lwd=3,cex=3)
segments(x[8],y[8],x[1],y[1],lwd=3,col="orange")

## ----,echo=FALSE,fig.cap="Average merging"-------------------------------
dataFrame <- data.frame(x=x,y=y)
plot(x,y,col="blue",pch=19,cex=2)
points(mean(x[1:4]),mean(y[1:4]),col="orange",pch=3,lwd=3,cex=3)
points(mean(x[5:8]),mean(y[5:8]),col="orange",pch=3,lwd=3,cex=3)
segments(mean(x[1:4]),mean(y[1:4]),mean(x[5:8]),mean(y[5:8]),lwd=3,col="orange")


## ----,fig.cap="Heatmap with dendrograms on rows and columns"-------------
dataMatrix <- data.frame(x=x,y=y) %>% data.matrix
heatmap(dataMatrix)

