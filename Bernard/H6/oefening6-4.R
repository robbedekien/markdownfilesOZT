# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================== Lineaire regressie  ===========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

x <- c(10,12,8,13,9,10,7,14,11,6)
y <- c(11,14,9,13,9,9,8,14,10,6)

afhankelijkeVar = y
onafhanekelijkeVar = x

# ============================================== Berekeningen ==============================================

#--------------------------------------------- Regressie rechte --------------------------------------------

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

plot(x = onafhanekelijkeVar, xlab = "Resultaat test",
     y = afhankelijkeVar, ylab = "Examenresultaat")

regression <- lm(afhankelijkeVar ~ onafhanekelijkeVar)

abline(regression,
       col = 'red')
#--------------------------------- Correlatie- en determinatiecoëfficiënt ----------------------------------
mx <- mean(x)
my <- mean(y)

plot(x,y)
abline(h = my, col = 'red')
abline(v = mx, col = 'red')

print("Covariantie")
cov(x, y)

print("Corolatiecoëfficient")
correlation = cor(x, y)
correlation

regression <- lm(y ~ x)
abline(regression,
       col = 'blue')
legend(6,13.5,legend = "Regressie rechte", col = "blue", lty=1:2, cex=0.8)

print("Determinatiecoëfficient")
correlation^2

