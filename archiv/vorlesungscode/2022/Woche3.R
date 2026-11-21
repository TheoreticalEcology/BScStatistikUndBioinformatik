# BSc Biostatistik

# Woche 3, Hypothesentests
# Mit diesem Skript können Sie die in der Vorlesung dargestellten R Ergebnisse selbst nachrechnen

# Für des Einlesen der echten Daten
daten <- read.csv("Woche1/Biostatistik Umfrage 2022 Randomisiert.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL
colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Wohnform", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "CO2_Steuer", "Parkplatzgebühr", "Atomkraftwerke", "CRISPR-Cas")


# Kat + Kat 

x = table(daten$Vegetarier, daten$Verkehrsmittel)
barplot(x, beside = T)

prop.test(t(x))

x = table(daten$Geschlecht, daten$Vegetarier)
barplot(x, beside = T, las = 2)

prop.test(x)

# Kat + Num
boxplot(Körpergröße ~ Geschlecht, data = daten, col = "lightgrey")

t.test(Körpergröße ~ Geschlecht, data = daten)

# test for normality 
shapiro.test(daten$Körpergröße[daten$Geschlecht == "Weiblich"])
shapiro.test(daten$Körpergröße[daten$Geschlecht == "Männlich"])

# Zweites Beispiel
boxplot(Körpergröße ~ Händigkeit, data = daten, notch = T, col = "lightgrey")
library(beeswarm)
beeswarm(Körpergröße ~ Händigkeit, data = daten, add = T, pwcol = daten$Geschlecht)

t.test(Körpergröße ~ Händigkeit, data = daten)


# p-Wert würde kleiner wenn man ein-seitig testet, sollte man aber nur 
# a priori und nicht auf Grundlage der Plots machen, weil letzteres 
# verdecktes multiples Testen ist
t.test(Körpergröße ~ Händigkeit, data = daten, alternative = "less")

# Power

sd(daten$Körpergröße)

# nehme vereinfacht an, dass 4 Beobachten je Gruppe gab. Ungleiche Gruppen hat die Funktion leider nicht. Wie viel n bräuchten wir bei der gegeben Streuung, um eine Power von 80% zu erreichen?
power.t.test(delta = 2, sd = 8, power = 0.8)


# num + num

plot(Körpergröße ~ Einwohner, data =daten)
cor(daten$Einwohner, daten$Körpergröße, use = "complete.obs")

fit <- lm(Körpergröße ~ Einwohner, data =daten)
abline(fit, col = "red", lwd = 2)

cor.test(daten$Einwohner, daten$Körpergröße, use = "complete.obs")








