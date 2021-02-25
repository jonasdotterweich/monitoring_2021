#hopefully the final idear for the exam prjoject:
#using ndvi data to show the warmer winters and shift of vegetation index in western europe

library(ncdf4)
setwd("/Users/JD/lab/ndvi/") 
library(raster)
library(rgdal)
library(rasterVis)

ndvi14<-raster("c_gls_NDVI300_201401010000_GLOBE_PROBAV_V1.0.1.nc")
ndvi15<-raster("c_gls_NDVI300_201501010000_GLOBE_PROBAV_V1.0.1.nc")
ndvi16<-raster("c_gls_NDVI300_201601010000_GLOBE_PROBAV_V1.0.1.nc")
ndvi17<-raster("c_gls_NDVI300_201701010000_GLOBE_PROBAV_V1.0.1.nc")
#not used becaus Snow cover data starts only in 2018


ndvi18<-raster("c_gls_NDVI300_201801010000_GLOBE_PROBAV_V1.0.1.nc")
ndvi19<-raster("c_gls_NDVI300_201901010000_GLOBE_PROBAV_V1.0.1.nc")
ndvi20<-raster("c_gls_NDVI300_202001010000_GLOBE_PROBAV_V1.0.1.nc")
ndvi21<-raster("c_gls_NDVI300_202101010000_GLOBE_PROBAV_V1.0.1.nc")

ext<-c(-10, 20, 35, 60)

ndvi18eu<-crop(ndvi18, ext)
ndvi19eu<-crop(ndvi19, ext)
ndvi20eu<-crop(ndvi20, ext)
ndvi21eu<-crop(ndvi21, ext)

plot(ndvi14eu)

ndvi14eu <- reclassify(ndvi14eu, cbind(250:255, NA)) #does not work

#new colorramppallette
cl<-colorRampPalette(c('white','yellow','darkorange2','darkorange4',
                       'darkolivegreen4','darkgreen','dodgerblue4'))(100)

par(mfrow=c(2,2))

plot(ndvi18eu, col=cl, main="NDVI 01.01.2018")

plot(ndvi19eu, col=cl, main="NDVI 01.01.2019")

plot(ndvi20eu, col=cl, main="NDVI 01.01.2020")

plot(ndvi21eu, col=cl, main="NDVI 01.01.2021")

 
 
 #now wanting to compare it to sno cover data of the same days
 
 sc18<-raster("c_gls_SCE500_201801010000_CEURO_MODIS_V1.0.1.nc")
 sc19<-raster("c_gls_SCE500_201901010000_CEURO_MODIS_V1.0.1.nc")
 sc20<-raster("c_gls_SCE500_202001010000_CEURO_MODIS_V1.0.1.nc")
 sc21<-raster("c_gls_SCE500_202101010000_CEURO_MODIS_V1.0.1.nc")
 
sc18eu<-crop(sc18, ext)
sc19eu<-crop(sc19, ext)
sc20eu<-crop(sc20, ext)
sc21eu<-crop(sc21, ext)
 
 cl2<-colorRampPalette(c('white','cornsilk2','bisque2','azure2','darkslategray3'))(100)
 
par(mfrow=c(2,2))
plot(sc18eu, main="Snow Cover Data 01.01.18", col=cl2)
map('worldHires', add=T)
plot(sc19eu, main="Snow Cover Data 01.01.19", col=cl2)
map('worldHires', add=T)
plot(sc20eu, main="Snow Cover Data 01.01.20", col=cl2)
map('worldHires', add=T)
plot(sc21eu, main="Snow Cover Data 01.01.21", col=cl2)
map('worldHires', add=T)



# okay now how could be monitored if the snow cover changed over a certain period (e.g. whole winter ) to a winter of some years ago
#therefore a difference has to be established
# on the example of snow

snowdec_20<-raster("data1")
snowfeb_21<-raster("data2")

difsnow20/21<- snowfeb_21-snowdec_20
plot(difsnow20/21)

snowdec_10<-raster("data11")
snowfeb_11<-raster("data22")

difsnow10/11<- snowfeb_11-snowdec_10
plot(difsnow10/11)

difsnow21/11<-difsnow20/21-difsnow10/11
plot(difsnow21/11)

#the last part was hypothetical tho show the code for plotting a difference 
