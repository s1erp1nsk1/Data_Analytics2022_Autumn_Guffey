# 20 Jan 2022
# Practice with Auto Dataset
library(ISLR)

data(Auto)
head(Auto)
names(Auto)
summary(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg) # gives the summary values as a "list"

boxplot(Auto$weight)
hist(Auto$mpg,col='grey',border='green',angle=45,density=20)
mean(Auto$weight)
median(Auto$weight)

?hist
