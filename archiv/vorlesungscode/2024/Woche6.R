library(EcoData)

fit <- glm(survived ~ age, data = titanic, family = binomial)
summary(fit)

library(effects)
plot(allEffects(fit))

curve(plogis, -4,4)
plogis(-0.136531)

plot(feeding ~ attractiveness, data = birdfeeding)

fit <- glm(feeding ~ attractiveness, data = birdfeeding, family = poisson)

summary(fit)
plot(allEffects(fit))

# Poisson ohne Link funktion
fit <- glm(feeding ~ attractiveness, data = birdfeeding, family = poisson(link = "identity"))

summary(fit)


# ANOVA, R2, Modellselektion 


fit <- glm(survived ~ age, data = titanic, family = binomial)
summary(fit)

# pseudo R2 = 
1 - 1411.4/1414.6

fit2 <- glm(survived ~ age + sex + factor(pclass), data = titanic, family = binomial)
summary(fit2)

# pseudo R2 = 
1 - 982.45/1414.6

# Vergleich der Modelle entweder mit AIC oder ANOVA

AIC(fit)
AIC(fit2)

anova(fit, fit2, test = "Chisq")

# test fuer jeden Parameter einzeln
anova(fit2, test = "Chisq")



