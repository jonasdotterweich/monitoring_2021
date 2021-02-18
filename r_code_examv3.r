#island in south chinese waters

library(ncdf4)
 setwd("/Users/JD/lab/exam/") 
 library(raster)
 
 water14<-raster("c_gls_WB300_201401010000_GLOBE_PROBAV_V1.0.1.nc")
 water20<-raster("c_gls_WB300_202012210000_GLOBE_PROBAV_V1.0.1.nc")
 
 ext<-c(100,125,0,25)
 water14sc<-crop(water14, ext)
 plot(water14sc)
 
 water20sc<-crop(water20, ext)
 plot(water20sc)
 #ext for water20 does not work because data 
