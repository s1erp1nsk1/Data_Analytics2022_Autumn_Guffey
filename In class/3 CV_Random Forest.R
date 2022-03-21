#28 Feb 2022
#In Class
#Validation

library(ISLR)
library(MASS)
library(boot)


#----Validation----
set.seed(1)

?cv.glm #This function calculates the estimated K-fold 
  #cross-validation prediction error for generalized linear models.

help("sample") #sample takes a sample of the specified size from the
  #elements of x using either with or without replacement.

train = sample(392,196)

    # We use the subset option in the lm() function to fit a linear regression using,
    # only the observations corresponding to the training set.
lm.fit <- lm(mpg~horsepower, data=Auto,subset=train)

    # Now we use predict() function to estimate the response for all 392 observations,
    # and we use the mean() function to calculate the MSE of the 196 observations in the
    # validation set. Note that the -train selects only the observations that are not in,
    # the training set
attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2)

    # We can use the poly() function to estimate test error for the quadratic and cubic regression.
    # Quadratic regression line
lm.fit2 <- lm(mpg~poly(horsepower,2),data=Auto,subset=train) #quadratic
mean((mpg-predict(lm.fit2))[-train]^2)

    #Cubic
lm.fit3 <- lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

  # The error rates are: 19.82 for quadratics and 19.78 for cubic
  # If we choose different training set instead, then we will obtain somewhat 
  # different errors on the validation set
set.seed(2)
train = sample(392,196)

lm.fit <- lm(mpg~horsepower,data=Auto, subset = train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)

lm.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train) # Quadratic
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train) # Cubic
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

  # The model that predict mpg using a quadratic function of horsepower performs better,
  # than a models that only involves only a linear function of horsepower, and there is a,
  # little evidence in favor of a model that uses a cubic function of horsepower

#----LOOCV----




#----k fold----
#----bagging----
#----random forest - dataset form pp----

