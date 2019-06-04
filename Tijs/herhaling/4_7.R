# --------------------- dichtheid ----------------

x <- seq(-4, 4, length = 200)
y <- dt(x, 0, 1, df = 3)
plot(x , y, type='l', main = "dichtheid")




# --------------------- commulatieve kans ----------------



y <- pt(x, df = 3)
plot (y, type = 'l', main = "cummulatieve kans")
