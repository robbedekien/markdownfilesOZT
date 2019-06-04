#Oefening 6.2

#Clear environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)
library(plotly)


#inlezen data
data <- read.csv("D:/School/Tweede Bachelor TI/Onderzoekstechnieken/Cursus/onderzoekstechnieken-cursus/oefeningen/data/hfst6_2variabelen/MuziekWijn.csv")

#kruistabel opmaken
kruistabel <- table(data)
#--------------------kruistabel zonder marginalen--------------------------
kruistabel

#marginale totalen berekenen
r_margin <- margin.table(kruistabel, 1) #Row margin
c_margin <- margin.table(kruistabel, 2) #Column margin
t_margin <- margin.table(kruistabel)

#marginale totalen
r_margin
c_margin
t_margin

#--------------------kruistabel met marginalen--------------------------
kruistabel_m <- addmargins(kruistabel)
kruistabel_m

#verwachte resultaten
verwacht <- as.array(r_margin)%*%t(as.array(c_margin))/t_margin
#tabel met verwachte resultaten
verwacht

#afwijkingen, gekwadrateerd en genormeerd
afwijkingen <- (kruistabel - verwacht) ^ 2 / verwacht
#--------------------Afwijkingstabel, gekwadrateerd en genormeerd--------------------------
afwijkingen

#--------------------CHI²--------------------------
#chi² methode 1
sum(afwijkingen)

#chi² methode 2
summ <- summary(kruistabel)
chi_sq <- summ$statistic
chi_sq

#--------------------Cramers V--------------------------
k <- min(nrow(kruistabel), ncol(kruistabel))
v <- sqrt(chi_sq/margin.table(kruistabel)*(k-1))
v

if(V == 0){
  print('Geen samenhang')
}

if(0 < v & v <=0.1){
  print('Geen samenhang ~ zwakke samengang')
}

if(0.1 < v & v <=0.25){
  print('zwakke samenhang ~ redelijke sterke samenhang')
}

if(0.25 < v & v <=0.5){
  print('redelijke sterke samenhang ~ sterke samenhang')
}

if(0.5 < v & v <=0.75){
  print('sterke samenhang ~ zeer sterke samenhang')
}

if(0.75 < v & v <1){
  print('zeer sterke samenhang ~ volledige samenhang')
}

if(v == 1){
  print('volledige samenhang')
}

#--------------------Plot--------------------------

#staafdiagram in percent, conditie muziek = geen
kruistabel_pct <- prop.table(kruistabel)
barplot(kruistabel_pct[2,], xlab = "Wijnen",)
title("Verkochte wijnen zonder muziek in percent")

#stacked bar chart voor wijnen in percent
barplot(kruistabel_pct)
