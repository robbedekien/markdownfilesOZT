# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

#========================
x = 63 #Wouter
x_m <- 54
x_sd <- 11

y = 67 #Stijn
y_m <- 62
y_sd <- 7

#---- Berekening ----
z_wouter <- (x-x_m)/x_sd #z = (x-mu)/sd
z_stijn <- (y-y_m)/y_sd

if(z_wouter > z_stijn){
  print(paste("De score van Wouter: ",z_wouter," is beter dan de score van Stijn: ",z_stijn))
}else{
  print(paste("De score van Stijn: ",z_stijn," is beter dan de score van Wouter: ",z_wouter))
}