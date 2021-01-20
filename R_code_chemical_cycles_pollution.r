# Lesson 20.01.21

library(raster)

setwd("/Users/JD/lab/")

EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")


#alternative to that, easier way by function apply a function over a list
#by 
#rlsit<-list.files(pattern='EN')
#rlist
#list_rast<-lapply(rlist, raster)
#lENstack<-stack(list_rast)

#plitting the first and last image

cl<-colorRampPalette(c('red','orange','yellow'))(100)

par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)

#close the window/dev.off()

difno2<-EN01-EN13
cldif<-colorRampPalette(c('blue','black','yellow'))(100)
plot(difno2, col=cldif)

#to make a video/gif out of the frames
#https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/

#to watch the mouvement just for once plot one after the other

plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

#put it all in one table

dev.off()
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

#make a stack
EN<-stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN, col=cl)

#make an RGB plot

plotRGB(EN, red=EN13, green=EN07, blue=EN01 , stretch='Lin')

#boxplot function
dev.off()
boxplot(EN, horizontal=T, axes=T, outlines=F)
dev.off()
boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period")
#xlab and ylab are the labes for the axis
