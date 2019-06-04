# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================== Lineaire regressie  ===========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

data <- read.csv("D:/School/Tweede Bachelor TI/Onderzoekstechnieken/Cursus/onderzoekstechnieken-cursus/oefeningen/data/hfst6_2variabelen/Cats.csv")

#                        sep = "")
afhankelijkeVar = data$Bwt
onafhanekelijkeVar = data$Hwt

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
lm(afhankelijkeVar ~ onafhanekelijkeVar)

plot(x = onafhanekelijkeVar, xlab = "Gewicht hart(kg)",
     y = afhankelijkeVar, ylab = "Lichaamsgewicht(kg)")

regression <- lm(afhankelijkeVar ~ onafhanekelijkeVar)
abline(regression,
       col = 'red')
legend(2,18, legend="Regressierechte", col = "red", lty=1:2, cex=0.8)

# ---------------------------------------------- Correlatie - covariantie ----------------------------------------------

mx <- mean(onafhanekelijkeVar)
my <- mean(afhankelijkeVar)

plot(onafhanekelijkeVar,afhankelijkeVar)
abline(h = my, col = 'red')
abline(v = mx, col = 'red')

print("Covariantie")
cov(onafhanekelijkeVar, afhankelijkeVar)

print("Corolatiecoëfficient")
correlation = cor(onafhanekelijkeVar, afhankelijkeVar)
correlation

regression <- lm(afhankelijkeVar ~ onafhanekelijkeVar)
abline(regression,
       col = 'blue')
legend(2,19.5, legend=c("Regressierechte","Kwadranten"), col = c("blue","red"), lty=1:2, cex=0.8)

print("Determinatiecoëfficient")
correlation^2
