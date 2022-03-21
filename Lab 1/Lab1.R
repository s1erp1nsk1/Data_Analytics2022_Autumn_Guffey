#27 Jan 2022
#Lab 1
#EPI 2010 Dataset
library(ISLR)
library(CRAN)

#colors - red, green, blue, teal, pink, yellow, grey, black, etc
#get working directory 
getwd()

#----Import Data----
  #2010EPI_data
data_epi <- read.csv(file.choose(),header=TRUE,stringsAsFactors=FALSE)
View(data_epi)


#remove header to prevent off-by-1
headers <- as.character(as.vector(data_epi[1,]))
headers[1]

names(data_epi) <- headers
data_epi <- data_epi[-1,] 
data_epi

View(data_epi)

data_grump <-read.csv(file.choose(),header=TRUE)

#----Exercise 1----
data_epi_xls <- read.csv(file.choose(),header=TRUE,stringsAsFactors=FALSE)
View(data_epi_xls)
dex <- data_epi_xls

 ## exploring the distribution ##
summary(dex$EPI)
fivenum(dex$EPI,na.rm=TRUE)
stem(dex$EPI)

hist(dex$EPI,col=5)

png(file='Lab 1 EPI Histogram.png')
hist(dex$EPI,seq(30.,95.,1.0),prob=TRUE, col=5)
lines(density(dex$EPI,na.rm=TRUE,bw=1.),lw=5,col=7)
rug(dex$EPI,col=3)
dev.off()

plot(ecdf(dex$EPI),do.points=FALSE,verticals=TRUE)

#qqnorm( ) quantile-quantile function

qqnorm(data_epi_xls$EPI,col=4,lwd=1)
  #adjust graph parameters par(pty='s')
par(col.axis=3,font.axis=2,font.main=3,ps=15) #run graph code again to apply
qqline(data_epi_xls$EPI,lwd=4, col="#663399") 

x<-seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn",col='#abcdef')
qqline(x)
?ppoints
 #..........................#
 ## Fitting a Distribution ##
 #..........................#

## exploring the distribution ##
summary(dex$FISHERIES)
fivenum(dex$FISHERIES,na.rm=TRUE)
stem(dex$FISHERIES)

hist(dex$FISHERIES,col=4)

plot.new()

#png(file='Lab 1 FISHERIES Histogram.png')
hist(dex$FISHERIES,prob=TRUE,seq(20,105,5) ,col=4)
lines(density(dex$FISHERIES,na.rm=TRUE,bw=1.),lw=3,col=7)
rug(dex$FISHERIES,col=3)
#dev.off()

plot(ecdf(dex$FISHERIES),do.points=FALSE,verticals=TRUE)

#qqnorm( ) quantile-quantile function
qqnorm(dex$FISHERIES,col=4,lwd=1)
qqline(data_epi_xls$FISHERIES,lwd=2, col="blue") 

#adjust graph parameters par(pty='s')
par(col.axis=3,font.axis=2,font.main=3,ps=15) #run graph code again to apply

x<-seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn",col='#abcdef')
qqline(x)

#----Exercise 2----

 #.............#
 ## Filtering ##
 #.............#

EPILand <-dex$EPI[!dex$Landlock]

EPILand <- EPILand[!is.na(EPILand)]
EPILand

summary(EPILand)
fivenum(EPILand,na.rm=TRUE)
stem(EPILand)

hist(EPILand,col=5)
par(col.axis=1)

qqnorm(EPILand,col=6,lwd=2)
qqline(EPILand,lwd=2, col="red") 

#----DF----
#Cumulative Density Function
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(EPI); qqline(EPI)
#Simulated data from t-distribution:
x <- rt(250, df = 5)
qqnorm(x); qqline(x)
#Make a Q-Q plot against the generating distribution by: x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

help(distributions)
# try different ones.....