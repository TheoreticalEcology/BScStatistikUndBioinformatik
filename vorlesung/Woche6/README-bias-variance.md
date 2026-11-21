# Bias-Variance: Under- und Overfitting – Abbildungen

**Gehört zu:** Vorlesung VI.2 (Maschinelles Lernen), Abschnitt „Under- und Overfitting an einem Beispiel“
(direkt nach „Das wichtigste Prinzip des ML – der bias-variance trade-off“).

## Inhalt

| Datei | Zweck |
|---|---|
| `bias_variance_figures.py` | erzeugt `fits.png` und `err.png` (Python: numpy, pandas, matplotlib) |
| `airquality.csv` | nicht im Repo (Standarddatensatz in R). Erzeugen: `write.csv(airquality, "airquality.csv", row.names = FALSE)` im Ordner des Skripts |
| `fits.png` | oben auf der Folie: Polynom Grad 0 / 2 / 10, jeweils an dieselben 20 zufälligen Trainingspunkte gefittet |
| `err.png` | unten links auf der Folie: Trainings- und Testfehler (RMSE) über den Polynomgrad 0–10 |

## Methode in Kürze

- Ozon (ppb) gegen Temperatur (°F in °C umgerechnet); Zeilen mit NA entfernt, n = 116. Die Daten sind dieselben wie in Woche 5.
- `fits.png`: 20 zufällige Trainingspunkte (Seed 3); die übrigen Messungen sind grau als „neue Daten“ eingezeichnet.
- `err.png`: 500 zufällige Aufteilungen in 20 Trainings- und 96 Testpunkte. Testpunkte werden nur innerhalb des Wertebereichs der Trainingsdaten verwendet, es gibt also keine Extrapolation. Alle Grade nutzen dieselben Aufteilungen.
  - Trainingsfehler = √(mittlerer MSE)
  - Testfehler = √(Median-MSE). Der Median ist robust gegen einzelne extreme Ausreißer der Grad-10-Fits.
- Ergebnis: Der Trainingsfehler fällt monoton von 31.8 auf 16.1. Der Testfehler hat sein Minimum bei Grad 2 (23.9) und steigt bis Grad 10 auf 54.8.

## Neu erzeugen / anpassen

```
python3 bias_variance_figures.py
```

Die PNGs werden in diesem Ordner überschrieben. Die Einstellungen stehen oben im Skript: Stichprobengröße, Seeds, gezeigte Grade und Farben.
