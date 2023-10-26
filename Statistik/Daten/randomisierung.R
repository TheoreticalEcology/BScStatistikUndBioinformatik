

# 2022 --------------------------------------------------------------------


daten <- read.csv("./Biostatistik Umfrage 2022.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL
colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Wohnform", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "CO2_Steuer", "Parkplatzgebühr", "Atomkraftwerke", "CRISPR-Cas")



daten = daten[,-1]
for(i in 1:ncol(daten)){
  sel = sample.int(nrow(daten), nrow(daten))
  daten[,i] = daten[sel,i]
}

pairs(daten)

write.csv(daten, file = "./Biostatistik Umfrage 2022 Randomisiert.csv")

x = rnorm(10)
x
sqrt(length(x)) * mean(x) / sd(x)
dt(x, df, ncp, log = FALSE)
curve(dt(x, df = 9), from = -3, to = 3, ylab = "Wahrscheinlichkeit", xlab = "Mittelwert")
abline(h=0)


# 2023 --------------------------------------------------------------------

daten <- read.csv("../Daten/Biostatistik Umfrage 2023.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL

colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "Zukunft", "CO2Steuer", "Parkgebuehr")
summary(daten)

daten <- missRanger::missRanger(daten, pmm.k = 3)

daten = daten[,-1]
for(i in 1:ncol(daten)){
  sel = sample.int(nrow(daten), nrow(daten))
  daten[,i] = daten[sel,i]
}

# install.packages("synthpop")
library(synthpop)
out = syn(daten)

daten = out$syn

write.csv(daten, file = "../Daten/Biostatistik Umfrage-2023-Randomisiert.csv")
