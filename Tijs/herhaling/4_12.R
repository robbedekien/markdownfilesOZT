percentageMobilisten <- 0.85
snelheid <- 50
steekproefGemiddelde <- 43.1
steekproefStandaardAfwijking <- 6.6

procentSnellerDan50 <- pnorm(snelheid, steekproefGemiddelde, steekproefStandaardAfwijking)
procentSnellerDan50 * 100


snelheidOp85 <- qnorm(percentageMobilisten, steekproefGemiddelde, steekproefStandaardAfwijking)
snelheidOp85