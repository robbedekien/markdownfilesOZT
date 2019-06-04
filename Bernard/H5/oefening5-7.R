# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ============================================= Oefening 5.7 ===========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

data <- read.csv("D:/School/Tweede Bachelor TI/Onderzoekstechnieken/Cursus/onderzoekstechnieken-cursus/oefeningen/data/hfst5_toetsing/puntenlijst.csv")
alpha = 0.05 #Zelf te kiezen

#---------- !!!!! NIET VERGETEN !!!! ----------
#Onderaan het script de waardes van de t-test in te vullen om te kijken of de verschillen significant zijn.
#---------- !!!!! NIET VERGETEN !!!! ----------


# --------------------------------------------- Opsomming data ---------------------------------------------

result_a <- data[which(data$Groep=="A"),"Score"]
result_b <- data[which(data$Groep=="B"),"Score"]
result_c <- data[which(data$Groep=="C"),"Score"]
result_d <- data[which(data$Groep=="D"),"Score"]
result_e <- data[which(data$Groep=="E"),"Score"]
result_f <- data[which(data$Groep=="F"),"Score"]
result_g <- data[which(data$Groep=="G"),"Score"]
result_h <- data[which(data$Groep=="H"),"Score"]

print("Summary voor alle groepen")
summary(data)

print("Summary voor groep A")
summary(result_a)

print("Summary voor groep B")
summary(result_b)

print("Summary voor groep C")
summary(result_c)

print("Summary voor groep D")
summary(result_d)

print("Summary voor groep E")
summary(result_e)

print("Summary voor groep F")
summary(result_f)

print("Summary voor groep G")
summary(result_g)

print("Summary voor groep H")
summary(result_h)

# --------------------------------------------- staafgrafiek gemiddelde score per sessie ---------------------------------------------

ptnGem <- aggregate(Score~Groep, data=data, FUN = function(data) c(gemiddelde = mean(data)))
names <- c("A","B","C","D","E","F","G","H")
barplot(ptnGem$Score,names.arg=names, main = "staafdiagram per groep",xlab = "Groep",ylab = "Score")

# --------------------------------------------- boxplot scores per groep ---------------------------------------------

boxplot(data$Score~data$Groep) 
a <- as.data.frame(result_a)
b <- as.data.frame(result_b)

# --------------------------------------------- toets significantie ---------------------------------------------

#ZELF INVULLEN  resultaat_x, resultaat_y

test <- t.test(result_a, result_b, alternative = "less")
test
p = test$p.value

if(p < alpha){
  print("H0 verwerpen!")
  print(paste("p-waarde (",p,") < significantieniveau (α)! (",alpha,")"))
  verwerpenPWaarde= TRUE;
  
}else{
  print("H0 niet verwerpen!")
  print(paste("p-waarde (",p,") > significantieniveau (α)! (",alpha,")"))
  verwerpenPWaarde= FALSE;
}

