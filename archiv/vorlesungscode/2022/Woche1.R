2+2
sqrt(3)
(2+2)*2

x = 5

var1 = c(1,2,3,4)

mean(var1)
sd(var1)

# Das ist ein Kommentar

quantile(var1)

var2 = factor(c("rot", "gelb", "gruen", "blau"))

class(var1)
class(var2)

dat = data.frame(var1 = var1, var2 = var2)

# Zugriff über $
dat$var1

# Für des Einlesen der echten Daten
daten <- read.csv("./Biostatistik Umfrage 2022.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL
colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Wohnform", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "CO2_Steuer", "Parkplatzgebühr", "Atomkraftwerke", "CRISPR-Cas")

# Für das Einlesen der randomisierten Daten
daten = read.csv(file = "./Biostatistik Umfrage 2022 Randomisiert.csv")

x = table(daten$Verkehrsmittel)
barplot(x)
pie(x)

x = table(daten$Getränk)
x
barplot(x)
pie(x)

x = table(daten$Wohnform)
x
par(mar = c(4,15,4,4))
barplot(x, las = 2, horiz = T)

table(daten$Händigkeit)
table(daten$Vegetarier)
table(daten$Geschlecht)

hist(daten$Distanz, breaks = 20)

mean(daten$Distanz)
median(daten$Distanz)
sd(daten$Distanz)
quantile(daten$Distanz)
var(daten$Distanz)

hist(daten$Körpergröße, breaks = 20)
mean(daten$Körpergröße)
median(daten$Körpergröße)
quantile(daten$Körpergröße[daten$Geschlecht == "Weiblich"])
boxplot(daten$Körpergröße)
