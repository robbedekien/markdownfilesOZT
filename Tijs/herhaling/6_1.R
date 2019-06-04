data <- read.csv("C:\\Users\\tijsm\\Google Drive\\HoGent 2018-2019\\2e semester\\Onderzoekstechnieken\\files\\onderzoekstechnieken-cursus\\oefeningen\\data\\hfst6_2variabelen\\MuziekWijn.csv")
data



## ---------------------   c

table <- table(data)

chisq.test(table)


## ---------------------   d

cramersV(table)

# een cramrs v van 0.19 toont aan dat er een matig verband is.




# zie script van bernaard "CramersV en Chisq _Bernard"