# Für des Einlesen der echten Daten
daten <- read.csv("../Woche1/Biostatistik Umfrage 2022.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL
colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Wohnform", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "CO2_Steuer", "Parkplatzgebühr", "Atomkraftwerke", "CRISPR-Cas")


x = table(daten$Geschlecht, daten$Getränk)
barplot(x, beside = T, las = 2)

mosaicplot(x)

x = table(daten$Vegetarier, daten$Geschlecht)
barplot(x, beside = T, las = 2)
mosaicplot(t(x))

boxplot(Körpergröße~Vegetarier, data = daten, notch = T)

boxplot(CO2_Steuer~Geschlecht + Vegetarier, data = daten, notch = T, las = 2)

plot(Körpergewicht ~ Körpergröße, data = daten)

cor(daten$Körpergröße, daten$Körpergewicht, use = "complete.obs")
cor.test(daten$Körpergröße, daten$Körpergewicht, use = "complete.obs")

cor(daten$Körpergröße, daten$Körpergewicht, use = "complete.obs", method = "spearman")

plot(log(Einwohner) ~ Distanz, data = daten)

cor(log(daten$Einwohner), daten$Distanz)
cor(log(daten$Einwohner), daten$Distanz, method = "spearman" )

