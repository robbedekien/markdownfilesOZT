#Oefening 3.7

# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)
#============= Context =================
#Gebruik subset uit data frame ais uit library DAAG
# 1. Ontleed de gegevens voor roeiers
# 2. Ontleed de gegevens voor roeiers, netballers en tenissers
# 3. Ontleed de gegevens voor vrouwelijke baskeballers en roeiers

#install library DAAG & Lattice
installed.packages("DAAG")
installed.packages("lattice")

#================== Deel 1 ================
#Inlezen data
roeiers <- subset(ais, sport=="Row")
roeiers_height <- roeiers$ht

print("De gemiddelde lengte is: ")
mean(roeiers_height)

print("De mediaan van de lengte is: ")
median(roeiers_height)

print("De standaardeviatie is: ")
sd(roeiers_height)

print("De maximale lengte is: ")
max(roeiers_height)

print("De minimale lengte is: ")
min(roeiers_height)


#================== Deel 2 ================
#Inlezen data
rnt <- subset(ais, sport=="Row" | sport=="Netball" | sport=="Tennis")
rnt_height <- rnt$ht

print("De gemiddelde lengte is: ")
mean(rnt_height)

print("De mediaan van de lengte is: ")
median(rnt_height)

print("De standaardeviatie is: ")
sd(rnt_height)

print("De maximale lengte is: ")
max(rnt_height)

print("De minimale lengte is: ")
min(rnt_height)

#================== Deel 3 ================
#Inlezen data
#femaleBas <- ais$ht[ais$sex=='f' & ais$sport=="B_Ball"]
#femaleRow <- ais$ht[ais$sex=='f' & ais$sport=="Row"]
femalebasketrow <- subset(ais,sex=='f'| sport=="B_Ball" | sport=="Tennis")
female_ht <- femalebasketrow$ht

print("De gemiddelde lengte is: ")
mean(female_ht)

print("De mediaan van de lengte is: ")
median(female_ht)

print("De standaardeviatie is: ")
sd(female_ht)

print("De maximale lengte is: ")
max(female_ht)

print("De minimale lengte is: ")
min(female_ht)
