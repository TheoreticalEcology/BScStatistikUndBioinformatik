2+2
sqrt(5)
barplot(c(1,2,3))

var1 = 5
var1 = c(1,2,3)
var2 = factor(c("rot", "gruen", "blau"))

mean(var1)
mean(var2)

dat = data.frame(var1 = var1, var2 = var2)
dat$var1
str(dat)

#########################################

x = rlnorm(500)
hist(x, breaks = 50)

y = replicate(2000,mean(rlnorm(2000)))
hist(y, breaks = 50)

#########################################

library(EcoData)

str(titanic)

titanic$pclass = factor(titanic$pclass)
x = table(titanic$pclass)
x
barplot(x)
barplot(x, las = 2, horiz = T, col = c("darkred"))

x = table(titanic$sex)
x
barplot(x)

hist(titanic$age)
hist(titanic$age[titanic$pclass == 3])

mean(titanic$age, na.rm = T)
median(titanic$age, na.rm = T)
var(titanic$age, na.rm = T)
sd(titanic$age, na.rm = T)

quantile(titanic$age, na.rm = T)
boxplot(titanic$age)

library(moments)
skewness(titanic$age, na.rm = T)
