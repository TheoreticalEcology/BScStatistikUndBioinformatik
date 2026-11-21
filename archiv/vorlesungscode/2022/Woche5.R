# Vorlesung Di

fit <- lm(Ozone ~ Temp + Wind, data = airquality)
summary(fit)

par(mfrow = c(1,2))
plot(Ozone ~ Wind, data = airquality)
plot(Ozone ~ Temp, data = airquality)

plot(Temp ~ Wind, data = airquality)


fit <- lm(Ozone ~ Temp , data = airquality)
summary(fit)

# Vorlesung Do

ratios = rep(NA, 1000)
for(i in 1:1000){
  # erzeuge Daten ohne Abhängigkeit
  x = rnorm(100)
  y = rnorm(100)
  # vergleiche Log Likelihood M1 = y ~ x , M0 = y ~ 1
  ratios[i] = logLik(lm(y ~ x))  - logLik(lm(y ~ 1))
}

hist(ratios, breaks = 100)



# Ihr Datensatz 


# Daten einlesen und anschauen
daten <- read.csv("./Woche1/Biostatistik Umfrage 2022.csv", stringsAsFactors = T, na.strings = c(""))
daten$Zeitstempel = NULL
colnames(daten) = c("Einwohner", "Distanz", "Körpergröße", "Körpergewicht", "Geschlecht", "Händigkeit", "Wohnform", "Verkehrsmittel",  "Getränk", "Vegetarier","Studium", "CO2_Steuer", "Parkplatzgebühr", "Atomkraftwerke", "CRISPR-Cas")



plot(Körpergewicht ~ Vegetarier, data =daten, col = "lightgrey", notch = T)
fit <- lm(Körpergewicht ~ Vegetarier, data =daten)
summary(fit)


fit <- lm(Körpergewicht ~ Vegetarier + Geschlecht, data =daten)
summary(fit)


boxplot(Körpergewicht ~ Verkehrsmittel, data =daten)
fit <- lm(Körpergewicht ~ Verkehrsmittel + Geschlecht + Distanz, data =daten)
summary(fit)

table(daten$Geschlecht, daten$Verkehrsmittel)


daten$random = rnorm(nrow(daten))

M0 <- lm(Körpergewicht ~ Verkehrsmittel, data =daten)
M1 <- lm(Körpergewicht ~ Verkehrsmittel + Geschlecht , data =daten)
M2 <- lm(Körpergewicht ~ Verkehrsmittel + random , data =daten)

summary(aov(M2))

AIC(M0)
AIC(M1)
AIC(M2)

#### Airquality Beispiel



str(airquality)
library(PerformanceAnalytics)
chart.Correlation(airquality, histogram=TRUE, pch=19)

pca <- prcomp(airquality[complete.cases(airquality),1:4])
plot(pca)
biplot(pca)

fit <- lm(Ozone ~ Temp + Wind + Solar.R, data = airquality)
summary(fit)  
  

plot(Ozone ~ as.factor(Month), data = airquality)
  
 
fit <- lm(Ozone ~ Temp + Wind + Solar.R + as.factor(Month), data = airquality)
summary(fit)  

anova(fit)

m1 = lm(Ozone ~ Temp , data = airquality)
m2 = lm(Ozone ~ Temp + Wind, data = airquality)
anova(m1, m2)


# Diabetis Beispiel

library(mlbench)
data(PimaIndiansDiabetes)

m1 <- lm(glucose ~ age , data = PimaIndiansDiabetes)
summary(m1)

m2 <- lm(glucose ~ age + mass + diabetes + triceps, data = PimaIndiansDiabetes)
summary(m2)

# Alle 4 Faktoren erklären 25% der Varianz in den Daten (r2 = 0.25)
# Wie wichtig sind die einzelnen Faktoren für den Glukoselevel - hierzu können wir eine Anova machen

anova(m2)

