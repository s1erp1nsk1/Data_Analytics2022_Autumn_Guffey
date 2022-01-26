#Jan 24 2022
#Lab 0, Df Tutorial
#Autumn Guffey

days <- c('Mon','Tue','Wed','Thur','Fri','Sat','Sun')
temp <- c(28,30.5,32,31.2,29.3,27.9,26.4)
snowed <- c('T','T','F','F','T','T')
help()
RWW <- data.frame(days,temp,snowed)

head(RWW)
str(RWW)
summary(RWW)


RWW[1,] #first row, all columns
RWW[,1] #first column, all rows

RWW[,'snowed']

RWW[1:5,c("days","temp")]
RWW$temp
subset(RWW,subset=snowed=='T')

sorted.snowed <- order(RWW['snowed']) #assigns and prints sorted
sorted.snowed

RWW[sorted.snowed,]

dec.snow <-order(-RWW$temp)
dec.snow

empty.DataFrame <- data.frame() #specifies what it is, assigns empty (?)
v1 <- 1:10 # range
v1 
letters
v2 <- letters[1:10] #knows what letters are
df <- data.frame(col.name.1 = v1,col.name.2 = v2)
df

write.csv(df,file = 'saved_df1.csv')
df2 <- read.csv('saved_df1.csv')
df2
