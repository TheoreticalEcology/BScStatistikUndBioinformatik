library(EcoData)
plantHeight$growthform2 = relevel(as.factor(plantHeight$growthform), "Tree")

plot(loght ~ temp, data = plantHeight)

plot(loght ~ temp, data = plantHeight, col = as.numeric(plantHeight$growthform2))


fit <- lm(loght ~ temp, data = plantHeight)
summary(fit)

abline(fit)

library(effects)
plot(allEffects(fit))
plot(allEffects(fit, partial.residuals = T))


plot(loght ~ growthform2, data = plantHeight, las = 2)

fit = lm(loght ~ growthform2, data = plantHeight)
summary(fit)

# Residuen 


fit <- lm(loght ~ temp, data = plantHeight)
par(mfrow = c(2,2))
plot(fit)

plot(allEffects(fit, partial.residuals = T))
