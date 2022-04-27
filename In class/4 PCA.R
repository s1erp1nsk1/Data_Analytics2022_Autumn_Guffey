# March 21 2022
# PCA

#----US Arrests----
data("USArrests")

states = row.names(USArrests)
states

apply(USArrests,2,var) #thing, demension, varience

?apply
  # We now perform principal components analysis using the 
    #prcomp() function, which is one of several functions in R that perform PCA.
  # By default, the prcomp() function centers the variables to have mean zero. By using the option scale=TRUE,
  # we scale the variables to have standard deviation one.
  # The output from prcomp() contains a number of useful quantities.
pr.out=prcomp(USArrests, scale=TRUE)

names(pr.out)

# The center and scale components correspond to the means and standard deviations of the
# variables that were used for scaling prior to implementing PCA
pr.out$center
pr.out$scale

  # The rotation matrix provides the principal component loadings; each column of pr.out$rotation contains
  # the corresponding principal component loading vector
  # We see that there are four distinct principal components.
pr.out$rotation
?pr
?prcomp
dim(pr.out$x)
pr.var = pr.out$sdev^2
pr.var

#compute the proportion of variance
pve = pr.var/sum(pr.var)
pve
  
#first PC explains 62% of the data, second 24.74%, etc.


#----Iris Dataset----
data('iris')
head(iris)

irisdata1 <- iris[,1:4]
irisdata1 #remove categorical

principal_components <- princomp(irisdata1, cor=TRUE, score=TRUE)
  
#cor = if the calculation should use correlation or cov, correlation
          #is used if there are no constant variables

  #score = whether the score is on

summary(principal_components)
plot(principal_components, type='l')
biplot(principal_components)

#----Boston----

library(MASS)
data("Boston", package="MASS")
pca_out<- prcomp(Boston,scale.=T)
pca_out
plot(pca_out)

biplot(pca_out, scale=0)
boston_pc <- pca_out$x
boston_pc

head(boston_pc)
summary(boston_pc)
