# 14 Feb 2022
# In class
# Classification Models

library(rpart)
library(rpart.plot)

## Iris Dataset ##

#----dnorm-----
library(e1071)
classifier<-naiveBayes(iris[,1:4],iris[,5])
classifier
summary(classifier)

table(predict(classifier,iris[,-5]),iris[,5],dnn=list('predicted','actual'))

classifier$apriori
classifier$tables$Petal.Length      


avg_len <-mean(classifier$tables$Petal.Length)
std_len <-sd(classifier$tables$Petal.Length)
plot(function(x) dnorm(x,avg_len,std_len),0,8,col='red', \
      main='Petal length distribution for the 3 different species')
curve(dnorm(x,5.5,0.6),add=TRUE,col='3',lw=3)
curve(dnorm(x,4,.4),add=TRUE,col='blue',lw=3)     



#----decision tree----
iris
dim(iris)
s_iris <-sample(150,100)
s_iris

iris_train <-iris[s_iris,]
iris_test <- iris[-s_iris,]

dim(iris_test)
dim(iris_train)

plot.new()
detectionTreeModel <- rpart(Species~., iris_train,method='class')
detectionTreeModel

rpart.plot(detectionTreeModel)


#----KNN-Abalone----

abalone <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"), header = FALSE, sep=',')

colnames(abalone) <- c('sex','length','diameter','height','whole_weight', 'shucked_weight', 'viscera_weight', 'shell_weight','rings')

summary(abalone)
str(abalone) #structure
summary(abalone$rings)

abalone$rings<-as.numeric(abalone$rings)
abalone$rings <- cut(abalone$rings, br=c(-1,8,11,35),labels = c('young','adult','old'))
abalone$rings <- as.factor(abalone$rings)

summary(abalone$rings)
str(abalone)

abalone$rings <- as.numeric(abalone$rings)
abalone$rings <- cut(abalone$rings, br=c(-1,8,11,35),labels=c("young",'adult','old'))
abalone$rings <- as.factor(abalone$rings)
summary(abalone$rings)
aba <-abalone
aba$sex <-NULL

normalize <- function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}

aba[1:7] <- as.data.frame(lapply(aba[1:7],normalize))
summary(aba$shucked_weight)

ind <- sample(2, nrow(aba), replace=TRUE, prob=c(.7,.3))
KNNtrain <- aba[ind==1,]
KNNtest <- aba[ind==2,]
sqrt(2918)

#sqrt(2918) ~= 54.01852
library(class)

length(KNNtrain) 

KNNpred <- knn(train = KNNtrain[1:7],test=KNNtest[1:7],cl = KNNtrain$rings,k=55)
KNNpred
table(KNNpred)


#----K means-----
library(ggplot2)
head(iris)
str(iris)
summary(iris)
help('sapply')

sapply(iris[,-5],var)
summary(iris)

#plot sepal length vs sepal width

plot.new()
ggplot(iris,aes(x=Sepal.Length,y=Petal.Width,col=Species)) +geom_point()

###clustering###
  #tot.withinss = Total within-cluster sum of square
  # iter.max = the maximum number of iterations allowed
  # nstart = if centers is a number, how many random sets should be chosen.
set.seed(300)
kMax <- 12
wss <- sapply(1:kMax,function(k){kmeans(iris[,3:4],k,nstart=20, iter.max=20)$tot.withinss})

#identifying *k* through elbow method
plot(1:kMax,wss,type='b',xlab='number of clusters(k)',ylab='within cluster sum of squares')

#what quantity of each type of points were sorted correctly and if not, what were they sorted as?
#4 virinica were placed in row 2 instead (versicolor)
icluster <- kmeans(iris[,3:4],3,nstart=20)
table(icluster$cluster,iris$Species)


#----Classification----

library(rpart)
library(rpart.plot)

iris
s_irs <- sample(150,100)

iris_train <- iris[s_iris,]
iris_test <- iris[-s_iris,]

detectionTreeModel <- rpart(Species~., iris_train, method='class')
detectionTreeModel

rpart.plot(detectionTreeModel)