# Was die ANOVA macht, ist age + mass + diabetes + triceps zu nehmen, und mit dem ersten Faktor (age) anzufangen, und zu fragen: wie viel r2 erklärt age alleine? Das ist dann der Sum Sq Wert für Age (für R2 muss man dann noch duch die Gesamtvarianz = Summe aller Sum Sq Werte teilen). Es wäre ein bisschen komfortabler, wenn die ANOVA die Werte gleich geteilt durch die Gesamtvarianz anzeigen würde. 

# Ich rechne Ihnen hier noch mal die kummulative Summer der Sum Sq Werte / Summe( Sum Sq) - diese Werte entsprechen den R2 Werten der Modelle 

x = anova(m2)
rownames(x)
format(x$`Sum Sq` / sum(x$`Sum Sq`), scientific = FALSE)
cumsum(x$`Sum Sq` / sum(x$`Sum Sq`) )


anova(m1, m2)

AIC(m1)
AIC(m2)


## Automatische Modellselektion

# Welches Modell ist aber denn jetzt das richtige Modell für die Glukose - nehmen wir doch mal alle Variablen rein


m3 <- lm(glucose ~ ., data = PimaIndiansDiabetes)
summary(m3)

# Aber das sind ja noch nicht richtig alle - hier das Modell mit allen Variable, und allen möglichen 2-Wege Interaktionen zwischen den Variablen

m4 <- lm(glucose ~ .^2, data = PimaIndiansDiabetes)
summary(m4)

# Jetzt ist irgendwie fast gar nichts mehr signifikant, außer Insulin. Aber es sieht einfach so aus, also wir zu viele Variablen für unser Modell haben. Also machen wir eine automatische Modellselektion

# Schrittweise Selektion


library(MASS)
stepAIC(m4, trace = 0)


# Das finale Modell ist: 
#   
#   lm(formula = glucose ~ pressure + triceps + insulin + mass + 
#        pedigree + age + diabetes + pressure:triceps + pressure:diabetes + 
#        triceps:insulin + insulin:mass + insulin:age + insulin:diabetes + 
#        mass:pedigree, data = PimaIndiansDiabetes)
# 
# Die Aussage von AIC ist jetzt: wenn Sie eine Vorhersage machen wollen, für die Glukosekonzentration in Abhängigkeit der Variable und ihrer 2-Wege Interaktionen, dann wird diese Modell wahrscheinlich den kleinsten möglichen Fehler unter allen möglichen Modelle haben



# Typ I Fehler und Modellselektion

# Modellselektion ist eine super Sache, aber was man nicht darf ist auf dem selektierten Modell dann noch mal p-Werte berechnen, weil diese Berechnung nicht für das multiple Testen der Modellselektion korrigiert. 

# Beispiel: wir erzeugen völlig zufällige Daten, 100 Prädiktoren, und rechnen eine normale Regression


set.seed(1)
dat = data.frame(matrix(runif(20000), ncol = 100))
dat$y = rnorm(200)
fullModel = lm(y ~ . , data = dat)
summary(fullModel)


# 2 von den 100 Prädiktoren sind signifikant. Das ist im Rahmen desssen, was wir normalerweise erwarten (5% Typ I Fehler). Jetzt rechnen wir eine Modellselektion, und dann ein neues lm für das beste Modell


selection = stepAIC(fullModel, trace = 0)
selection
summary(lm(y ~ X1 + X2 + X3 + X5 + X7 + X13 + X20 + X23 + X30 + 
             X37 + X42 + X45 + X46 + X47 + X48 + X64 + X65 + X66 + X71 + 
             X75 + X80 + X81 + X87 + X88 + X89 + X90 + X94 + X100, data = dat))


# Voila, 15 von 28 selektierten (der 100) Prädiktoren sind signifikant. Natürlich sieht das erst mal viel besser aus, aber machen Sie sich klar - keiner dieser Variablen hat einen Effekt. Wir haben unsere Statistik ausgetrickst, indem wir unerlaubterweise 2 Methoden kombiniert haben. 

# Es ist möglich korrekte p-Werte nach der Selektion zu errechnen aber das ist recht kompliziert. Wir behandeln die entsprechenden Methoden hier nicht. 




