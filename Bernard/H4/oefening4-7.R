# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================= Normaalverdeling met n < 30 ! ========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

"Hier MOET n < 30!"
gemiddelde = 0
sd = 1
df = 3
#Gebied 1 mag ook leeg zijn voor een linker staartkans: g1 = ""
g1 = ""
#Gebied 2 MOET groter zijn dan gebied 1!
g2 = 0


# ---------------------------------------------- Berekeningen ----------------------------------------------

if (g1 ==""){
  perc = pt(g2,df = df)
}else{
  perc = pt(g2,df = df) - pt(g1,df=df)
}


print(paste("Dichtheid is:     ",round(perc*100,2),"%"))

x = seq(gemiddelde-4*sd, gemiddelde+4*sd, length=200)
dist = dnorm(x, gemiddelde, sd)
plot (x, dist, type = 'l', xlab = '', ylab = '')
title(main="Normaal verdeling")
i <- x <= g2 & x >= g1

polygon(c(g1,x[i], g2),c(0,dist[i],0), col = 'lightgreen')
abline(v=gemiddelde, col='red') 
text(gemiddelde, mean(dist)*1.5, gemiddelde)
text(g1,mean(dist)*0.5,signif(g1, digits=4))
text(g2,mean(dist)*0.5,signif(g2, digits=4))



