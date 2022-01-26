#20 Jan 2022
#in-class lab (Lab 0)
#EPI Dataset

help("read.csv")

#file.choose() #pulls up file explorer to manually select file
data1 <- read.csv(file.choose(),header=TRUE) 

epi_data <- data1 #data for lab

data1 <- read.csv(file.choose(),header=TRUE) #inclass work


View(data1) #pull up dataset in table form
dim(data1)

is.na(data1) #true/false values for every entry

summary(epi_data)
summary(data1) #note if name and column are the same that's a problem!!


#test <- c(1,2,3) #'combine' into vector
#test2 <- test[-2] #removes row/item at this index (2 -- second index)
#test[1:4] #2 inclusive, adds NA for out-of-bounds