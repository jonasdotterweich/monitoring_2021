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


##Deforestation example
library(raster)
library(RStoolbox)
setwd("/Users/JD/lab/")

defor1<-brick("defor1_.jpg")
defor2<-brick("defor2_.jpg")

defor1

# short excourse on explaining 8-bit   2^8  meaning 0-256 colors or pixels.... thats why defor1 shows min max value from 0-255
2^8

plotRGB(defor1, 1, 2, 3, stretch='Lin')   #1=red, 2=green# 3=blue
#changing up the RGB color sceeme
plotRGB(defor1, 2,3,1,stretch='Lin')
plotRGB(defor1, 1,3,2,stretch='Lin')
plotRGB(defor1,3,2,1,stretch='Lin')
#
plotRGB(defor1, 1, 2, 3, stretch='Lin') 

#excerside, import the defor 2
plotRGB(defor2, 1, 2, 3, stretch='Lin') 

#purt images next to each other
par(mfrow=c(1,2))
plotRGB(defor1, 1, 2, 3, stretch='Lin')
plotRGB(defor2, 1, 2, 3, stretch='Lin') 
#
par(mfrow=c(2,1))
plotRGB(defor1, 1, 2, 3, stretch='Lin')
plotRGB(defor2, 1, 2, 3, stretch='Lin') 

dev.off()

#dvi for the first period
dvi1<-defor1$defor1_.1 - defor1$defor1_.2
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

#dvi after the forest area was cut
dvi2<-defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

#both in one frame
dev.off()

par(mfrow=c(2,1))
plot(dvi1, col=cl, main='DVI before cut')
plot(dvi2, col=cl, main='DVI after cut')

#difference in biomass before and aster cou is difdvi

difdvi<-dvi1-dvi2
dev.off()
plot(difdvi)
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)
#this (on top) is the perfect image to show the loss of biomass, its the amount of energy lost

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")

hist(difdvi)#creates an histogram

#####final par to put all informations together
#defor1#defor2
#dvi1#dvi2
#difdvi
#histogram

div.off()
par(mfrow=c(3,2))
plotRGB(defor1, 1, 2, 3, stretch='Lin')
plotRGB(defor2, 1, 2, 3, stretch='Lin') 
plot(dvi1, col=cl, main='biomass before cut')
plot(dvi2, col=cl, main='biomass after cut')
plot(difdvi, col=cldif, main='amount of energy lost by clearcutting')
hist(difdvi, col='grey')


