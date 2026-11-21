
############################################################################
# Modifiziert von Holiday caRd 2016
# Caroline M. Tucker

##install library
#install.packages("igraph")
library("igraph")

###Make SI model
par(bg="aliceblue")
#Initial set up
size=50 #number of vertices
rate <- 0.10 #infection rate
infnum <- round(seq(from=0, to=size, length.out=10)) #initial infection

#wreath <- make_ring(size)
wreath <- graph.ring(size)
wreathN = connect.neighborhood(wreath, 7) 
V(wreathN)$color <- "yellow3"
V(wreathN)$size <- runif(size, 2, 7)
wreathN$AdjList = get.adjlist(wreathN, mode="out")
L=layout.fruchterman.reingold(wreathN) #layout_with_fr(wreathN)

#Plot
plot(wreathN, vertex.label=NA, vertex.size=V(wreathN)$size, edge.width=2, edge.color="green", vertex.color=V(wreathN)$color, vertex.frame.color=NA, edge.curved=0.2, layout=L)

for(i in 1:25){ #timesteps
  oldinf <- infnum	#recovering
  newinf <- sort(unlist(lapply(wreathN$AdjList[infnum], FUN=function(X){sample(X, round(length(X)*rate))})))
  V(wreathN)$color <- "yellow" #all
  V(wreathN)$color[oldinf] <- "orange" #recovering
  V(wreathN)$color[newinf] <- "red" #new infected
  V(wreathN)$size[newinf] <- 5 
  plot(delete.edges(wreathN, E(wreathN)), vertex.size=runif(size, 1, 10), vertex.label=NA, edge.width=0, vertex.frame.color=c("lightgrey"), add=TRUE, layout=L)
}

text(0, 0, "Frohe Weihnachten \nund ein gutes neues Jahr!", cex=2, col=c("darkgreen"), font=2.1, family="serif")

