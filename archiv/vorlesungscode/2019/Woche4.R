# BSc Biostatistik

# Woche 4, Regression
# Mit diesem Skript können Sie die in der Vorlesung dargestellten R Ergebnisse selbst nachrechnen

library(effects)

seed(123)

library(animation)
saveGIF({
  
  for (i in 1:30){

  # Wahrer Prozess = Normalverteilung, Mittewert = 0, sd = 1
  curve(dnorm, -3,3, xlab = "Messwert", ylim = c(0,1), main = "Wahrer Prozess")
  abline(v = 0)
  
  
  # Daten = ziehen 20 Werte aus den 
  x = rnorm(20)
  
  curve(dnorm, -3,3, xlab = "Messwert", ylim = c(0,1), main = "Erzeugte Daten")
  abline(v = 0)
  rug(x, col = "darkgreen", lwd = 2)
  
  
  curve(dnorm, -3,3, xlab = "Messwert", ylim = c(0,1), main = "MLE + CI")
  abline(v = 0)
  rug(x, col = "darkgreen", lwd = 2)
  
  
  # Annahme: Normalverteilung. Dann sagt uns die statistische 
  # Theorie, dass der MLE für den Mittewert der Normalverteilung
  # der Mittelwert der Daten ist, und das CI ist der 
  # Standardfehler 
  
  MLE = mean(x)
  CI = sd(x) / sqrt(20) * 1.96 # 1.96 for 95% CI

  
  polygon(x = c(MLE - CI, 
                MLE + CI, 
                MLE + CI, 
                MLE - CI),
          y = c(0,0,1,1), border = NA, col = "#00990022")
  
  abline(v = MLE, col = "red", lwd = 2)
  
  }


}, movie.name = "mle.gif", interval = 1, ani.width = 600)



# Simulieren wir mal wie die Verteilung der Schätzer wäre, wenn 


curve(dnorm, -3,3, xlab = "Messwert", ylim = c(0,3), main = "Verteilung MLE 10000 Experimente")
abline(v = 0)

hist(replicate(10000, mean(x = rnorm(20))), breaks = 50, add = T, freq = F, col = "#99000044")


CI <- function(){
  x = rnorm(20)
  return( (mean(x) + 1.96 * sd(x) / sqrt(20)) < 0 | (mean(x) - 1.96 *  sd(x) / sqrt(20) > 0 ) )
}
CI()

barplot(table(replicate(10000,  CI())) / 10000)
abline(h=0.05)



curve(dlnorm, 0,3, xlab = "Messwert", ylim = c(0,3), main = "Verteilung 10000x Mittelwert 100 Punkte aus Lognormalverteilung")

hist(replicate(10000, mean(x = rlnorm(100))), breaks = 50, add = T, freq = F, col = "#99000044")



#####################################################


# Daten einlesen und anschauen
library(readr)
data <- read_csv("Biostatistik Umfrage 2019.csv", 
                 col_types = cols(`Einwohnerzahl meiner Heimat / Geburtsstadt` = col_character()))
View(data)

####### DATEN SAEUBERN #################

# Punkte und Buchstaben aus dem Datensatz entfernen
data$Einwohner = gsub("[.]", "", data$`Einwohnerzahl meiner Heimat / Geburtsstadt`)
data$Einwohner = as.numeric(data$Einwohner)
data$Distanz = gsub("[a-zA-Z ]", "", data$`Distanz meiner Heimatstadt zu Regensburg (ca., in km)`)
data$Distanz = as.numeric(data$Distanz)
data$Geschlecht = as.factor(data$`Biologisches Geschlecht`)
data$Getraenk = as.factor(data$`Abends trinke ich am liebsten`)
data$Augenfarbe = as.factor(data$`Meine Augenfarbe ist eher`)
data$Transport = as.factor(data$`In die Uni komme ich am ehesten mit dem`)
data$Wohnung = as.factor(data$`Ich wohne`)
data$Studium = as.factor(data$`Mein Studium finde ich`)
library(lubridate)
data$Zeitstempel = ymd_hms(data$Zeitstempel)
  


plot(`Körpergröße (in cm)` ~ Einwohner, data =data)
fit <- lm(`Körpergröße (in cm)` ~ Einwohner, data =data)
abline(fit, col = "red", lwd = 2)
summary(fit)



plot(`Körpergröße (in cm)` ~ Geschlecht, data =data)
fit <- lm(`Körpergröße (in cm)` ~ Geschlecht, data =data)
summary(fit)



plot(`Körpergewicht (kg)` ~ Transport, data =data)
fit <- lm(`Körpergewicht (kg)` ~ Transport, data =data)
summary(fit)
anova(fit)


plot(Distanz ~ Transport, data =data)
fit <- lm(Distanz ~ Transport, data =data)
summary(fit)
anova(fit)


plot(Distanz ~ Wohnung, data =data, las = 2)
fit <- lm(Distanz ~ Wohnung, data =data)
summary(fit)
anova(fit)


plot(`Körpergröße (in cm)` ~ Augenfarbe, data =data, las = 2)
fit <- lm(`Körpergröße (in cm)` ~ Augenfarbe, data =data)
summary(fit)
anova(fit)


plot(Zeitstempel ~ Geschlecht, data =data, las = 2)
fit <- lm(as.numeric(Zeitstempel) ~ Geschlecht, data =data)
summary(fit)






