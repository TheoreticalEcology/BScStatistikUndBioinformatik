library(EcoData)
plot(loght ~ temp, data = plantHeight)

cor.test(plantHeight$loght, plantHeight$temp)

fit = lm(loght ~ temp, data = plantHeight)
summary(fit)
abline(fit, col = "red")

library(effects)
plot(allEffects(fit))


library(EcoData)
plantHeight$growthform2 = relevel(as.factor(plantHeight$growthform), "Tree")

plot(loght ~ growthform2, data = plantHeight, las = 2)

fit = lm(loght ~ growthform2, data = plantHeight)
summary(fit)
