# 24 Feb 2022
# Lab 3 (In Class)
# Autumn Guffey
# Trees, Hierarchical Clustering, Heatmaps


#----heat map----
set.seed(12345)
par(mar=rep(0.2,4))
dataM <-matrix(rnorm(400),nrow=40)

#heat map 
image(1:10,1:40,t(dataM)[,nrow(dataM):1])

?rep
par(mar=rep(0.2,4))
heatmap(dataM) #adds the dendrograms

#----coin flip----
set.seed(678910)
for (i in 1:40){
  coin_Flip <- rbinom(1,size=1,prob=.5)
  if(coin_Flip){
    dataM[i,] <- dataM[i,] + rep(c(0,3),each=5)
  }
}

par(mar=rep(0.2,4))
image(1:10,1:40,t(dataM)[,nrow(dataM):1])
heatmap(dataM)

?hclust
#----Clusters----
hh <- hclust(dist(dataM))

dataM[hh$order,]
dataM_ordered <- dataM[hh$order,]
par(mfrow = c(1,3))

plot.new()
image(t(dataM_ordered)[,nrow(dataM_ordered):1])

plot(rowMeans(dataM_ordered),40:1 , xlab='The Row Mean', ylab='Row',pch=19)
   
plot(colMeans(dataM_ordered),xlab='Column', ylab='Column Mean',pch=19)
    
dataM_ordered

