# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================= Oefening 4.12 ========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

n <- 1200 # steekproef aantal
sd <- 6.6 # Standaardafwijking van POPULATIE! NIET steekproef
m <- 43.1# Gemiddelde van POPULATIE, NIET steekproef

g1 <- "" #Mag leeg zijn
g2 <- 0.85 #Moet groter zijn dan g1

# ---------------------------------------------- Berekeningen ----------------------------------------------

#Toon aan dat 85% van de automobilisten niet harder dan 50km/u rijdt
snelheid <- qnorm(0.85,mean = m,sd = sd) #De snelheid op 85% op de belcurve
print(paste('de snelheid is: ', snelheid))

#bij hoeveel van de 1200 metingen kan een snelheid 
#van 55km/h gevonden worden, op grond van eerder ervaringen.
kans1meting <- 1 - pnorm(mean = m, sd = sd, q=55)
aantal <- kans1meting * n
print(paste('het aantal is: ', aantal))

# ---------------------------------------------- Plot ----------------------------------------------