library(effects)
head(TitanicSurvival)

View(TitanicSurvival)

# Kategorisch vs kategorisch
kreuz = table(TitanicSurvival$sex, TitanicSurvival$passengerClass)
print(kreuz)

barplot(kreuz)
legend("topleft", legend = c("Male", "Female"), col = c("gray", "black"), pch = 15)

kreuz = table(TitanicSurvival$passengerClass, TitanicSurvival$sex)
barplot(kreuz, beside = TRUE)

mosaicplot(kreuz)


# Kategorisch vs numerisch
## Erinnerung boxplot, auf der X - Achse kategorische Variable
boxplot(age~passengerClass, data = TitanicSurvival)

## Mit Notch
boxplot(age~passengerClass, data = TitanicSurvival, notch = TRUE)

par(mar = c(7, 5, 3, 1))
boxplot(age~passengerClass+sex, data = TitanicSurvival, notch = TRUE, las = 2, xlab = "")


# Numerisch vs numerisch
head(iris)
plot(Sepal.Length~Petal.Length, data = iris)
cor(iris$Sepal.Length, iris$Petal.Length)
cor(iris$Sepal.Length, iris$Petal.Length, method = "spearman")

plot(Sepal.Length~log(Petal.Length), data = iris)
cor(iris$Sepal.Length, log(iris$Petal.Length))
cor(iris$Sepal.Length, log(iris$Petal.Length), method = "spearman")

cor.test(iris$Sepal.Length, iris$Petal.Length, method = "pearson")

# PCA
pca = prcomp(airquality[complete.cases(airquality),1:4], scale = TRUE)
biplot(pca)


