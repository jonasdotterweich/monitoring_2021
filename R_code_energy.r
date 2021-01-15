#installing rastervid package
install.packages("rastervid")
library(rasterdiv)
library(raster)
data(copNDVI)
plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

install.packages("rasterVis")
library(rasterVis)
levelplot(copNDVI)
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

dev.off()
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #worst map
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #best map
plot(copNDVI, col=clymax)


 dev.off()
 
 
#crop for croping first declare the extension

ext <- c(0,20,35,55)     #xmin xmax, ymin ymax
copNDVI_Italy <-crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
