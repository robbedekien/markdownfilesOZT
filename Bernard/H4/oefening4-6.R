# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ========================================= Normaalverdeling met n > 30 ! ========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

"Hier MOET n > 30!"
gemiddelde = 2.5
sd = 1.5

#G1 mag je leeg laten indien je een linker staartkans wenst te doen. vb: g1 = ""
g1 = 0.5
#Gebied 2 MOET groter zijn dan gebied 1!
g2 = 4


# ---------------------------------------------- Berekeningen ----------------------------------------------

if(g1 == ""){
  perc = pnorm(g2,mean = 2.5,sd=sd)
}else{
  perc = pnorm(g2,mean = 2.5,sd=sd) - pnorm(g1,mean=2.5,sd=sd)
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

