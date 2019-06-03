# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================= Betrouwbaarheidsinterval ========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

data =  c(11.5,16.5,17.3,10.8,5.6,13.1,11.2,14.2,12.9,8.7,9.2,15,14.410,10.3,8.3,12.9,14.2,8.7)

steekproefgemiddelde <- mean(data)
standaardAfwijkingPopulatie <- 2.45 # Hier NIET de standaardafwijking van de steekproef invullen!!!
n <- 20      # steekproefgrootte
betrouwbaarheidsinterval = 0.92 # Hier het betrouwbaarheidsinterval invullen! Niet alpha (wordt berekend)


# ---------------------------------------------- Berekeningen ----------------------------------------------

alpha = 1 - betrouwbaarheidsinterval

if(n >= 30){
  # |ondergrens| en bovengrens
  z <- qnorm(1-alpha/2)
}else{
  z <- qt(1-alpha/2,df=n-1)
}

#berekenen van de betrouwbaarheidsinterval
ondergrens  <- steekproefgemiddelde - z * standaardAfwijkingPopulatie / sqrt(n)
bovengrens <- steekproefgemiddelde + z * standaardAfwijkingPopulatie / sqrt(n)

print(paste("Ondergrens:   ", ondergrens))
print(paste("Bovengrens:   ", bovengrens))
print(paste("Steekproefgemiddelde:   ", steekproefgemiddelde))

# ----- plot -----

x = seq(ondergrens*0.8,bovengrens*1.2, length=200)
dist = dnorm(x, steekproefgemiddelde, standaardAfwijkingPopulatie/sqrt(n))
plot (x, dist, type = 'l', xlab = '', ylab = '')
title(main="Betrouwbaarheidsinterval",sub = paste((1-alpha)*100,'%'))
i <- x <= bovengrens & x >= ondergrens

polygon(c(ondergrens,x[i], bovengrens),c(0,dist[i],0), col = 'yellow')
abline(v=steekproefgemiddelde, col='red') 
text(steekproefgemiddelde, mean(dist)*1.5, steekproefgemiddelde)
text(ondergrens,mean(dist)*0.5,round(ondergrens,2))
text(bovengrens,mean(dist)*0.5,round(bovengrens,2))









