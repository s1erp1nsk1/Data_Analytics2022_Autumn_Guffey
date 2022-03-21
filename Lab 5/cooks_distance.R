#3 Feb 2022
#In class
#Cooks Disance


mtcars
head(mtcars)
str(mtcars)
model1 <- lm(mpg~ cyl + wt, data = mtcars)
help("cooks.distance")

#plots cooks distance
plot(model1, pch=18, col = 'red', which = c(4))

cd <- cooks.distance(model1)

round(cd,5)
sort(round(cd,5))


#----Lab-----

library(ISLR)
library(pillar)
head(Hitters)
dim(Hitters)
is.na(Hitters)

hd <-na.omit(Hitters)
dim(hd)
glimpse(hd)
head(hd)

salary_model <- lm(Salary~.,data=hd)
summary(salary_model)

salary_cd <- cooks.distance(salary_model)

# 3x greater than the mean
influential <- salary_cd[(salary_cd > (3 * mean(salary_cd,na.rm=TRUE)))]

infl_names <- names(influential)
infl_names

outliers <- hd[infl_names,]
hd_out_rm <- hd %>% anti_join(outliers)
