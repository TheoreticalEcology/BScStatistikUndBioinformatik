library(EcoData)

str(titanic)

titanic$pclass = factor(titanic$pclass, labels = c("1.Kl", "2.Kl", "3.Kl"))
titanic$sex = factor(titanic$sex)
titanic$embarked = factor(titanic$embarked)
titanic$survived = factor(titanic$survived, labels = c("died", "survived"))

x = table(titanic$survived, titanic$sex)
x
barplot(x, beside = T)
prop.test(x)
chisq.test(x)

boxplot(age ~ sex, data = titanic, las = 2, notch = T)

shapiro.test(titanic$age[titanic$sex == "female"])
hist(titanic$age[titanic$sex == "female"])
shapiro.test(titanic$age[titanic$sex != "female"])

wilcox.test(titanic$age[titanic$sex == "female"],
            titanic$age[titanic$sex == "male"])

# weniger daten = weniger Power
titanic2 = titanic[sample.int(nrow(titanic), 300), ]

wilcox.test(titanic$age[titanic2$sex == "female"],
            titanic$age[titanic2$sex == "male"])

t.test(titanic$age[titanic$sex == "female"],
            titanic$age[titanic$sex == "male"])

str(plantHeight)

plot(loght ~ temp, data = plantHeight)
cor.test(plantHeight$loght, plantHeight$temp)
cor.test(plantHeight$loght, plantHeight$temp, method = "spearman")


