daten <- read.csv("../Daten/Biostatistik Umfrage 2023.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL

colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "Zukunft", "CO2Steuer", "Parkgebuehr")

daten <- missRanger::missRanger(daten, pmm.k = 3)

x = table(daten$Geschlecht, daten$Vegetarier)
x
barplot(t(x), beside = T)
barplot(x, beside = F)

mosaicplot(x)

x = table(daten$Geschlecht, daten$Getränk)
x
barplot(x, beside = T, las = 2)

x = table(daten$Geschlecht, daten$Verkehrsmittel)
x
barplot(x, beside = T, las = 2)
mosaicplot(t(x))


x = table(daten$Geschlecht, daten$Studium)
x
barplot(t(x), beside = T, las = 2)
mosaicplot(x)




plot(daten$Körpergröße, daten$Körpergewicht)



cor(daten$Körpergröße, daten$Körpergewicht)
cor(daten$Körpergröße, daten$Körpergewicht, method = "spearman")

sel = daten$Körpergröße > 150
cor(daten$Körpergröße[sel], daten$Körpergewicht[sel])
cor(daten$Körpergröße[sel], daten$Körpergewicht[sel], method = "spearman")


plot(log10(daten$Einwohner+1), daten$Körpergröße)
cor(log10(daten$Einwohner+1), daten$Körpergröße)
cor(log10(daten$Einwohner+1), daten$Körpergröße, method = "spearman")

plot(log10(daten$Einwohner+1), daten$Körpergewicht)
cor(log10(daten$Einwohner+1), daten$Körpergewicht)
cor(log10(daten$Einwohner+1), daten$Körpergewicht, method = "spearman")

plot(daten$Einwohner, daten$Körpergewicht)
cor(daten$Einwohner, daten$Körpergewicht)
cor(daten$Einwohner, daten$Körpergewicht, method = "spearman")


boxplot(Körpergewicht ~ Geschlecht, data = daten)
boxplot(Körpergröße ~ Geschlecht, data = daten)
boxplot(Körpergewicht ~ Getränk, data = daten)
boxplot(Körpergewicht ~ Vegetarier, data = daten)
boxplot(Körpergröße ~ Vegetarier, data = daten)
boxplot(Körpergröße ~ Verkehrsmittel, data = daten)


boxplot(CO2Steuer ~ Verkehrsmittel, data = daten)
boxplot(Parkgebuehr ~ Verkehrsmittel, data = daten)



plot(log10(daten$Einwohner+1), daten$Körpergewicht)
cor(log10(daten$Einwohner+1), daten$Körpergewicht, method = "spearman")

cor(rnorm(80), rnorm(80), method = "spearman")


cor.test(log10(daten$Einwohner+1), daten$Körpergewicht, method = "spearman")
