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
