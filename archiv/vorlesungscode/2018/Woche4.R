survivors <- matrix(c(1781,1443,135,47), ncol=2)
colnames(survivors) <- c('survived','died')
rownames(survivors) <- c('no seat belt','seat belt')

barplot(t(survivors))

prop.test(survivors)


0.9295407 auf 0.9684564

require(stats); require(graphics)


boxplot(count ~ spray, data = InsectSprays,
        xlab = "Type of spray", ylab = "Insect count",
        main = "InsectSprays data", varwidth = TRUE, col = "lightgray")

fit <- lm(count ~ spray, data = InsectSprays)
summary(fit)


anova(fit)


plot(Ozone ~ Solar.R, data = airquality)
fit = lm(Ozone ~ Solar.R, data = airquality)
summary(fit)

par(mfrow = c(2,2))
plot(fit)
