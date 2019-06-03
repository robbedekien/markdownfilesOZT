# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================= Oefening 4.11 ========================================
n <- 64 # steekproef aantal
sd <- 16 # Standaardafwijking van POPULATIE! NIET steekproef
m <- 20 # Gemiddelde van POPULATIE, NIET steekproef

x1 <- 15.5 #random waarde voor steekproefgemiddelde - kan gezien worden als g1
x2 <- 23   #random waarde voor steekproefgemiddelde - kan gezien worden als g2

# ----------------------------------------- Berekeningen ------------------------------------------

#verwacthtingswaarde/steekproefgemiddelde
mu_steekproef <- m #want n > 30
print(paste('Het steekproefgemiddelde is: ', mu_steekproef))

#standaardafwijking steekproef
sd_steekproef <- sd/sqrt(n)
print(paste('Het steekproefgemiddelde is: ', sd_steekproef))

#het steekproefgemiddelde zal een normale verdeling benaderen. 
#Vuistregel voor de centrale limietstelling is n > 30. 
#Hoe groter de steekproef, des te beter zal de kansverdeling 
#de verwachtingswaarde van de populatie benaderen.

#z score
z_x1 <- (x1-mu_steekproef)/sd_steekproef
print(paste('De Z-Score voor x1 is: ', z_x1))
z_x2 <- (x2-mu_steekproef)/sd_steekproef
print(paste('De Z-Score voor x2 is: ', z_x2))

#------------------- Staartkansen -------------------
#kans dat x < x1
perc1 = pnorm(x1,m,sd_steekproef)
print(paste('De kans dat steekproefgemiddelde kleiner is dan ', x1, 'is', round(perc1*100,2),"%"))

#kans dat x > x2
perc2 = 1 - pnorm(x2,m,sd_steekproef)
print(paste('De kans dat steekproefgemiddelde groter is dan ', x2, 'is', round(perc2*100,2),"%"))

#kans dat x1 < x < x2
perc3 = pnorm(x2,m,sd_steekproef) - pnorm(x1,m,sd_steekproef)
print(paste('De kans dat steekproefgemiddelde tussen', x1, 'en',x2, 'ligt is', round(perc3*100,2),"%"))