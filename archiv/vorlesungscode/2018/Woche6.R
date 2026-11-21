
fit = lm(Ozone ~ Temp, data = airquality)
plot(Ozone ~ Temp, data = airquality)
abline(fit, col = "red", lwd = 2)
summary(fit)


plot.new()

curve(dnorm, -3,3)
x = seq(-3,3, len = 100)
polygon(x, dnorm(x), col="darkblue")

dnorm()


par(mfrow = c(2,3))
x = 0:10
barplot(dbinom(x, 10, 0.1), names.arg = x, main = "p = 0.1" )
barplot(dbinom(x, 10, 0.3), names.arg = x, main = "p = 0.3"  )
barplot(dbinom(x, 10, 0.5), names.arg = x, main = "p = 0.5"  )
x = 0:100
barplot(dbinom(x, 100, 0.1), names.arg = x, main = "p = 0.1" )
barplot(dbinom(x, 100, 0.3), names.arg = x, main = "p = 0.3"  )
barplot(dbinom(x, 100, 0.5), names.arg = x, main = "p = 0.5"  )




par(mfrow = c(1,2))

curve(plogis, -4,4, col = "red", lwd = 2, main = "inv. logit link")
abline(h= 0.5, lty = 2)
abline(v= c(-4,-2,0,2,4), lty = 2)

curve(exp, -4,4, col = "red", lwd = 2, main = "inv. log link")
abline(v= c(-4,-2,0,2,4), lty = 2)
abline(h= 1, lty = 2)

devtools::install_github(repo = "florianhartig/EcoData", subdir = "EcoData", 
                         dependencies = T, build_vignettes = T)
library(EcoData)
titanic
head(titanic)
fit <- glm(survived ~ age + sex + pclass, family = "binomial", data = titanic)
summary(fit)
