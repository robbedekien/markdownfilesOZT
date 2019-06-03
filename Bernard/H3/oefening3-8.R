#Oefening 3.8

# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)
#============= Context =================
#Geef functies range en mean voor volgende waarden

#1 tot 21
data1 <- c(1:21)
#Gemiddelde
mean(data1)
#Range
range(data1)

#50 random waarden
data2 <- rnorm(50)
#Gemiddelde
mean(data2)
#Range
range(data2)

#Ingebouwde data frame "women"
#Gemiddelde gewicht
mean(women$weight)
#Gemiddelde lengte
mean(women$height)
#Range gewicht
range(women$weight)
#Range lengte
range(women$weight)