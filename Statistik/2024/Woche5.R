library(EcoData)

str(titanic)
titanic$fSex = factor(titanic$sex)
titanic$fPclass = factor(titanic$pclass)


boxplot(age ~ fSex, data = titanic, notch = T)

fit = lm(age ~ sex, data = titanic)
summary(fit)

fit = lm(age ~ sex + fPclass , data = titanic)
summary(fit)

library(effects)
plot(allEffects(fit))

fit = lm(age ~ sex * fPclass , data = titanic)
summary(fit)

library(effects)
plot(allEffects(fit))


plot(loght ~ lat  , data = plantHeight)
plot(loght ~ NPP  , data = plantHeight)

fit <- lm(loght ~ lat  , data = plantHeight)
summary(fit)

fit <- lm(loght ~ lat + NPP + temp , data = plantHeight)
summary(fit)

summary(aov(fit))

# vorsicht! Reihenfolge macht einen Unterschied
fit <- lm(loght ~ NPP + temp + lat, data = plantHeight)
summary(aov(fit))


m1 <- lm(loght ~ NPP + temp , data = plantHeight)
m2 <- lm(loght ~ NPP + temp + lat , data = plantHeight)
AIC(m1)
AIC(m2)



