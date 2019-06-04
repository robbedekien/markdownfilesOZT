# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================== Lineaire regressie  ===========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

data <- read.csv("D:/School/Tweede Bachelor TI/Onderzoekstechnieken/Cursus/onderzoekstechnieken-cursus/oefeningen/data/hfst6_2variabelen/Cats.csv")

data_M <- subset(data,data$Sex=="M")
data_F <- subset(data,data$Sex=="F")

afhankelijkeVar_Man = data_M$Bwt
onafhanekelijkeVar_Man = data_M$Hwt

afhankelijkeVar_Vrouw = data_F$Bwt
onafhanekelijkeVar_Vrouw = data_F$Hwt

# ---------------------------------------------- Berekeningen ----------------------------------------------

#Manier 1

# mx <- mean(onafhanekelijkeVar)  # gemiddelde van x
# my <- mean(afhankelijkeVar)  # gemiddelde van y
# xx <- onafhanekelijkeVar - mx   # x - mx
# yy <- afhankelijkeVar - my   # y - my
# beta_1 <- sum(xx * yy) / sum(xx^2)
# beta_0 <- my - beta_1 * mx
#
# plot(x = onafhanekelijkeVar, y = afhankelijkeVar,
#        xlab = "Protein content (%)",
#        ylab = "Weight gain (g)")
# abline(a = beta_0,  # snijpunt y-as
#        b = beta_1,  # richtingscoÃ«fficiÃ«nt
#        col = 'red')

#Manier 2
#AFHANKELIJK - ONAFHANKELIJK!

# -------------------------------------------- MAN --------------------------------------------------------------------
lm(afhankelijkeVar_Man ~ onafhanekelijkeVar_Man)

plot(x = onafhanekelijkeVar_Man, xlab = "Gewicht hart voor Man(kg)",
     y = afhankelijkeVar_Man, ylab = "Lichaamsgewicht voor Man(kg)")

regression <- lm(afhankelijkeVar_Man ~ onafhanekelijkeVar_Man)
abline(regression,
       col = 'red')
legend(2,18, legend="Regressierechte", col = "red", lty=1:2, cex=0.8)

# -------------------------------------------- VROUW --------------------------------------------------------------------

lm(afhankelijkeVar_Vrouw ~ onafhanekelijkeVar_Vrouw)

plot(x = onafhanekelijkeVar_Man, xlab = "Gewicht hart voor Vrouw(kg)",
     y = afhankelijkeVar_Man, ylab = "Lichaamsgewicht voor Vrouw(kg)")

regression <- lm(afhankelijkeVar_Vrouw ~ onafhanekelijkeVar_Vrouw)
abline(regression,
       col = 'red')
legend(2,18, legend="Regressierechte", col = "red", lty=1:2, cex=0.8)

# ---------------------------------------------- Correlatie - covariantie ----------------------------------------------

# -------------------------------------------- Man --------------------------------------------------------------------
mx <- mean(onafhanekelijkeVar_Man)
my <- mean(afhankelijkeVar_Man)

plot(x = onafhanekelijkeVar_Man, xlab = "Gewicht hart voor Man(kg)",
     y = afhankelijkeVar_Man, ylab = "Lichaamsgewicht voor Man(kg)")
abline(h = my, col = 'red')
abline(v = mx, col = 'red')

print("Covariantie")
cov(onafhanekelijkeVar_Man, afhankelijkeVar_Man)

print("Corolatiecoëfficient")
correlation = cor(onafhanekelijkeVar_Man, afhankelijkeVar_Man)
correlation

regression <- lm(afhankelijkeVar_Man ~ onafhanekelijkeVar_Man)
abline(regression,
       col = 'blue')
legend(2,19.5, legend=c("Regressierechte","Kwadranten"), col = c("blue","red"), lty=1:2, cex=0.8)

print("Determinatiecoëfficient")
correlation^2

# -------------------------------------------- VROUW --------------------------------------------------------------------

mx <- mean(onafhanekelijkeVar_Vrouw)
my <- mean(afhankelijkeVar_Vrouw)

plot(x = onafhanekelijkeVar_Vrouw, xlab = "Gewicht hart voor Vrouw(kg)",
     y = afhankelijkeVar_Vrouw, ylab = "Lichaamsgewicht voor Vrouw(kg)")
abline(h = my, col = 'red')
abline(v = mx, col = 'red')

print("Covariantie")
cov(onafhanekelijkeVar_Vrouw, afhankelijkeVar_Vrouw)

print("Corolatiecoëfficient")
correlation = cor(onafhanekelijkeVar_Vrouw, afhankelijkeVar_Vrouw)
correlation

regression <- lm(afhankelijkeVar_Vrouw ~ onafhanekelijkeVar_Vrouw)
abline(regression,
       col = 'blue')
legend(2,19.5, legend=c("Regressierechte","Kwadranten"), col = c("blue","red"), lty=1:2, cex=0.8)

print("Determinatiecoëfficient")
correlation^2