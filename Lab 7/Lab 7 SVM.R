#31 March 2022
#Group 4 Lab 7
#Autumn Guffey

#SVM

#https://learn-us-east-1-prod-fleet02-xythos.content.blackboardcdn.com/5fde5e117b0f8/2987000?X-Blackboard-Expiration=1648749600000&X-Blackboard-Signature=%2Bep1lUywFP0tcuT5LKPCBIXr8JXPsfRFYUIYHdNBlV4%3D&X-Blackboard-Client-Id=232301&response-cache-control=private%2C%20max-age%3D21600&response-content-disposition=inline%3B%20filename%2A%3DUTF-8%27%27Data_Analytics2022Spring_group4_lab7.pdf&response-content-type=application%2Fpdf&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEH4aCXVzLWVhc3QtMSJHMEUCIF6JOjvviCbO2%2Fpdo0zhBztn0ka5K%2B5xXpW0VcDh42KtAiEA7xy2zWVQg%2BBxuUy5hk7Nuw8IE9yDblSjQCpV%2FTuAtYQq%2BgMIFxACGgw2MzU1Njc5MjQxODMiDHumFbUn0qC7alJ9QyrXA1Ly6eUkoT1q4IplpDN0JEEaoMhKCcHPTMI7QukwzluMt7bVTviVtgcxfReHp6edGyIU4TO7nOplphh8Zo7PRZy8q1CSQp49ya3xHzAC8XJ0SWUG%2FHho%2Bjdt6%2F3DZAGRawB5jcCzRzk%2Bc8cF6aJhf3xDkl05rzhfjXJthAhCbtNQ9q6wJbqcSS%2F1981%2FSGUgsk%2B2dJe9IS1kYIP2vTtQHVRq0giu%2B%2BYGx8HwdWShh6aSnCvn%2Bj%2FQjES8UOqBEWNrU5iVs5Z%2FWo9tXeNJqKS3UxbPHlyhes%2BBEdUyXl24ua5DiVVjZjKvFscw21%2BEzSp5cL8pnYfNKs1mMm9WdvlEilfTyMdXX7YB%2BVC6wZLjlDVnQDLn2EMJgK8beo75FkT4o63%2BZdRzvcrTeDQwjSvcIfJKR0dgciLPaq%2FqV%2BcTEK2cNy8SAbw%2FPwSZaDuqmuRl6BbZECcORfmG8%2BgGNlIr12gkalamC0UxNjtp2Jf8e%2BWYRIsz%2Fayjv6fw%2B8W55%2FCUAA2B8UKDgMUIGuFgWfX%2BjsCGXjySlEgQTMXT4Xpu85%2FnbwK13NQKcUJ4H5tq0kR6YC0grpUgGWnXdde5z9t%2BF0muXDqwGdJ59BkuFE9BCzH8Q6Hg4HlojzDd3ZaSBjqlAUYreYxBrCR3Le1kzR6o4mPoIqlpd%2BwygT2HebyuvtEU95b9pdC0wAG7LNZPSAeNqzf0qABelRRRGxYt8n8W0DQnAtW9M2pt6XYUKFrSgyxM4fiWVU7oUm7d7A47raIzqTz%2FJklzQCzmrooa%2B7wTxM%2BqB86mDEpg7Oo%2BdExQaxr1aJWWiEJ73dS6g5jTE0%2FaD82hUaxCsGOSLt%2FFYX2Kn%2FtBciXu6Q%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220331T120000Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Credential=ASIAZH6WM4PL66THN2VI%2F20220331%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1f19e276d99dcd869f73b65235082e898417da068211c45680e077658809f60f

library(e1071)
set.seed (1)
# We now use the svm() function to fit the support vector classifier for a given value of the cost parameter.
  # Here we demonstrate the use of this function on a two-dimensional example so that we can plot the resulting
  # decision boundary. We begin by generating the observations, which belong to two classes.
x=matrix(rnorm(20*2), ncol=2)
y=c(rep(-1,10), rep(1,10))
x[y==1,]=x[y==1,] + 1
x
y

# We begin by checking whether the classes are linearly separable.
plot(x, col=(3-y))

# They are not. Next, we fit the support vector classifier.
  # Note that in order for the svm() function to perform classification
  # we must encode the response as a factor variable.
  # We now create a data frame with the response coded as a factor.

dat <- data.frame(x = x,y = as.factor(y))
svmfit <- svm(y ~., data=dat, kernel="linear", cost=10,scale=FALSE)

# The argument scale=FALSE tells the svm() function not to scale each feature to
  # have mean zero or standard deviation one; depending on the application, one might prefer to use scale=TRUE.
  # We can now plot the support vector classifier obtained:

plot(svmfit , dat)

