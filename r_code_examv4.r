# idea for exam plot nox data for germany and see how it changed with the diesel
  
library(ncdf4)
setwd("/Users/JD/lab/exam/") #new wd for the exam (exam folder in lab folder)
library(raster)
library(rgdal)
  
nox_18<-stack("CAMS-GLOB-ANT_v4.2_nox_2018.nc")
plot(nox_18)

nox_18

nox_19<-stack("CAMS-GLOB-ANT_v4.2_nox_2019.nc")
plot(nox_19)

nox_20<-stack("CAMS-GLOB-ANT_v4.2_nox_2020.nc")
plot(nox_20)

#trying something else like here:

library(raster)
library(rgdal)
library(rasterVis)
library(RColorBrewer)
setwd("/Users/JD/lab/exam/")
nox_18<-stack("CAMS-GLOB-ANT_v4.2_nox_2018.nc")
nox_18



#trying to figure out the extent to zoom to germany or somwhere else by utilyzing previously used data



library(rasterdiv)
library(raster)
data(copNDVI)
plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)
exteu<-c(10,15,48,52)
copNDVI2<-crop(copNDVI, exteu)
#fail


