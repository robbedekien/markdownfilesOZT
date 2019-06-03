# Clearen: plot, console, environment
rm(list=ls())
cat("\014")
library(lsr)

# ========================================= Analyse op 1 variabele =========================================

# --------------------------------------------- Input Gegevens ---------------------------------------------

# Geen fequentie tabel!
#data <- c(1:21) - deel 1
#data <- rnorm(n = 50, mean = 0, sd = 1) - deel 2
#data <- women$height - deel 3.1
data <- women$weight # - deel 3.2

# Gaat de data over een steekproef of de populatie? indien steekproef -> TRUE 
steekproef = TRUE

# ---------------------------------------------- Berekeningen ----------------------------------------------


# Gemiddelde
print(paste('Gemiddelde:        ',mean(data)))

# Mediaan
print(paste('Mediaan:           ',median(data)))

# Range
print(paste('Range:             ',abs(max(data) - min(data))))

# Kwartielen
print(paste('Q1:                ',quantile(data,0.25)))

print(paste('Q3:                ',quantile(data,0.75)))

# Kwartielafstand
print(paste('Kwartielafstand:   ',abs(quantile(data,0.75) - quantile(data,0.25))))

# Min & Max
print(paste('Min:               ',min(data)))
print(paste('Max:               ',max(data)))


# Modus
modus <- function(v) {
  uniqv <- unique(v) 
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
m = modus(data);

aantalm=sum(data == m)

if(aantalm == 1 ){
  print(paste('Modus:             ','Alle elementen komen evenveel voor!'))
}else{
  print(paste('Modus:             ',m,'(aantal voorkomens: ',aantalm,')'))
}


#Steekproef of populatie

if(steekproef){
  # Variantie
  print(paste('VAR:           ',var(data)))
  # Standaarddeviatie 
  print(paste('STD:           ',sd(data)))
  
}else{
  # standaarddeviatie voor steekproef
  
  g = mean(data)
  s=0
  for (v in data) {
    i=g-v
    s = s + i^2
  }
  var=s/(length(data))
  
  # Variantie
  print(paste('VAR:           ',var))
  # Standaarddeviatie 
  print(paste('STD:           ',sqrt(var)))
}
