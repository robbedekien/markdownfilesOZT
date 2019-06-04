# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
dev.off()
library(lsr)

# ============================================= T-test (dataset) ===========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

read = read.csv('locatieFile')
data = c(400,350,400,500,300,350,200,500,200,250,250,500,350,100)
populatieGem =300
alpha = 0.05



# ---------------------------------------------- Berekeningen ----------------------------------------------

steekproefGem = mean(data)
print(paste('Steekproefgemiddelde: ',steekproefGem))

if(steekproefGem < populatieGem){
  soort = "less"
}else{
  soort = "greater"
}

test = t.test(data,alternative = soort,df = length(data) - 1,conf.level = 1-alpha,mu = populatieGem)


p = test$p.value

sd = sd(data)

g = populatieGem + qt(1-alpha,df=length(data) - 1)* sd/sqrt(length(data))



if(steekproefGem < populatieGem){

  print("Eenzijdig links")
  if(steekproefGem > g ){
    print("H0 niet verwerpen!")
    print(paste("Steekproefgemiddelde (",steekproefGem,") > g (",g,") -> Steekproefgemiddelde ligt NIET in verwerpingsgebied"))
    verwerpenKritiekgeb = FALSE;
  }else{
    print("H0 verwerpen!")
    print(paste("Steekproefgemiddelde (",steekproefGem,") < g (",g,") -> Steekproefgemiddelde ligt in verwerpingsgebied"))
    verwerpenKritiekgeb = TRUE;
  }
}else{
  print("Eenzijdig rechts")
  if(steekproefGem < g ){
    print("H0 niet verwerpen!")
    print(paste("Steekproefgemiddelde (",steekproefGem,") < g (",g,") -> Steekproefgemiddelde ligt NIET in verwerpingsgebied"))
    verwerpenKritiekgeb = FALSE;
  }else{
    print("H0 verwerpen!")
    print(paste("Steekproefgemiddelde (",steekproefGem,") > g (",g,") -> Steekproefgemiddelde ligt in verwerpingsgebied"))
    verwerpenKritiekgeb = TRUE;
  }
}

if(p < alpha){
  print("H0 verwerpen!")
  print(paste("p-waarde (",p,") < significantieniveau (α)! (",alpha,")"))
  verwerpenPWaarde= TRUE;

}else{
  print("H0 niet verwerpen!")
  print(paste("p-waarde (",p,") > significantieniveau (α)! (",alpha,")"))
  verwerpenPWaarde= FALSE;
}
