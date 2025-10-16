2 + 2
sqrt(2)
curve(exp, 0, 5)
barplot(c(1,2,3))

var1 = 5
var1 = c(4,6,3,2)
str(var1)
var2 = c("rot", "grün", "blau", "rot")
str(var2)
var2 = factor(var2)
str(var2)

mean(var1)
median(var1)

mean(var2)
table(var2)

dat = data.frame(groesse = var1, farbe = var2)

# Das hier ist ein Kommentar! 

# Hilfe bekommnt man über ?Funktion oder Maus drauf und F1
# Mehr Hilfe im Internet oder KI 


x = rlnorm(2000)
hist(x, breaks = 50)
mean(x)

y = replicate(2000,mean(rlnorm(2000)))
hist(y, breaks = 50)


library(EcoData)

str(titanic)
View(titanic)

titanic$pclass
titanic$pclass = factor(titanic$pclass)

x = table(titanic$pclass)
x
barplot(x)

titanic$age

hist(titanic$age)
summary(titanic$age)
boxplot(titanic$age)

var(titanic$age, na.rm = T)
sd(titanic$age, na.rm = T)


