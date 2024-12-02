library(EcoData)

str(titanic)

titanic$pclass = factor(titanic$pclass, labels = c("1.Kl", "2.Kl", "3.Kl"))
titanic$sex = factor(titanic$sex)
titanic$embarked = factor(titanic$embarked)


x = table(titanic$sex, titanic$pclass)
barplot(x, beside = T)

# prop.test erfordert 2 spalten, schaut auf proportionen 
prop.test(t(x))


x = table(titanic$embarked, titanic$pclass)
barplot(x, beside = T)

# fuer generelle Kreuztabelle mit > 2 spalten
chisq.test(x)



shapiro.test(titanic$age[titanic$pclass == "1.Kl"])
shapiro.test(titanic$age[titanic$pclass == "2.Kl"])

x = boxplot(age~pclass, data = titanic)
library(beeswarm)
beeswarm(age~pclass, data = titanic, add = T, pwpch = rep(16, nrow(titanic)), pwcex = rep(0.6, nrow(titanic)), pwcol = rep(2, nrow(titanic)))

library(vioplot)
vioplot(age~pclass, data = titanic)


t.test(titanic$age[titanic$pclass == "1.Kl"], titanic$age[titanic$pclass == "2.Kl"])

t.test(titanic$age[titanic$pclass == "1.Kl"], titanic$age[titanic$pclass == "2.Kl"])


wilcox.test(titanic$age[titanic$pclass == "1.Kl"], titanic$age[titanic$pclass == "2.Kl"])


t.test(titanic$age[titanic$pclass == "1.Kl"], titanic$age[titanic$pclass == "2.Kl"])

t.test(titanic$age[titanic$pclass == "1.Kl"], titanic$age[titanic$pclass == "2.Kl"], alternative = "greater")



plot(loght ~ lat, data = plantHeight)
cor.test(plantHeight$loght, plantHeight$lat)




