#R code for Exam

#we need a library for the NC data

install.packages("ncdf4")
library(ncdf4)
setwd("/Users/JD/lab/")
library(raster)
tjan<-raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

#exercise: change color ramp palette

cltjan <- colorRampPalette(c('black','grey','light grey'))(100) #
plot(tjan, col=cltjan)

cltjan2<-colorRampPalette(c('red','orange','yellow'))(100)
plot(tjan, col=cltjan2)

toct<-raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)
dift<-tjan-toct
cldif<-colorRampPalette(c('blue','white','red'))(100)
plot(dift, col=cldif)
