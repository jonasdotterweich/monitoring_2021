#this document is created to document the first tries for the exam preperation

 library(ncdf4)
 setwd("/Users/JD/lab/exam/") #new wd for the exam (exam folder in lab folder)
 library(raster)
tjan14<-raster("c_gls_NDVI300_201401010000_GLOBE_PROBAV_V1.0.1.nc")
plot(tjan14)    #here R seams to be loading but does not show any Quartz window

#the general plan would be to see the data and crop to the xuan lien nature reserve in Vietnam. Thereby we could see differences in land use changes especially in the building of a road inside of a nature reserve
#trying once again with ndvi data downloaded from coernicus, but data ove one year later
#after some minutes the data was calculated and plotted by R

#now trying to crop the data

ext<-c(100,110,0,30)
tjan14crop<-crop(tjan14, ext)
plot(tjan14crop)

#okay, it worked,vietnam is well presented in the crop, trying to go deeper

ext2<-c(104,108,17,22)
tjan14crop2<-crop(tjan14crop, ext2)
plot(tjan14crop2)



#trying to add coastlines

coastlines<-readOGR("ne_10m_coastline Kopie.shp")
plot(coastlines, add=TRUE)

#okay fehler in libraries -> trying to adding the libraries

library(sp)
library(rgdal)
library(spatstat)
coastlines<-readOGR("ne_10m_coastline Kopie.shp")
plot(coastlines, add=TRUE)

#okay, this did not work out, the try to apply a better color ramp palette


cl<-colorRampPalette(c('pink','green','orange','red','magenta'))(100)
plot(tjan14crop2,col=cl)
cl2 <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(tjan14crop2,col=cl2)




#continunig to add country lines with some other methodes // Source: http://keithnewman.co.uk/r/maps-in-r.html

install.packages("maps")
install.packages("mapdata")

library(maps)       # Provides functions that let us plot the maps
library(mapdata)    # Contains the hi-resolution points that mark out the countries.

map('worldHires', 'Vietnam')

#good, now we have the outlines of the country, lets try now to incorporate the ndvi data to the plot

library(ncdf4)
 setwd("/Users/JD/lab/exam/") #new wd for the exam (exam folder in lab folder)
 library(raster)
tjan14<-raster("c_gls_NDVI300_201401010000_GLOBE_PROBAV_V1.0.1.nc")

ext<-c(100,110,0,30)
tjan14crop<-crop(tjan14, ext)
ext2<-c(104,108,17,22)
tjan14crop2<-crop(tjan14crop, ext2)
plot(tjan14crop2)

map('worldHires', 'Vietnam', add=T)

#now trying even more: opening my Gis files in r and adding the Nature Reserves outline to the map // help of:https://gis.stackexchange.com/questions/144356/how-to-read-arcgis-files-in-r

library(rgdal)
outline_xlnr<-readOGR("Outline XLNR.shp")
plot(outline_xlnr, add=T, col="red")

#wow, it worked 
#okay, now cropp more to NR area

ext3<-c(104.9,105.4,19.82,20.05)
tjan14crop_xl<-crop(tjan14crop2, ext3)
plot(tjan14crop_xl)

map('worldHires', 'Vietnam', add=T)
plot(outline_xlnr, add=T, col="red")

#now changing the color
cl2 <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(tjan14crop_xl, col=cl2)

map('worldHires', 'Vietnam', add=T, col="white")
plot(outline_xlnr, add=T, col="springgreen1")
