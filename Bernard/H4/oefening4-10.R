# Oefening 4.10

# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================= Oefening 4.10 ========================================

n <- 81 # steekproef aantal
sd <- 36 # Standaardafwijking van POPULATIE! NIET steekproef
m <- 183 # Gemiddelde van POPULATIE, NIET steekproef


#G1 mag je leeg laten indien je een linker staartkans wenst te doen. vb: g1 = ""
g1 = 185     #bij twee waarden moet je g1 en g2 invullen

#Gebied 2 MOET groter zijn dan gebied 1!
g2 = 190    #vul hier de te testen waarde voor staartkans in
            #vb; kans dat steekproefgemiddelde kleiner is dan 185

#Gebied 3 gaan we gebruiken voor de rechterstaart kans
#Gebied 3 mag leeg blijven. vb g3=""
g3 = 190 

# ----------------------------------------- Berekeningen ------------------------------------------

#Schets een kansdichtheidsfunctie voor de populatie
#en kansverdeling van het steekproefgemiddelde

observations <- rnorm(n, m, sd)

m_steekproef <- mean(observations) #Steekproef gemiddelde
sd_steekproef <- sd(observations)#standaardafwijking van de steekproef

# Interessante x waarden om te plotten
x <- seq(from = m - 4 * sd,
         to = m + 4 * sd,
         length.out = 200)


# Histogram kansverdeling van het steekproefgemiddelde
historgram <- hist(observations, freq = FALSE, breaks = 10)

# Kansdichtheidsfunctie voor populatie
y <- dnorm(x, m, sd)
lines(x, y, col="red")

#sigma
a <- sd/sqrt(n) #sigma

if(g1 == ""){#Als g1 leeg is doen we linker staart kans
  perc = pnorm(g2,m,a)
  print(paste('De kans dat steekproefgemiddelde kleiner is dan ', g2, 'is', round(perc*100,2),"%"))
}else{#als g2 niet leeg is gaan we tussen bepaalde waarden gaan berekenen
  perc = pnorm(g2,m,a) - pnorm(g1,m,a)
  print(paste('De kans dat steekproefgemiddelde tussen', g1, 'en',g2, 'ligt is', round(perc*100,2),"%"))
}

if(g3 != ""){#Als g3 NIET leeg is
  percg3 <- 1 - pnorm(g3,m,a)
  print(paste('De kans dat steekproefgemiddelde groter is dan ', g3, 'is', round(percg3*100,2),"%"))
}