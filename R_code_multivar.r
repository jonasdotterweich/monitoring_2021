#Lesson on Friday 18th Dec.

library(vegan)
setwd("/Users/JD/lab")
load("biomes_multivar.RData")
ls()   #it lists the files available
head(biomes)

multivar<-decorana(biomes)
multivar
plot(multivar)
#biomes names in the graph
head(biomes_types)
attach(biomes_types)
ordiellipse(multivar, type, col=c("black", "red", "green","blue"), kind = "ehull", lwd=3)   # to create ellipses in the plot
ordispider(multivar, type, col=c("black", "red", "green","blue"), label = T)                  #to name the ellipses

######
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()
