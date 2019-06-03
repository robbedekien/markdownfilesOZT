#z = (x-mu)/sd
x1 <- 63
mu1 <- 54
sd1 <- 11

x2 <- 67
mu2 <- 62
sd2 <- 7

#berekening Wouter
z_wouter <- (x1-mu1)/sd1

#berekening Stijn
z_stijn <- (x2-mu2)/sd2

if(z_wouter > z_stijn){
  print(paste("De score van Wouter: ",z_wouter," is beter dan de score van Stijn: ",z_stijn))
}else{
  print(paste("De score van Stijn: ",z_stijn," is beter dan de score van Wouter: ",z_wouter))
}