# Note that the two arguments to the plot.svm() function are the output of the call to svm(),
  # as well as the data used in the call to svm().
  # The region of feature space that will be assigned to the ???1 class is shown in light blue,
  # and the region that will be assigned to the +1 class is shown in purple.

##########

# We can determine the identities of those support vectors by:

svmfit$index

# You can see 1,2,5,7,14,16 and 17
  # We can obtain some basic information about the support vector classifier fit using the summary()

command:
  summary(svmfit)

#smaller value of cost parameter
svmfit <- svm(y ~., data=dat, kernel="linear", cost = 0.1, scale=FALSE)
plot(svmfit , dat)
svmfit$index


#----Tune-----
set.seed (1)
tune.out <- tune(svm, y ~.,data=dat,kernel="linear", ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100)))

# We can easily access the cross-validation errors for each of these models using the summary() command:
summary(tune.out)

# We see that cost=0.1 results in the lowest cross-validation error rate.
  # The tune() function stores the best model obtained, which can be accessed as follows:
bestmod=tune.out$best.model
summary(bestmod)

# The predict() function can be used to predict the class label on a set of test observations,
  # at any given value of the cost parameter. We begin by generating a test data set.
xtest=matrix(rnorm(20*2), ncol=2)
ytest=sample(c(-1,1), 20, rep=TRUE)
xtest[ytest==1,]=xtest[ytest==1,] + 1
testdat=data.frame(x=xtest, y=as.factor(ytest))

# Now we predict the class labels of these test observations.
  # Here we use the best model obtained through cross-validation in order to make predictions.
ypred <-predict(bestmod ,testdat)
table(predict=ypred, truth=testdat$y)

# Thus, with this value of cost, 19 of the test observations are correctly classified.
  # What if we had instead used cost= 0.01?
svmfit <- svm(y~., data=dat, kernel="linear", cost=.01, scale=FALSE)
ypred=predict(svmfit ,testdat)
table(predict=ypred, truth=testdat$y)

# In this case one additional observation is misclassified.
  # Now consider a situation in which the two classes are linearly separable.
  # Then we can find a separating hyperplane using the svm() function.
  # We first further separate the two classes in our simulated data so that they are linearly separable:
x[y==1,]=x[y==1,]+0.5
plot(x, col=(y+5)/2, pch=19)

# Now the observations are just barely linearly separable.
  # We fit the support vector classifier and plot the resulting hyperplane,
  # using a very large value of cost so that no observations are misclassified.
dat=data.frame(x=x,y=as.factor(y))
svmfit <-svm(y~., data=dat, kernel="linear", cost=1e5)
summary(svmfit)
plot(svmfit,dat)

# No training errors were made and only three support vectors were used.
  # However, we can see from the figure that the margin is
  # very narrow (because the observations that are not support vectors, indicated as circles, are very
  # close to the decision boundary). It seems likely that this model will perform poorly on test data.
  # We now try a smaller value of cost:

svmfit <- svm(y~., data=dat, kernel="linear", cost=1)
summary(svmfit)
plot(svmfit ,dat)

# Using cost=1, we misclassify a training observation, but we also obtain a much wider margin and make
# use of seven support vectors. It seems likely that this model will perform better on test data than the model with cost=1e5.

#----Gene Expression Dataset----

# We now examine the Khan data set, which consists of a number of tissue samples
  # corresponding to four distinct types of small round blue cell tumors
  # For each tissue sample, gene expression measurements are available.
  #The data set consists of training data, xtrain and ytrain, and testing data, xtest and ytest.

library(e1071)
library(ISLR)
names(Khan)

# Let's examine the dimension of the data:
  # This data set consists of expression measurements for 2,308 genes.
  # The training and test sets consist of 63 and 20 observations respectively
dim(Khan$xtrain )
dim(Khan$xtest )
length(Khan$ytrain )
length(Khan$ytest )
table(Khan$ytrain )
table(Khan$ytest )

# We will use a support vector approach to predict cancer subtype using gene expression measurements.
  # In this data set, there are a very large number of features relative to the number of observations.
  # This suggests that we should use a linear kernel, because the additional flexibility that will
  # result from using a polynomial or radial kernel is unnecessary.
dat <- data.frame(x=Khan$xtrain , y = as.factor(Khan$ytrain ))
out <- svm(y ~., data=dat, kernel="linear",cost=10)
summary(out)

# We see that there are no training errors. In fact, this is not surprising, because the large number
  # of variables relative to the number of observations implies that it is easy to find hyperplanes that
  # fully separate the classes.
  # We are most interested not in the support vector classifier's performance on the training observations,
  # but rather its performance on the test observations.
dat.te=data.frame(x=Khan$xtest , y = as.factor(Khan$ytest ))
pred.te=predict(out, newdata=dat.te)

table(pred.te, dat.te$y)
# We see that using cost=10 yields two test set errors on this data.