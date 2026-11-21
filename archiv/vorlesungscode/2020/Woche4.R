daten <- read.csv("Biostatistik Umfrage 2020.csv", sep=";")

fit <- lm(log(Körpergewicht..kg.) ~ Körpergröße..in.cm., data = daten)
summary(fit)

plot(log(Körpergewicht..kg.) ~ Körpergröße..in.cm., data = daten)
abline(fit, col = "red", lwd = 2)

plot(fit)


fit <- lm(log(Körpergewicht..kg.) ~ In.die.Uni.komme.ich.am.ehesten.mit.dem, data = daten)
summary(fit)

boxplot(log(Körpergewicht..kg.) ~ In.die.Uni.komme.ich.am.ehesten.mit.dem, data = daten, notch = T)
anova(fit)

#### Das erklären wir im Detail in der nächsten Woche ####

fit <- lm(log(Körpergewicht..kg.) ~ Körpergröße..in.cm. + In.die.Uni.komme.ich.am.ehesten.mit.dem, data = daten)
summary(fit)
