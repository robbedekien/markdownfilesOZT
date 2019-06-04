#Oefening 6.3

#Clear environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

#inlezen data
data <- read.csv("D:/School/Tweede Bachelor TI/Onderzoekstechnieken/Cursus/onderzoekstechnieken-cursus/oefeningen/data/hfst6_2variabelen/Aardbevingen.csv")

#--------------------Histogram-------------------
hist(data$Magnitude, main = "Magnitude", xlab = "Richter magnitude scale", ylim = c(0,10000), xlim = c(5,9))

#--------------------Boxplot---------------------
boxplot(data$Magnitude, main = "Magnitude")

# ========================= cramer's V ========================

# ----------------- vvv zelf invullen vv -----------
model = chisq.test(data$Type,data$Source)
model

# ---------------------------- vvv zelf invullen vv -----------
tabelZonderMarginalen = table(data$Type,data$Source)
tabelZonderMarginalen

print('Cramers V')
v = sqrt(model$statistic/(margin.table(tabelZonderMarginalen)*(min(nrow(tabelZonderMarginalen),ncol(tabelZonderMarginalen))-1)))
v

if(v == 0){
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