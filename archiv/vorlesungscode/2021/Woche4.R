
fit <- lm(weight ~ 0 + group, data = PlantGrowth)
summary(fit)

library(brms)
fit <- brm(weight ~  group, data = PlantGrowth)
summary(fit)
plot(fit)
