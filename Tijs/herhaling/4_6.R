linksValue <- 0.5
rechtsValue <- 4
popMean <- 2.5
popDev <- 1.5

kansOpLinks <- pnorm(linksValue, popMean, popDev)
kansOpRechts <- pnorm(rechtsValue, popMean, popDev)


kansTuseen <- kansOpRechts - kansOpLinks
kansTuseen



# in te geven in script: "normaalverdeling(steekrproef groot genoeg)


"Hier MOET n > 30!"
gemiddelde = 2.5
sd = 1.5

#G1 mag je leeg laten indien je een linker staartkans wenst te doen. vb: g1 = ""
g1 = 0.5
#Gebied 2 MOET groter zijn dan gebied 1!
g2 = 4
