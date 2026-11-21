"""
Abbildungen für die Folie „Under- und Overfitting an einem Beispiel“
=====================================================================
Gehört zu: Vorlesung VI.2 (Maschinelles Lernen), Abschnitt Under- und Overfitting
(direkt nach „Das wichtigste Prinzip des ML – der bias-variance trade-off“).

Erzeugt im selben Ordner:
  fits.png – drei Fits (Polynom Grad 0, 2, 10) an 20 zufällige Trainingspunkte
  err.png  – Trainings- vs. Testfehler über die Modellkomplexität (Grad 0–10)

Daten: airquality.csv = R-Datensatz datasets::airquality (New York Mai–Sep 1973).
Die CSV liegt nicht im Repo, sie wird in R erzeugt (im Ordner dieses Skripts):
    write.csv(airquality, "airquality.csv", row.names = FALSE)
Verwendet:
Ozone (ppb) gegen Temp (°F, hier in °C umgerechnet), Zeilen mit NA entfernt (n = 116).

Aufruf:  python3 bias_variance_figures.py
Benötigt: numpy, pandas, matplotlib
"""
import os
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

HERE = os.path.dirname(os.path.abspath(__file__))
plt.rcParams.update({"font.family": "DejaVu Serif", "font.size": 13})

# ---- Einstellungen -------------------------------------------------------
N_TRAIN = 20                  # Größe der Trainingsstichprobe
SEED_EXAMPLE = 3              # Zufallsstichprobe für die drei Beispiel-Fits
DEGREES_EXAMPLE = [(0, "Underfitting\n(zu einfach: Grad 0)"),
                   (2, "Passend\n(Polynom Grad 2)"),
                   (10, "Overfitting\n(zu flexibel: Grad 10)")]
N_SPLITS = 500                # Anzahl zufälliger Train/Test-Aufteilungen für err.png
SEED_SPLITS = 1
COL_TRAIN, COL_TEST = "#1f5fa8", "#e07b00"

# ---- Daten ---------------------------------------------------------------
CSV = os.path.join(HERE, "airquality.csv")
if not os.path.exists(CSV):
    raise SystemExit('airquality.csv fehlt. In R erzeugen: write.csv(airquality, "airquality.csv", row.names = FALSE)')
d = pd.read_csv(CSV).dropna(subset=["Ozone", "Temp"])
x = ((d.Temp - 32) * 5 / 9).values      # Temperatur in °C
y = d.Ozone.values                       # Ozon in ppb
m, s = x.mean(), x.std()
z = lambda v: (v - m) / s                # standardisieren, damit hohe Polynomgrade numerisch stabil sind

def polyfit(xtr, ytr, deg):
    return np.polynomial.polynomial.Polynomial.fit(z(xtr), ytr, deg)

# ---- Abbildung 1: drei Beispiel-Fits -------------------------------------
a = np.random.default_rng(SEED_EXAMPLE).permutation(len(x))[:N_TRAIN]
rest = np.setdiff1d(np.arange(len(x)), a)
grid = np.linspace(x[a].min(), x[a].max(), 400)

fig, ax = plt.subplots(1, 3, figsize=(12, 3.9), sharey=True)
for k, (deg, title) in enumerate(DEGREES_EXAMPLE):
    f = polyfit(x[a], y[a], deg)
    A = ax[k]
    A.scatter(x[rest], y[rest], s=14, color="#c8c8c8", label="neue Daten (Test)")
    A.scatter(x[a], y[a], s=30, color=COL_TRAIN, zorder=3, label=f"Trainingsdaten (n = {N_TRAIN})")
    A.plot(grid, f(z(grid)), color="#c0392b", lw=2.5, zorder=4)
    A.set_ylim(-10, 175); A.set_title(title, fontsize=14); A.set_xlabel("Temperatur (°C)")
    A.spines[["top", "right"]].set_visible(False)
ax[0].set_ylabel("Ozon (ppb)")
ax[0].legend(loc="upper left", fontsize=10, frameon=False)
fig.tight_layout(); fig.savefig(os.path.join(HERE, "fits.png"), dpi=200)

# ---- Abbildung 2: Trainings- vs. Testfehler ------------------------------
# Für jede Aufteilung: N_TRAIN Trainingspunkte, Rest = Testpunkte (nur im Wertebereich
# der Trainingsdaten, also ohne Extrapolation). Dieselben Aufteilungen für alle Grade,
# damit der Trainingsfehler monoton fällt.
# Trainingsfehler = Wurzel des mittleren MSE; Testfehler = Wurzel des MEDIAN-MSE
# (robust gegen einzelne extreme Ausreißer der Grad-10-Fits).
rng = np.random.default_rng(SEED_SPLITS)
splits = [rng.permutation(len(x)) for _ in range(N_SPLITS)]
degs = range(0, 11); tr, te = [], []
for deg in degs:
    mse_tr, mse_te = [], []
    for idx in splits:
        i, j = idx[:N_TRAIN], idx[N_TRAIN:]
        j = j[(x[j] >= x[i].min()) & (x[j] <= x[i].max())]
        f = polyfit(x[i], y[i], deg)
        mse_tr.append(np.mean((f(z(x[i])) - y[i]) ** 2))
        mse_te.append(np.mean((f(z(x[j])) - y[j]) ** 2))
    tr.append(np.mean(mse_tr) ** .5); te.append(np.median(mse_te) ** .5)

fig, A = plt.subplots(figsize=(6.2, 3.9))
A.plot(list(degs), tr, "o-", color=COL_TRAIN, lw=2.5, label="Trainingsfehler")
A.plot(list(degs), te, "o-", color=COL_TEST, lw=2.5, label="Testfehler (neue Daten)")
best = int(np.argmin(te)); A.axvline(best, ls="--", color="grey")
A.text(best - 0.15, 52, "← Underfitting", color="dimgrey", fontsize=12, ha="right")
A.text(best + 0.15, 52, "Overfitting →", color="dimgrey", fontsize=12)
A.set_xlabel("Modellkomplexität (Grad des Polynoms)"); A.set_ylabel("Vorhersagefehler (RMSE, ppb)")
A.set_ylim(10, 60); A.legend(frameon=False, loc="lower left", fontsize=11)
A.spines[["top", "right"]].set_visible(False)
fig.tight_layout(); fig.savefig(os.path.join(HERE, "err.png"), dpi=200)

print("Trainingsfehler (RMSE):", np.round(tr, 1))
print("Testfehler (RMSE):     ", np.round(te, 1))
print("Minimum Testfehler bei Grad", best)
