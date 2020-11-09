# second lecture on R coding 06.11.20: plotting relationship among ecological variables

#first of all we were installin sthe spatial datatset package by install.package("sp")
#this is what R showed: install.packages("sp")
#--- Bitte einen CRAN Spiegel für diese Sitzung auswählen ---
#versuche URL 'https://ftp.fau.de/cran/bin/macosx/contrib/4.0/sp_1.4-4.tgz'
#Content type 'application/x-gzip' length 1932488 bytes (1.8 MB)
#==================================================
#downloaded 1.8 MB


#Die heruntergeladenen Binärpakete sind in 
	#    /var/folders/k6/wprrl8j51117yskvlzgvx9d40000gn/T//RtmpbVX2tW/downloaded_packages


library(sp) #require() function could do the same

#data is used to recall datasets
data(meuse)
#the look isnide the dataset
meuse

# view the datatset (prpoerly) attention: Capital letter needed
View(meuse)
#View is not working for mac

#to see the first lines of dataset
head(meuse)

summary(meuse)

plot(cadmium,zink)
#error for that function, object names not found

# solving the error by linking the name to the datatset with the dollar sign $
plot(meuse$cadmium, meuse$zinc)

# yet rather than using the dolla sign we can use an attach function, then from this point on it will permanetly be attached

# with attach(meuse) the next orders/fuctions will be attached to the meuse data

attach(meuse)   
plot(cadmium, zinc)

plot(cadmium, lead)

#how to impress your supervisor
# to create a scatterplot matricies
pairs(meuse)

#Question/excersise for the weekend:
#pairing only some parts of the dataset not the total one
#pairing only cadmium, copper, lead, zinc

#my answer:
ds<-data.frame(cadmium, copper, lead, zinc)
pairs(ds)


# New Lesson 09.11.2020
# first excersise to reload the sp pacage and get the meuse data back, aswer to that:

library(sp)
data(meuse)
head(meuse)

#back to the question for the weekend
#pairing only some parts of the dataset not the total one
#pairing only cadmium, copper, lead, zinc
# those are in the collums three to six
pairs(meuse[,3:6])

#let's use the collum names
pairs(~cadmium+copper+leald+zinc, data=meuse)
#this ~ (tilde) means = in r   in mac alt+5  // and the = mean "is"

#let's prettify the graph
#Excersize change the color

pairs(meuse[,3:6], col='blue')
#or
pairs(meuse[,3:6], col="blue")
