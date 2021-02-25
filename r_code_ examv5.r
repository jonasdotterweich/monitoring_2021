#trying to plot the surface temperature differences for the summers in Germany and compare them from 2017 - 2020

library(ncdf4)
setwd("/Users/JD/lab/lst/") 
library(raster)
library(rasterVis)

lst17<-stack("c_gls_LST10-DC_201708010000_GLOBE_GEO_V1.2.1.nc")

lst17c<-crop(lst17, exteu)
plot(lst17c)
#fail
#trying to size ext bigger
plot(lst17)
ext1<-c(10,25, 25,50)
lst171<-crop(lst17, ext1)
plot(lst171)
# too far south

ext2<-c(10,25,50,85)
lst172<-crop(lst17, ext2)
plot(lst172)
#nope

ext3<-c(-10, 20, 35, 60)
lst173<-crop(lst17, ext3)
plot(lst173)
#okay maybe I can work with that

lst18<-stack("c_gls_LST10-DC_201808010000_GLOBE_GEO_V1.2.1.nc")
lst183<-crop(lst18, ext3)
plot(lst183)

#trying to plot only one of the stack

plot(lst183, names="X2018.08.01.10")
#didn't work

lst183u<-unstack(lst183)
#this worked
#trying to plot 01.08.18 12:00

plot(lst183u, band=12)
#didn't work

rasterLayer(lst183u, 12)
#didn't work

plot(lst173, varname="X2017.08.01.12")
#didn't work
par(mfrow=c(1,1))
plot(lst173, varname="X2017.08.01.12")
#didn't work

plot(lst173, level=12)

plot(lst173, layer=12)

lst183_12 <-reclassify(lst183, level=12)
lst183_12 <-reclassify(lst183, varname='X2018.08.01.12')
lst183_12 <-reclassify(lst183, layer='X2018.08.01.12')

#reclassify cant work because a 2-3 collum matrix is needed
