#25 Jan 2022
#R tutorial in-class

##Data Types

#variable names with periods !!!!!!!!!!!!!!1 (why D:)

temperature <- 4.5
class(temperature) #returns data type (numeric)
RPI <- "Rensselear"
class(RPI) #(character)
rPI <- 3.141593921241829523709
class(rPI) #numeric
isSnowing <- TRUE
class(isSnowing) #logical
R <- FALSE
class(R) #logical

#create a section with four lines in a comment!! crazy
#comment mulitple lines ctrl + shift + c

#----Vectors----
num_vec <- c(1,3,5,99) #concat function ('vector')
class(num_vec) #numeric

bool_vec <- c(T,F)
class(bool_vec) #logical

#mixed variable types
mixd_vec <- c(T,"RPI",1824,3.14) #defaults type to character --> turns into ''strings''
class(mixd_vec)

mixd_vec[1] #not off by one !!! :0

mixd_vec_bool <- c(TRUE,8)
class(mixd_vec_bool) 
mixd_vec_bool[1] #defaults type to numeric (T=1, F=0)

#----Matrix----
m<- c(1:10)

#stock prices
goog <- c(560,200)
msft <- c(480,482)

stocks <- c(goog, msft) #concatenates like [] + []
stocks
class(stocks)

#creates matrix called stock.matrix2
stock.matrix2 <- matrix(stocks, byrow=T,nrow=2)

st.names <- c('goog','msft')
days <- c('m','t')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

print(stock.matrix) #matrix has now been given row/column names
math.ex <- matrix(1:25,byrow=T,nrow=5)
math.ex

math.ex*2 #applies to cells individually

math.ex > 5 #returns by cell regarding condition

math.ex + math.ex #adds per cell duh
math.ex / math.ex #divides per cell

colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)


#Bind the Columns
FB <- c(223, 500)
tech.stocks <- rbind(stock.matrix, FB) #adds row below in new matrix
avg <- rowMeans(tech.stocks)
tech.stocks <- cbind(tech.stocks,avg) #adds a column with each rows' average



#----Factor() and Categorical Variables

animal <- c('d','c','d','c','c')#nominal
id <- c(1,2,3,4,5) #ordinal
temps <- c('cold', 'med', 'hot','hot','cold','med')
temps

#making levels/ assigning ordinance
fact.temps <- factor(temps, ordered = TRUE, levels = c('cold','med','hot'))
fact.temps

summary(fact.temps) #counts per level
summary(temps) #length, class, mode (?)

