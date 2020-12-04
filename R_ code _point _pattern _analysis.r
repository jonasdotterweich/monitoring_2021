#point pattern analysis, lecture 20.11.20

library(spatstat)

setwd("/Users/JD/lab")
covid<-read.table("covid_agg.csv", header=TRUE)

#lets see the density
#lets use the planer point pattern in spatstat

attach(covid)

#ppp( xcoordinate, ycoordinate-> in this case long and lat... after that we have to put the ranges of longitude and latitude

covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90)) # this is the maximum possible range for the ranges, so everything is insiede, in general we should be generous with the range

density_map <- density(covid_planar)
plot(density_map)
points(covid_planar) # to overlay the density map with the points

#changing the color gradien by

cl<-colorRampPalette(c("yellow", "orange", "red"))(100) #the hundret means that we will have 100 different colors in the gradient between the colors
cl2<-colorRampPalette(c("darkblue", "purple","magenta","orange","red"))(100)

# overlaying with Geospatial data
install.packages("rgdal")
library(sp)
library(rgdal)


###### lecture 23.11.20

setwd("/Users/JD/lab")
covid<-read.table("covid_agg.csv", header=TRUE)
attach(covid)  #if you do not attach use: covid$lon etc..
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)
### this was a repetition of the previous lecture

library(sp)
library(rgdal)

coastlines<-readOGR("ne_10m_coastline.shp") #coastlines imported under the name coastlines

density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)
plot(coastlines, add=TRUE) # add=TRUE means that the coastlines will be plotted in the same graph

### or ###

cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch=16)
plot(coastlines, add = TRUE)

cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch=16, cex=0.25) #decreasing the size of the points
plot(coastlines, add = TRUE)

#to save as a figure oin lab folder (because wd is set to there)

png("figute 1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch=16, cex=0.25) #decreasing the size of the points
plot(coastlines, add = TRUE)
dev.off()

### or ###

pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#ggsave can be used to more elaborately safe files

#if we want to simplify a big file like costlines: coastlines_simp <- gSimplify(coastlines, tol = 3, topologyPreserve = TRUE)

#now wea are going to do an interpolation

marks(covid_planar) <- cases #we are linking/marking the cases (collum in data) to the covid_planer
cases_map<-Smooth(covid_planar)

plot(cases_map, col=cl)
plot(coastlines, add=T)

############Lesson 27.11.20########
##interpolate case data
#Plotting points with different size together with the covid data with the interpolation

setwd("/Users/JD/lab")
libraray(spatstat)
library(rgdal)
covid<-read.table("covid_agg.csv", header=TRUE) #or read.csv
attach(covid)
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
marks(covid_planar) <- cases
cases_map<-Smooth(covid_planar)
cl<-colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col=cl)

install.packages("sf")
library(sf)                 ###then convert objct to sf
Spoints<-st_as_sf(covid, coords=c("lon", "lat"))
plot(Spoints, cex=Spoints$cases, col="purple3", lwd=3, add=T)
#explanation for function above: charakers as big as cases by spoints$cases, and lwd is line widht
#yet the plot display too big of a point because the casses are hing so we have to have a divisor
plot(cases_map, col=cl)
plot(Spoints, cex=Spoints$cases/10000, col="purple3", lwd=3, add=T)

####there is a problem here that should be solved:  points are not the same as duccio's, how to solve it?

#to put the coastline around:
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

#####lecture 30.11.20####

setwd("/Users/JD/lab")
leo<-read.table("dati_zabotti.csv")#this is faulty!
head(leo)
attach(leo)
library(spatstat)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))

# or maybe:;This is the solution
setwd("/Users/JD/lab")
leo<-read.table("dati_zabotti.csv", header=T, sep=",")
head(leo)
attach(leo)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))
plot(leo)

density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)


######### lesson 04.12.20 #######
#interpolation o students data

setwd("/Users/JD/lab")
load("point_pattern_analysis.RData")

ls()
head(leo)
library(spatstat)
attach(leo)
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
 
cl <- colorRampPalette(c('yellow','orange','red','green'))(100)  
plot(chlh_map, col=cl)
points(leo_ppp)

# Exercise: do the same for chls in the sediment

marks(leo_ppp) <- chls

chls_map <- Smooth(leo_ppp)
plot(chls_map, col=cl)
points(leo_ppp)

#mltipanel
#fuction par(mfrow=c 1,3 ) heißt soviel wie multiframe 1 row, 3 collums

par(mfrow=c (1,3))

#first graph density map
plot(density_map, col=cl)
points(leo_ppp)

#second graph
plot(chlh_map, col=cl)
points(leo_ppp)

#third graph
plot(chls_map, col=cl)
points(leo_ppp)

# excersize: build a multipanal with three rows and one collum
par(mfrow=c (3,1))

#first graph density map
plot(density_map, col=cl)
points(leo_ppp)

#second graph
plot(chlh_map, col=cl)
points(leo_ppp)

#third graph
plot(chls_map, col=cl)
points(leo_ppp)
