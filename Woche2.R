library(effects)
head(TitanicSurvival)

x = table(TitanicSurvival$sex, TitanicSurvival$passengerClass)
x
barplot(x)
barplot(x, beside = T)
image(x)
mosaicplot(x)

t(x) # transpose
barplot(t(x))
mosaicplot(t(x))


boxplot(age~passengerClass, data = TitanicSurvival)
boxplot(age~passengerClass, data = TitanicSurvival, notch = T)
boxplot(age~passengerClass, data = TitanicSurvival, notch = T,
        ylim = c(0,100))
text(1:3, rep(90,3), paste("n=", table(TitanicSurvival$passengerClass)))

library(beeswarm)
beeswarm(age~passengerClass, data = TitanicSurvival,
         add = T, pch = 16, cex = 0.3)


head(iris)
plot(Sepal.Length~Petal.Length, data = iris)
cor(iris$Sepal.Length, iris$Petal.Length)
cor.test(iris$Sepal.Length, iris$Petal.Length)

cor(iris$Sepal.Length, iris$Petal.Length, method = "spearman")



iris$Sepal.Length[1] = 100

plot(Sepal.Length~log(Petal.Length), data = iris)
cor(iris$Sepal.Length, log(iris$Petal.Length))
cor(iris$Sepal.Length, log(iris$Petal.Length), method = "spearman")

head(airquality)

pca = prcomp(airquality[complete.cases(airquality),1:4], scale = TRUE)
biplot(pca)

