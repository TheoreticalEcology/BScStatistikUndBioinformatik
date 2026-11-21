2+2
sqrt(2)
x = 2
x
x = c(1,2,3,4,1,3)
mean(x)
sd(x)
sqrt(var(x))
plot(x)
barplot(x)


daten <- read.csv("../Daten/Biostatistik Umfrage 2023.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL

colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "Zukunft", "CO2Steuer", "Parkgebuehr")
summary(daten)

daten <- missRanger::missRanger(daten, pmm.k = 3)
summary(daten)

# Deskriptive Statistik 

x = table(daten$Getränk)
barplot(x, las = 2)
pie(x)

x = table(daten$Verkehrsmittel)
x
barplot(x, las = 2)

x = table(daten$Geschlecht)
x
barplot(x, las = 2, col = c("red", "blue"))

x = table(daten$Händigkeit)
x
barplot(x, las = 2)

x = table(daten$Vegetarier)
x
barplot(x, las = 2)

hist(daten$Distanz, breaks = 100)
hist(log10(daten$Distanz + 1), breaks = 100)

mean(daten$Distanz)
median(daten$Distanz)
var(daten$Distanz)
sd(daten$Distanz)
quantile(daten$Distanz)
boxplot(daten$Distanz, ylim = c(0,1000))

x = daten$Einwohner
summary(x)
hist(x, breaks = 100)
boxplot(x, ylim = c(0,1000000))

x = daten$Körpergröße
summary(x)
hist(x, breaks = 100)
boxplot(x)

x = daten$Körpergewicht
summary(x)
hist(x, breaks = 100)
boxplot(x)


x = table(daten$Parkgebuehr)
barplot(x)
mean(daten$Parkgebuehr)

x = table(daten$Studium)
barplot(x)

x = table(daten$Zukunft)
barplot(x)

x = table(daten$CO2Steuer)
barplot(x)

