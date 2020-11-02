# This File is created in the course of Monitoring Ecosystem Changes and Fuctioning course
# Comment: Comments can be created with the hashtag
# My thisis was taken as an example
#this is an array (indicated by the c)
primates<-c(3, 5, 9, 15, 40)
primates

#new set: "Imaginatory, primates eating crabs"
crabs<-c(100, 70, 30, 10, 5)
crabs

#first plot in r
plot(primates, crabs)

plot(primates, crabs, col="red")

plot(primates, crabs, col="red", pch="19") #wrong!! without the "..."

plot(primates, crabs, col="red", pch=19)

plot(primates, crabs, col="red", pch=19, cex=2)

plot(primates, crabs, col="red", pch=19, cex=6)

plot(primates, crabs, col="red", pch=19, cex=2, main="My first ecological graph in R")

#table by creating a dataframe

ecoset<-data.frame(primates, crabs)

#lemmy try something
mean(primates)
#okay 'mean' works
# meanwhile in the lecture: creating the mean with the sum

(3+5+9+15+40)/5
sum(primates)
sum(primates)/5

#Total summary

summary(ecoset)
