# Woche 4 (Regression / Maximum Likelihood): Animation "mle.gif"
# -----------------------------------------------------------------------------
# Zeigt 30 Wiederholungen desselben Experiments (je 3 Einzelbilder = 90 Frames):
#   1. Wahrer Prozess: Normalverteilung (Mittelwert 0, sd 1)
#   2. Erzeugte Daten: n = 20 Zufallszahlen aus diesem Prozess
#   3. MLE (Mittelwert der Daten, rot) + 95%-Konfidenzintervall (gruen)
# Das wahre mu = 0 liegt in ca. 95% der Experimente im Konfidenzintervall.
#
# Voraussetzungen: install.packages("animation") und ImageMagick
# (Befehl `magick` bzw. `convert`), das saveGIF() intern aufruft.
# Ergebnis: mle.gif im aktuellen Arbeitsverzeichnis (setwd auf diesen Ordner).
# Aufgeraeumte Fassung von archiv/vorlesungscode/2019/Woche4.R
# (dort stand faelschlich `seed(123)` statt `set.seed(123)`).
# Ergebnis: 90 Frames, 600x480 px.
# -----------------------------------------------------------------------------

library(animation)

set.seed(123)

n <- 20
anzahl_bilder <- 30

zeichne_bild <- function() {
  # Wahrer Prozess
  curve(dnorm, -3, 3, xlab = "Messwert", ylim = c(0, 1), main = "Wahrer Prozess")
  abline(v = 0)

  # Daten: n Werte aus dem wahren Prozess
  x <- rnorm(n)
  curve(dnorm, -3, 3, xlab = "Messwert", ylim = c(0, 1), main = "Erzeugte Daten")
  abline(v = 0)
  rug(x, col = "darkgreen", lwd = 2)

  # MLE des Mittelwerts = Stichprobenmittel; CI = +-1.96 * Standardfehler
  curve(dnorm, -3, 3, xlab = "Messwert", ylim = c(0, 1), main = "MLE + CI")
  abline(v = 0)
  rug(x, col = "darkgreen", lwd = 2)
  MLE <- mean(x)
  CI  <- sd(x) / sqrt(n) * 1.96
  polygon(x = c(MLE - CI, MLE + CI, MLE + CI, MLE - CI),
          y = c(0, 0, 1, 1), border = NA, col = "#00990022")
  abline(v = MLE, col = "red", lwd = 2)
}

saveGIF({
  for (i in 1:anzahl_bilder) zeichne_bild()
}, movie.name = "mle.gif", interval = 1, ani.width = 600)
