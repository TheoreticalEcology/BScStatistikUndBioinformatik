daten <- read.csv("./Woche1//Biostatistik Umfrage 2021.csv", stringsAsFactors = T, na.strings = c(""))

str(daten)

# kat + kat 

tab = table(daten$Mein.Studium.finde.ich, 
            daten$Abends.trinke.ich.am.liebsten)
tab
barplot(t(tab), beside = F)


x = table(daten$Ich.bin.Vegetarier,
          daten$Biologisches.Geschlecht )
barplot(x, beside = T)
prop.test(x)

# kat + num 

boxplot(daten$Körpergröße..in.cm. ~ daten$Mein.Studium.finde.ich)

boxplot(daten$Körpergröße..in.cm. ~ daten$Biologisches.Geschlecht)

t.test(daten$Körpergröße..in.cm. ~ daten$Biologisches.Geschlecht)

boxplot(daten$Körpergröße..in.cm. ~ daten$In.die.Uni.komme.ich.am.ehesten.mit.dem.)


daten$bmi = daten$Körpergewicht..kg./ (daten$Körpergröße..in.cm./100)^2
boxplot(daten$bmi ~ daten$Ich.bin.Vegetarier)


# num + num

plot(daten$Körpergröße..in.cm., daten$Körpergewicht..kg.)

cor(daten$Körpergröße..in.cm., daten$Körpergewicht..kg., 
    use = "complete.obs", method = "spearman")

cor.test(daten$Körpergröße..in.cm., daten$Körpergewicht..kg., 
         use = "complete.obs", method = "spearman")



plot(log(daten$Distanz.meiner.Heimatstadt.zu.Regensburg..ca...in.km.),
     daten$Körpergröße..in.cm.)

cor(log(daten$Distanz.meiner.Heimatstadt.zu.Regensburg..ca...in.km. + 1),
    daten$Körpergröße..in.cm., use = "complete.obs")

cor(rnorm(30), rnorm(30))

cor.test(log(daten$Distanz.meiner.Heimatstadt.zu.Regensburg..ca...in.km. + 1),
         daten$Körpergröße..in.cm., use = "complete.obs")
