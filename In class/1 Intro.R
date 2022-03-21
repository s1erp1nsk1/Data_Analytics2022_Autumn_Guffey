# 20 Jan 2022
# Getting Started in RStudio - MASS Library

install.packages("MASS") #installing the MASS package

library(MASS)
attach(Boston) #'attaching' the dataset
?Boston #help function, pulls up documentation in Help tab
Boston #print
head(Boston)
dim(Boston) #dimensions
names(Boston) #column names
str(Boston) #structure w data types
nrow(Boston)
ncol(Boston)
summary(Boston) #stat summary, min, quartile, med/mean, max
summary(Boston$crim) #summary of crime column only

install.packages("ISLR")
