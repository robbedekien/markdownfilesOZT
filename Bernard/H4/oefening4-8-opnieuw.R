#Oefening 4.8

# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
library(lsr)

# =======================================
n <- 25 #Steekproefgrootte
m <- 0 #Gemiddelde
sd <- 1 #standaardafwijking
  
observaties <- rnorm(n, m, sd)

mean_obs <- mean(observaties) #Steekproefgemiddelde
sd_obs <- sd(observaties) #Steekproef standaardafwijking

# Interessante x waarden om te plotten
x <- seq(from = m - 4 * sd,
         to = m + 4 * sd,
         length.out = 200)

# bereken y-waarden voor dichtheidsfunctie
y <- dnorm(x, m, sd) #theoretisch
y_obs <- dnorm(x, mean_obs, sd_obs) #op basis van steekproef

#teken historgram van relatieve frequentie ipv absolute frequentie
h <- hist(observaties, freq = FALSE)

#voeg deze functie toe aan historgram
lines(x, y, col = 'blue')
lines(x, y_obs, col = "red")