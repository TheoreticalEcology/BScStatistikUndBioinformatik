daten <- read.csv("../Daten/Biostatistik Umfrage 2023.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL

colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "Zukunft", "CO2Steuer", "Parkgebuehr")

daten <- missRanger::missRanger(daten, pmm.k = 3)

boxplot(Körpergewicht ~ Vegetarier, data = daten)
x = table(daten$Geschlecht, daten$Vegetarier)
prop.test(x)

fit <- lm(Körpergewicht ~ Vegetarier, data = daten)
summary(fit)

fit <- lm(Körpergewicht ~ Vegetarier + Geschlecht, data = daten)
summary(fit)

fit <- lm(Körpergewicht ~ Verkehrsmittel, data = daten)
summary(fit)

table(daten$Verkehrsmittel, daten$Geschlecht)

fit <- lm(Körpergewicht ~ Verkehrsmittel + Geschlecht + Distanz, data = daten)
summary(fit)


fit <- lm(Körpergewicht ~ Körpergröße * Geschlecht , data = daten[-32,])
summary(fit)
plot(allEffects(fit))
par(mfrow = c(2,2))
plot(fit)


fit <- lm(Körpergewicht ~ Körpergröße * Verkehrsmittel , data = daten[-32,])
summary(fit)
plot(allEffects(fit))
par(mfrow = c(2,2))
plot(fit)
