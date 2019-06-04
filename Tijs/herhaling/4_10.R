populatieGemiddelde <- 183
populatieStandaardAfwijking <- 36
n <- 81


# er wordt gevraagd naar het steekproefgemiddelde, 
# afwijking dus delen door wortel n

kansKleiner185 <- pnorm(185, mean = populatieGemiddelde, sd = populatieStandaardAfwijking/sqrt(n))
kansTussen175en185 <- kansKleiner185 - pnorm(175, mean = populatieGemiddelde, sd = populatieStandaardAfwijking/sqrt(n))
kansGroterDan190 <- 1 - pnorm(190, mean = populatieGemiddelde, sd = populatieStandaardAfwijking/sqrt(n))

kansKleiner185
kansTussen175en185
kansGroterDan190