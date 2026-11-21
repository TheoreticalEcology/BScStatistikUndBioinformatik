# Für des Einlesen der echten Daten
daten <- read.csv("./Woche1/Biostatistik Umfrage 2022.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL
colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Wohnform", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "CO2_Steuer", "Parkplatzgebühr", "Atomkraftwerke", "CRISPR-Cas")


str(daten)

# num + num

plot(daten$Körpergröße, daten$Körpergewicht)

cor.test(daten$Körpergewicht, daten$Körpergröße, 
    use = "complete.obs", method = "spearman")

fit <- lm(Körpergewicht ~ Körpergröße, data = daten)
summary(fit)
abline(fit, col = "red")

library(effects)
plot(allEffects(fit, partial.residuals = T))



plot(daten$Einwohner, daten$Körpergewicht)

fit <- lm(Körpergewicht ~ Einwohner, data = daten)
summary(fit)
abline(fit, col = "red")

library(effects)
plot(allEffects(fit, partial.residuals = T))


# num + kat


boxplot(Körpergewicht ~ Geschlecht, data = daten, notch = T)

fit <- lm(Körpergewicht ~ Geschlecht, data = daten)
summary(fit)


boxplot(as.numeric(daten$Studium) ~ daten$Geschlecht, notch = T)

x = table(daten$Studium, daten$Geschlecht)
prop.test(x)


boxplot(Körpergewicht ~ Verkehrsmittel, data = daten, notch = T)
fit <- lm(Körpergewicht ~ Verkehrsmittel, data = daten)
summary(fit)








cor.test(daten$Körpergewicht, daten$Körpergröße, 
         use = "complete.obs", method = "spearman")

fit = lm(Körpergewicht ~ Körpergröße, data = daten)
summary(fit)

library(effects)
plot(allEffects(fit, partial.residuals = T))

# num + kat

par(mfrow = c(1,1))

boxplot(daten$Körpergröße..in.cm. ~ daten$Biologisches.Geschlecht)

t.test(daten$Körpergröße..in.cm. ~ daten$Biologisches.Geschlecht)

fit = lm(Körpergröße..in.cm. ~ Biologisches.Geschlecht, data = daten)
summary(fit)

boxplot(daten$Körpergewicht..kg. ~ daten$Abends.trinke.ich.am.liebsten)

fit = lm(Körpergewicht..kg. ~ Abends.trinke.ich.am.liebsten, data = daten)
summary(fit)

summary(aov(fit))
