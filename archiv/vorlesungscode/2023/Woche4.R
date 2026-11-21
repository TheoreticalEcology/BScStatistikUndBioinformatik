plot(daten$Körpergröße, daten$Körpergewicht)

cor.test(daten$Körpergewicht, daten$Körpergröße, 
         use = "complete.obs", method = "spearman")

fit <- lm(Körpergewicht ~ Körpergröße, data = daten[daten$Körpergewicht< 100,])
summary(fit)

plot(daten$Körpergröße, daten$Körpergewicht)
abline(fit, col = "red")

library(effects)
plot(allEffects(fit, partial.residuals = T))

fit <- lm(Körpergewicht ~ Körpergröße + I(Körpergröße^2), data = daten[daten$Körpergewicht< 100,])
summary(fit)

library(effects)
plot(allEffects(fit, partial.residuals = T))



plot(daten$Zukunft, daten$Körpergröße)

fit <- lm(Körpergröße ~ Zukunft , data = daten)
summary(fit)


boxplot(Körpergewicht ~ Geschlecht , data = daten)
fit <- lm(Körpergewicht ~ Geschlecht , data = daten)
summary(fit)


boxplot(log10(Distanz + 1) ~ Verkehrsmittel , data = daten)
fit <- lm(log10(Distanz + 1) ~ Verkehrsmittel , data = daten)
summary(fit)
anova(fit)

hist(log10(daten$Distanz + 1))
var(log10(daten$Distanz + 1))

hist(resid(fit))
var(resid(fit))
