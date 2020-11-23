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
attach(covid)
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
