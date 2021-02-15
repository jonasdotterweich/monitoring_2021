#this file is showing the code of the second attemps to produce a nice ode for the exam
#the wildfires of australia should be portrayed and analysed
#this should be done with data from copernicus: burnt area

library(ncdf4)
setwd("/Users/JD/lab/exam/") #new wd for the exam (exam folder in lab folder)
library(raster)
burn19_53<-raster("c_gls_BA300_201905310000_GLOBE_PROBAV_V1.1.1.nc")

#now crop to australia

ext<-c(110,160,-40,-5)
burn19_53au<-crop(burn19_53,ext)
plot(burn19_53au)


cl2 <- colorRampPalette(c('darkblue','yellow','red','black','white'))(100)
plot(burn19_53, col=cl2)


#now trying to do the 2020 jan. data

burn20_1<-raster("c_gls_BA300_202001100000_GLOBE_PROBAV_V1.1.1.nc")
burn20_1au<-crop(burn20_1, ext)
plot(burn20_1au)



#burn data is not really showing anything, trying it with ndvi data

library(ncdf4)
setwd("/Users/JD/lab/exam/") #new wd for the exam (exam folder in lab folder)
library(raster)
ndvi_196<-raster("c_gls_NDVI300_201906010000_GLOBE_PROBAV_V1.0.1.nc")
plot(ndvi_196)
#crop to australia
ext<-c(110,160,-40,-5)
ndvi_196au<-crop(ndvi_196,ext)
plot(ndvi_196au)

ndvi_201<-raster("c_gls_NDVI300_202001110000_GLOBE_PROBAV_V1.0.1.nc")
ndvi_201au<-crop(ndvi_201,ext)

diff_196_201<-ndvi_196au-ndvi_201au
plot(diff_196_201)

diff_201_196<-ndvi_201au-ndvi_196au
plot(diff_201_196)




## trying the Burn data again, hoping that it would be cropped to au already

burn_195<-raster("c_gls_BA300_201905310000_GLOBE_PROBAV_V1.1.1.nc")
plot(burn_195)


###trying another data from https://ads.atmosphere.copernicus.eu/cdsapp#!/yourrequests?tab=form

burn_cams<-raster("CAMS-GLOB-BIO_v3.1_co_2019.nc")  # warnmeldung, das zu viele level

burn_cams

plot(burn_cams, layer=1)  #not functioning

###next day trying it again in some way

library(ncdf4)
setwd("/Users/JD/lab/exam/") #new wd for the exam (exam folder in lab folder)
library(raster)
library(rgdal)

burn_cams<-raster("CAMS-GLOB-BIO_v3.1_co_2019.nc")

#trying to plot
plot(burn_cams)

#haha wow, now it worked, crazy
#now what is needed to plot the diverent lavels of the raster data as well

ext<-c(110,160,-40,-5)
burn_cams_au<-crop(burn_cams, ext)
plot(burn_cams_au)

#okay, good image is created, colorRampPalette could be made better

#now trying to load the data with a stack function as well

library(ncdf4)
setwd("/Users/JD/lab/exam/") #new wd for the exam (exam folder in lab folder)
library(raster)
library(rgdal)

burn_cams<-stack("CAMS-GLOB-BIO_v3.1_co_2019.nc")


#now trying data for co2 and co
co2_19<-stack("CAMS-GLOB-ANT_v4.2_co2_2019.nc")
plot(co2_19)
#problem, that the plotsoes only show yellow bars

#again with biological CO, works fine
bio_co19<-stack("CAMS-GLOB-BIO_v3.1_co_2019.nc")
plot(bio_co19)

ext<-c(110,160,-40,-5)
bio_co19au<-crop(bio_co19, ext)

#only thing to figure out would be to know which is which month

#now trying the org CO2 data

bio_co219<-stack("CAMS-GLOB-ANT_v4.2_co2_excl_short-cycle_org_c_2019.nc")
plot(bio_co219)
bio_c0219au<-crop(bio_co219, ext)
plot(bio_c0219au)



#trying the copernicus data agin, problem its loading log. the issue with the co2 data, is that its not showing, only CO, but thus has now saying about the fire...

burn20<-raster("c_gls_BA300_201912100000_GLOBE_PROBAV_V1.1.1.nc")
burn20au<-crop(burn20, ext)

clnew<-colorRampPalette(c('bisque1','burlywood3','darkorange3','sienna','red4','black')

plot(burn20au, col=clnew)

#checking if there is a difference from jan 2020 to march 2020

burn203<-raster("c_gls_BA300_202003100000_GLOBE_PROBAV_V1.1.1.nc")
burn203au<-crop(burn203, ext)
plot(burn203au, col=clnew)

#now because there was no difference, checking if a change in Vegation properties, Leafe Area Index, can be seen

lai1910<-raster("c_gls_LAI300_201910100000_GLOBE_PROBAV_V1.0.1.nc")

lai1901<-raster("c_gls_LAI300_201901100000_GLOBE_PROBAV_V1.0.1.nc")

#okay this shit does not work





#trying it with ndvI data again

ndvi201<-raster("c_gls_NDVI300_202001110000_GLOBE_PROBAV_V1.0.1.nc")

ndvi196<-raster("c_gls_NDVI300_201906010000_GLOBE_PROBAV_V1.0.1.nc")

ext<-c(110,160,-40,-5)
ndvi201au<-crop(ndvi201, ext)
ndvi196au<-crop(ndvi196, ext)
plot(ndvi196au)
plot(ndvi201au)


#I think this will not work... will try something else...












