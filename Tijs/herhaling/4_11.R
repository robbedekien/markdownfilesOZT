n <- 64
populatieGemiddelde <- 20
populatieStandaardAfwijking <- 16


## -------------   a 

steekproefGemiddelde <- populatieGemiddelde
steekproefStandaardAfwijking <- populatieStandaardAfwijking / sqrt(n)

steekproefGemiddelde
steekproefStandaardAfwijking


## -------------   b


## hoe groter de steekproef hoe meer hij de onderliggende verdeling zal benaderen



## -------------   c

# weet niet waarom de steekproefafwijking moet gebruikt worden en niet de populaiteafwijking zoals de fomrule voorschrijft

zscorevan15_5 <- (15.5 - populatieGemiddelde) / steekproefStandaardAfwijking
zscoreVan23 <-  (23 - populatieGemiddelde) / steekproefStandaardAfwijking

zscorevan15_5
zscoreVan23

## -------------   d

kansSteekproefGemKleinerDan16 <- pnorm(16, populatieGemiddelde, steekproefStandaardAfwijking)
kansSteekproefGemKleinerDan16

## -------------   e

kansSteekproefGemGroterDan23 <- 1 - pnorm(23, populatieGemiddelde, steekproefStandaardAfwijking)
kansSteekproefGemGroterDan23

## -------------   f
kansSteekproefGemKleinerDan16 <- pnorm(16, populatieGemiddelde, steekproefStandaardAfwijking)
kansSteekproefGemKleinerDan22 <- pnorm(22, populatieGemiddelde, steekproefStandaardAfwijking)
kansSteekproefGemTussen16en22 <- kansSteekproefGemKleinerDan22 - kansSteekproefGemKleinerDan16

kansSteekproefGemTussen16en22
