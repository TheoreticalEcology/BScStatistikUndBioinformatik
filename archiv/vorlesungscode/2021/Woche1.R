2+2
sqrt(5)
barplot(c(1,2,3,4))


var1 = c(1,2,3,4)

var2 = c("reaktion", "keineReaktion", "reaktion", "reaktion")

class(var2)
class(var1)

barplot(var1, names.arg = var2)

dat = data.frame(versuch = var1, ergebnis = var2)

barplot(dat$versuch, names.arg = dat$ergebnis)

str(dat)

# das ist ein Kommentar

# OK, jetzt haben wir das Prinzip verstanden, kommen wir mal zu Ihren Daten!

daten <- read.csv("./Biostatistik Umfrage 2021.csv", stringsAsFactors = T, na.strings = c(""))


# Studien zeigen dass Maenner in Umfragen .. 
daten$Körpergröße..in.cm.

# Deskriptiv kategorisch 


tabWohnen = table(daten$Ich.wohne)

par(mar = c(4,15,4,4))
barplot(tabWohnen, las = 2, horiz = T)

daten$wohntAllein = daten$Ich.wohne == "allein"
plot(table(daten$wohntAllein))


barplot(table(daten$Mein.Studium.finde.ich))

barplot(table(daten$Wie.schwierig...negativ.empfinde.ich.die.Veränderung.der.Studiensituation.als.ganzes.durch.Corona))

barplot(table(daten$Ich.bin.Vegetarier))

einw = daten$Einwohnerzahl.meiner.Heimat...Geburtsstadt

hist(einw, breaks = 50)

hist(log10(einw), breaks = 50)

x = median(einw, na.rm=T)

x2 = mean(einw, na.rm = T)

abline(v = x, col = "red")
abline(v = x2, col = "blue")

summary(einw)

var(einw, na.rm = T)
sd(einw, na.rm = T)

boxplot(log10(einw))
