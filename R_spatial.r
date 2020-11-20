# spatiala analysis

library(sp)
data(meuse)
head(meuse)

#we are going to state to r that we are using coordinates

coordinates(meuse)= ~x+y
plot(meuse)

#spplot is used to plot elements like zinc, lead, etc
# spplot(meuse, ->the collum goes in here<-)
#this is to see the concentration of zinc in space

spplot(meuse, "zinc")
spplot(meuse, "zinc", main="Concentrationof zinc")
spplot(meuse, "copper", main="Concentration of copper")

#exercise see copper and zinc

spplot(meuse, c("copper","zinc"), main="Concentration of Copper&Zinc")

#rather than using colors, lats amake use of colours -> size of the points will get bigger with the magitude

bubble(meuse, "zinc")
#do the asme for lead
bubble(meuse, "lead")
bubble(meuse, "lead", col="orange")


# second lesson using ggplot2 - 16.11.20
# ggplot2 was installed by:
install.pckages("ggplot2")
library(ggplot2)

#made up ecological plot
#biofules -- antioxidants enzymes

biofules<- c(120, 200, 350, 570, 750)   #array of values by c

oxidative<- c(1200, 1300, 21000, 34000, 50000)

#creating a table by data.frame named d
d<- data.frame(biofules, oxidative)
#its the same to do a dataframe ith ggplot
ggplot(d, aes(x=biofules, y=oxidative))+geom_point()

#mofifiying the expression of the points
ggplot(d, aes(x=biofules, y=oxidative))+geom_point(,col="red", size=5)

#instead of pints we can use a line as well by geom_line
ggplot(d, aes(x=biofules, y=oxidative))+geom_line()

# we can mix things
ggplot(d, aes(x=biofules, y=oxidative))+geom_line()+geom_point(,size=3)

#polygons
ggplot(d, aes(x=biofules, y=oxidative))+geom_polygon()

       ##           ##
   ######           #####
#########Import Data########
   ######           #####
       ##           ##

setwd("path/lab")

#work directory for mac (need the path)
setwd("/Users/JD/lab")

# importing the table
covid<-read.table("covid_agg.csv", header=TRUE)
covid

#################################### next lecture 20.11.20
setwd("/Users/JD/lab")
covid<-read.table("covid_agg.csv", header=TRUE) #Header is a logical variable: if there is a table with a header(first row is names of variables), header=TRUE needs to be put in
covid

head(covid)
summary(covid)

#names of variables
names(covid)

#ggplot
library(ggplot2)
ggplot(covid, aes(x = lon, y = lat)) + geom_point() #aes is aesthetics

#changing the size of data
ggplot(covid, aes(x = lon, y = lat, size=cases)) + geom_point()


