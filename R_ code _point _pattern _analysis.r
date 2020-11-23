#point pattern analysis, lecture 20.11.20

library(spatstat)

setwd("/Users/JD/lab)
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
setwd("/Users/JD/lab)
covid<-read.table("covid_agg.csv", header=TRUE)
