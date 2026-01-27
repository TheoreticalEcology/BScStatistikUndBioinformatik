library(EcoData)

#str(titanic)
titanic$fSex = factor(titanic$sex)
titanic$fPclass = factor(titanic$pclass)


boxplot(age ~ fSex, data = titanic, notch = T)

fit = lm(age ~ sex, data = titanic)
summary(fit)
library(effects)
plot(allEffects(fit))



fit = lm(age ~ sex + pclass, data = titanic)
summary(fit)
library(effects)
plot(allEffects(fit))

fit = lm(age ~ sex * pclass, data = titanic)
summary(fit)
library(effects)
plot(allEffects(fit))


library(EcoData)
plot(loght ~ lat  , data = plantHeight)
plot(loght ~ NPP  , data = plantHeight)

fit1 <- lm(loght ~ lat  , data = plantHeight)
summary(fit1)

fit2 <- lm(loght ~ lat + NPP  , data = plantHeight)
summary(fit2)


summary(aov(fit))

AIC(fit1)
AIC(fit2)



