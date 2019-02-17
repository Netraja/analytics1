#my first r file
#comment by starting with #
women
#control+enter to execute command
?women
#to seek help, put question mark and type the command
?mean
mtcars
mean(mtcars$mpg)
#to find the mean,type mean, dataset name, type $ and parameter u want mean for
mean(mtcars$hp)
names(mtcars)
colMeans(mtcars)
#to find mean of every column, put colMeans and data set
rowMeans(mtcars)
#similarly for the all row ka mean
head(mtcars,1)
#for a certain row, we can have head for 6 number of rows from start
head(mtcars)
tail(mtcars)
#tail works in similar manner, just it takes last 6 rows
hist(mtcars$mpg)
#to draw histogram,write hist then data set, $ and parameter
hist(mtcars$mpg, breaks=3)
#breaks=3 , for creating only three bars in histogram
#vectors
x= c(1,2,5,7)
x
class(x)
x1 =c(2L, 8L)
class(xl)
#class tell you type of the data
class(mtcars)
x3 =c('a','b', 'netraja')
x3
class(x3)
#put L to make data integer
#if u want to create a data frame, one column is vector,so if you are creating data frame for students then roll no will be one vector
x4=c(TRUE, FALSE,T, F)
x4
x5=1:100000
x5
#advantage of assigning round bracket is to type and print as well, then no need to write x5 separately
x6<-2
#instead of equal to , we can use <- for assignment
(x7=rnorm(100))
mean(x7)
sd(x7)
plot(density(x7))
hist(x7)
hist(x7, freq=F)
points(density(x7))
(x8= rnorm(100,mean=60, sd=10))
hist(x8)
hist(x8, freq=F)
points(density(x8))
library(e1071)
kurtosis(x8)
skewness(x8)
#creating vectors and filtering
x9= runif(100, 30, 90)
#uniform distribution
trunc(x9)
#REMOVE decimal places
round(x9, 1)
#round off to one decimal point
ceiling(x9)
#round off to next integer
#floor for rounding off to previous digt
x10=ceiling(x9)
#defining new function to next level integer
x10
mean(x10)
median(x10)
sort(x10)
sort(x10, decreasing = T)
#sort is getting values in decending order and next line getting it in decreasing order
x10[x10 > 60]
#this gets values which are more than 60
x10[1:10]
x10[20:30]
#it gives us values by position defined there(in first case 1 to 10 and in second case 20 to 30)
x10[-c(1:20)]
#removing 1 to 20
x10[c(1,5,7)]
#Matrices
m1= matrix(1:24, nrow=6)
#to write down matrix
m1
#to print the matrix, we dont need to provide row and column both
dim(m1)
#property of matrix
m2=matrix(1:56, ncol=8)
m2
m3=matrix(1:24, ncol = 6, byrow=T)
m3
# filling it by row in a particular order
colnames(m3)=month.abb[1:6]
m3
# to give the names to the columns
rownames(m3)=paste('product', 1:4, sep = '-')
m3
#giving names to rows
rowMeans(m3)
colMeans(m3)
rowSums(m3)
colSums(m3)
m1
#after the comma stands for column and before the comma stand for row
m1[, 1:2]
#printing only first two columns
m3[, 1:2]
m3[c(1,3) ,]
#printing only column 1 and 3 of the matrix 3
#we can place names instead of column or row number as well
max(m3)
min(m3)
range(m3)
#data.frame- combination of vectors of equal length
n=30
rollno= 1:30
(rollno=paste('F', 1:30, sep='-'))
#for alphanumeric roll numbers
(sname=paste('student',1:30, sep='&')
(gender=sample(c('M','F'), size=n, replace=T, prob = c(0.7,0.3)))
#to decide male and female
  table(gender)
#to count number of male and female
  #set sid
  set.seed(1234)
  #set.seed again sample and again table
  (t1=table(gender))
prop.table(t1)  
set.seed(12)
college= sample(c('SRCC', 'FMS', 'IIM'), size=n, replace=T, prob =c(0.4,0.3,0.3))
(t2=table(college))
prop.table(t2)
#probabilities are more acheivable when sample size is large
(marks1= round(rnorm(n=n, mean=60, sd=10),0))
(marks2= round(rnorm(n=n, mean=55, sd=15),0))
rollno; sname; gender;college;marks1; marks2
length(gender)
#use semicolon to put many number of entities in same line
students= data.frame(rollno, sname,gender,college, marks1, marks2)
class(students)
students
head(students)
students$rollno
students[,c(2,5:6)]
students[,c('sname','marks1','marks2')
str(students)
summary(students)
quantile(students$marks1)
quantile(students$marks1, probs = seq(0,1,.1))
quantile(students$marks1, probs = seq(0,1,.01))
summary(students)
str(students)
#following is coverting factor into charactre
students$rollno=as.character(students$rollno)
students$sname=as.character(students$sname)
str(students)
summary(students)
head(students)
write.csv(students, 'fms.csv',row.names=F)
#writing the data into excel , open this file from folder in excel
students2= read.csv('fms.csv')
head(students2)
students3=read.csv(file.choose())
head(students3)
str(students)
head(students)
#all students who got more than 60 in subject 1
students[students$marks1 >60 , ]
students[students$gender=='F',]
students[students$gender=='F'& students$college=='SRCC' ,]
#| is an or function while & is oviously for and function
#the comma in data frame line indicates we need all columns
# == sign to check equality
#highest scorers from all colleges
students %>% filter(gender=='M' & marks1> 60)
#pipe operator %>%
library(dplyr)
#we have installed dplyr and ran that library so that we can run the commands
students %>% group_by(college) %>% summarise(max(marks1), max(marks2))
students %>% group_by(gender, college) %>% summarise(countTotal=n())
students
#str tell about the structure of the data
#top 3 students from each college
#difference between male and female marks
# '=' is for assigning the value to something while '==' is for checking the equality
#group by gives us the column we want to deal with
students %>% group_by(gender, college) %>% summarise(countTotal=n(), mean(marks1))
students %>% mutate(totalmarks= marks1+marks2) %>% arrange(-totalmarks) %>% head(n=2)
# to get the total of the two columns
#we use arrange to "arrange it in particular order" and add negative to it if we want decending order of it 
# following is to print alteranted rows
students %>% slice(1:5)
#slice function has obvious to cut out first five rows
students %>% slice(seq(1, 30,2))
#above is for alterante rows that is 1 to 30 with the gap of 2
students %>% sample_n(5) # any random 5 rows
students %>% mutate(totalmarks=marks1+marks2) %>% filter(totalmarks==max(totalmarks))

