# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================= Chi-kwadraat - kruistabel (met inlezen van dataset) ============================

# --------------------------------------------- Input Gegevens ---------------------------------------------

data = survey
data1 = data$Sex #Vermoedelijke onafhankelijke variabele
data2= data$Smoke #Vermoedelijke afhankelijke variabele

alpha=0.05

# ---------------------------------------------- Berekeningen ----------------------------------------------
model = chisq.test(data1,data2)
model
model$observed
model$statistic
p = model$p.value



# p-waarde < α => H0 verwerpen (bij chi-kwadraat is dat altijd: er is geen verband.) Er is dus duidelijk een verband.

l = model$parameter

g = qchisq(1-alpha,df=l)

chisq = model$statistic

print(paste("Chi-kwadraat:     ", chisq))
print(paste("g-waarde:         ", g))
print(paste("p-waarde:         ", p))

if(chisq > g){
  print('H0 verwerpen! Er bestaat WEL een samenhang tussen de variabelen in de populatie!')
  print(paste('chi-kwadraat (',round(chisq,3),') > g-waarde (',round(g,3),')'))
  print(paste('p-waarde (',round(p,3),') < alpha (',alpha,')'))
}else{
  print('H0 niet verwerpen! Er bestaat GEEN samenhang tussen de variabelen in de populatie!')
  print(paste('chi-kwadraat (',round(chisq,3),') < g-waarde (',round(g,3),')'))
  print(paste('p-waarde (',round(p,3),') > alpha (',alpha,')'))
  
}

# =========================================== Mozaik plot ======================================================
plot(table(data1,data2), main="Gender~ Smoking", xlab = "Gender", ylab = "Smokeing frequency")

#???barplot(table(data1,data2), main="Writing hand ~ Folding hand", xlab = "Folding", col=c("red","blue"))
