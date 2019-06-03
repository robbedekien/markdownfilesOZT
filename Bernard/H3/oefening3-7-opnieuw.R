#Oefening 3.7


# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
library(lsr)

#============= Context =================
#Gebruik subset uit data frame ais uit library DAAG
# 1. Ontleed de gegevens voor roeiers
# 2. Ontleed de gegevens voor roeiers, netballers en tenissers
# 3. Ontleed de gegevens voor vrouwelijke baskeballers en roeiers

#install library DAAG & Lattice
installed.packages("DAAG")
installed.packages("lattice")

#============= Inlezen data ============
data <- DAAG::ais

#============ Deel 1 ===================
roeiers <- subset(data, sport=="Row")
roeiers_ht <- roeiers$ht

#Gemiddelde height roeiers
mean(roeiers_ht)
#Standaard deviatie height roeiers
sd(roeiers_ht)
#Range heigt roeiers
range(roeiers_ht)
#Max
max(roeiers_ht)
#Min
min(roeiers_ht)

#========== Deel 2 ===================
rnt <- subset(data, sport=="Row" | sport=="Netball" | sport=="Tennis")
rnt_ht <- rnt$ht

#Gemiddelde height rnt
mean(rnt_ht)
#Standaard deviatie height rnt
sd(rnt_ht)
#Range heigt rnt
range(rnt_ht)
#Max
max(rnt_ht)
#Min
min(rnt_ht)


#========== Deel 3 ===================
f_br <- subset(data, sport=="Row" | sport=="B_ball" | sex=="f")
f_br_ht <- f_br$ht

#Gemiddelde height rnt
mean(f_br_ht)
#Standaard deviatie height rnt
sd(f_br_ht)
#Range heigt rnt
range(f_br_ht)
#Max
max(f_br_ht)
#Min
min(f_br_ht)