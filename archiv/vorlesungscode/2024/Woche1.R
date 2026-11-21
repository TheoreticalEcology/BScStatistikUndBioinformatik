
# R basics



# Zentraler Grenzwertsatz 

x = rlnorm(500)
hist(x, breaks = 50)

y = replicate(1000, mean(rlnorm(500)))
hist(y)

# Daten darstellen 

library(EcoData)
dat = plantHeight

write.csv(plantHeight, file = "plantheight.csv")

plantheight = read.csv("plantheight.csv")

hist(titanic$age)

hist(titanic$fare)

plot(fare ~ age, data = titanic)

x = table(titanic$pclass)
barplot(x)

x= table(titanic$sex)
barplot(x)
str(dat)

x = table(dat$growthform)
barplot(x)

x = table(dat$Country)
barplot(x, las = 2)


hist(dat$height, breaks = 50)

mean(dat$height)
median(dat$height)
quantile(dat$height)
boxplot(dat$height)

library(moments)
skewness(dat$height)

hist(dat$temp, breaks = 20)



