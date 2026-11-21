library(effects) 
TitanicSurvival

x = table(TitanicSurvival$survived, TitanicSurvival$passengerClass)
barplot(x, beside = T)
legend("topleft", legend = c("verstorben", "überlegt"), col = grey.colors(2), pch = 20)



rechnen Sie die Korrelation 

airquality$Ozone, airquality$Solar.R 



plot(Sepal.Length ~ Petal.Length, data = iris )
cor(iris$Sepal.Length, iris$Petal.Length)


pcaResultat = prcomp(iris[, 1:4], scale = T)
summary(pcaResultat)
biplot(pcaResultat, xlim=c(-0.25, 0.25), ylim=c(-0.25, 0.25), col=c("grey", "red"), cex=0.8)


library(EcoData)


library(psych)
pairs.panels(birdabundance[,-(1:2)], 
             method = "pearson", # correlation method
             hist.col ="#00AFBB",
             smooth = F,
             density = F,  # show density plots
             ellipses = F # show correlation ellipses
)


x = prcomp(birdabundance[,-(1:2)], scale= T)
x

summary(x)
plot(x)

plot(x)
biplot(x)


iris


pairs.panels(iris[1:4],bg=c("#00AFBB", "#E7B800", "#FC4E07")[iris$Species],
             pch=21,main="Fisher Iris data by Species",
             hist.col = "lightgrey",
             smooth = F,
             ellipses = F
             ) 

pairs.panels(iris[1:4],bg=c("red","yellow","blue")[iris$Species],
             pch=21+as.numeric(iris$Species),main="Fisher Iris data by Species",hist.col="red") 
#to show changing the diagonal


plot(iris[,-5], )


x = prcomp(iris[,-5], scale= T)
x

library(factoextra)

summary(x)
plot(x)

plot(x)
biplot(x)

fviz_pca_biplot(x, habillage = iris$Species, addEllipses = T, 
                palette = c("#00AFBB", "#E7B800", "#FC4E07"))

