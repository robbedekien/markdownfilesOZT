# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ======================================== T-test - 2 steek Proeven ========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

#Volgorde van data1 en data2 zijn van belang voor de conclusie!
# Je mag deze waarden  NIET omdraaien! Data 2 is de gewone toestand, data 1 is de speciale toestand!
# voorbeeld: 
#         data1 is de groep mensen die het medicijn genomen hebben (De speciale groep)
#         data2 is de groep mensen die niet het medicijn genomen hebben. (De gewone groep)
data <- read.csv("D:/School/Tweede Bachelor TI/Onderzoekstechnieken/Cursus/onderzoekstechnieken-cursus/oefeningen/data/hfst3_1variabele/android_persistence_cpu.csv",
                 sep=";",
                dec=",")

#Proef small, filter op tijd, keuze Realm en GreenDOA
data_small <- subset(data,data$Datahoeveelheid=='Weinig')
data1 <- data_small$Tijd[which(data_small$PersistentieType=='Realm')]
data2 <- data_small$Tijd[which(data_small$PersistentieType=='GreenDAO')]

#Proef medium, filter op tijd, keuze Realm en GreenDOA
#data_medium <- subset(data,data$Datahoeveelheid=='Medium')
#data1 <- data_medium$Tijd[which(data_medium$PersistentieType=='Realm')]
#data2 <- data_medium$Tijd[which(data_medium$PersistentieType=='GreenDAO')]

alpha = 0.05
#Gepaarde test (TRUE indien je het over een gepaarde toets gaat.)
paired = FALSE


# ---------------------------------------------- Berekeningen ----------------------------------------------

# indien je denkt dat het gemiddelde van dataset 1 kleiner is dan dat van data set 2: H1: mu1 - mu2 < 0 -> less
# indien je denkt dat het gemiddelde van dataset 1 groter is dan dat van data set 2: H1: mu1 - mu2 > 0 -> greater

if(mean(data1) - mean(data2) < 0){
  print(t.test(data1, data2, alternative = 'less',paired = paired))
  tTest = t.test(data1, data2, alternative = 'less',paired = paired);
  p = tTest$p.value
  h = paste("Gemiddelde van de dataset1 (",tTest$estimate[1],") is kleiner dan dat van dataset 2 (",tTest$estimate[2],")")
  print("Linkszijdige test")
  print(h)
}

if(mean(data1) - mean(data2) > 0){
  print(t.test(data1, data2, alternative = 'greater'))
  tTest = t.test(data1, data2, alternative = 'greater',paired = paired);
  p = tTest$p.value
  h = paste("Gemiddelde van de dataset1 (",tTest$estimate[1],") is groter dan dat van dataset 2 (",tTest$estimate[2],")")
  print("Rechtszijdige test")
  print(h)
}

if(p < alpha){
  print("Nul-hypothese: er is EEN significant verschil!")
  print(paste("p-waarde (",p,") is kleiner dan alpha (",alpha,")"))
  print("H0 verwerpen!")
  
  verwerpenPWaarde= TRUE;
  
}else{
  print("Nul-hypothese: er is GEEN sifnificant verschil!")
  print(paste("p-waarde (",p,") is groter dan alpha (",alpha,")"))
  print("H0 niet verwerpen!")
  verwerpenPWaarde= FALSE;
}

 