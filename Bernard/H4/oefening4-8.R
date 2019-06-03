mean <- 0
sd <- 1.0
n <- 25

#rnorm creert willekeurige steekproef
collection <- rnorm(n, mean = mean, sd=sd)

hist(x = collection, probability = TRUE)
lines(density(x=(collection)),col="red")
