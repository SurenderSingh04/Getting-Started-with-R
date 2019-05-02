#System Defined Functions.
#A function consists of arguments. we can call function by passing the name of argument or by position of argument

#1. Summary
View(m4)
summary(m4)  # quick way of looking at the data frame for some important chracterstics like min, mx, avg etc.
summary(m4$ID)  # can be applied on a data frame as well as on a vector

#2. table
?table
table(m4)                   # table function  
table(m4$ID)
table( m4$gen, m4$dept1)    #Generally we apply table function on 2 columns of character/factor data type, to see relation between them
# By default it ignores NA values. to include NA. we need to specify the argument given below:
table(m4$gen , m4$dept1 , useNA = 'no')     # default scenario
table(m4$gen , m4$dept1 , useNA = 'always') # will always include 'NA', even if no 'NA' is there 
table(m4$gen , m4$dept1 , useNA = 'ifany')  # will include 'NA', only if any 'NA' is there

table( m4$gen, m4$dept1) # table can be run on 2 columns. Gives the relation between gender and dept 
# the number of rows and column in the output matrixdepend on the unique values in gen and dept1 column
# generally we run table function only on character and factor data types. 
# we should avoid running it on numeric and integer data types because there can be 
# too many unique values in those columns and it will no more be of our use

#3. some important data frame functions

dim(m4)    # number of observations and varibles in data frame
nrow(m4)
ncol(m4)
colnames(m4)

ma4=m4
names(ma4) = c("dept12" ,"gender" ,"ID" ) # this will change the column names of data frame ma4. 
ma4                                       # but one thing we need to make sure is, we are specifying the name of all the columns. 
# Even if isome column name is not changed, still we need to specify the name
colnames(ma4)


#4. seq
?seq

#seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),length.out = NULL, along.with = NULL, ...)
seq(2,10, 2) # sequence of 2 to 10 with a width of 2
seq(2,10, length.out = 15)  # will give 15 intervals between 2 and 10


#5. unique
?unique
# unique gives the distinct values in a factor/character vector
unique(m4$dept1) # only 2 unique values A, B


#6. sort
?sort
a11 = c(1,2,3,4,5,6,23,45,65,37,28,98)
sort(a11)  # By default it is in ascending order
sort(a11, decreasing = T)  # will sort in descending order
a12 = c("Apple", "Microsoft","Infosys","Amazon", "Wipro", "TCS")
sort(a12)

#6.1. sorting a data frame
m4=m4[sort(m4$ID, decreasing=T),]  # sorting a data frame by ID variable or rows
m4=m4[,c(2,3,1)] # sorting by column indexes
m4=m4[,sort(colnames(m4))]  # sorting by column names. But generally it doesn't make any sense
m4

# what if some column has NA values, and we want to sort by that column, It will not be able to sort.
# we can omit NA values, 
View(fullMerge)
fullMerge1=na.omit(fullMerge)  # na.omit function
fullMerge1  # NA values removed

# If we want to replace NA values with some other value
a13=c(10,20,20,30,40,56,45,NA, NA,10,NA)
is.na(a13)  # will return TRUE where there is an NA value
a13[is.na(a13)]=0  # will replace all teh NA values of a13 by 0
a13



#7. some important functions for numeric data type (cieling, floor, trunc , round)
ceiling(10.01) # rounds to next hiegest integer
floor(9.95)  # rounds to lower integer
trunc(9.95) # It just takes away the values after decimal
round(10.76,1)
round(10.993,2)

#8. some important functions for String(toupper, tolower, length, nchar, substr, strsplit, sub, gsub)

a14='Apple'
toupper(a14)
tolower(a14)
length(a14)
nchar(a14) # no. of characters each element of array

a12 = c("Apple", "Microsoft","Infosys","Amazon", "Wipro", "TCS")
nchar(a12)

a15  = substr(a14, 2, 4)  # substr function
a15

date=Sys.Date()
date
year=substr(date, 1, 4)
year

a16 = strsplit(date, '-') # strsplit is a function which splits the string at the specified character e.g. "-" here.
# but this is not working, because, "-" is not getting accepted by strsplit function.
# It is considering it as a special character. To achieve thiis we need to replace '-' by some other character

date1= sub(date, pattern="-" , replacement ='/') # sub() function will convert only first '-' to a '/'
date1

date1= gsub(date, pattern ="-", replacement ='/') # gsub() function will convert all the  '-' to  '/'
date1

a16=strsplit(date1, '/')
a16
a16=unlist(strsplit(date1, '/'))  # now it will get splitted along '/' character
a16

#9. Data manipulations(sqrt, log2, log10,min, max, range, mean, median, var, sd)

a17= 999

sqrt(a17)
log2(a17)
log10(a17)

a18 = c(20,30,40,30,40)
mean(a18)

a18 = c(20,30,40,30,40,NA,NA)
mean(a18)                       # will give error because of NA values
mean(a18, na.rm = 1)            # na.rm will ignore NA values and compute the mean of rest of the values

median(a18, na.rm = 1)

min(a18)
max(a18)
range(a18)                 # maximum and minimum values in the vector

var(a18)
sd(a18)

a19=10
a19=log(a19)              # by default log's base is e (e=2.17)
a19

a19=exp(a19)              # exp is reverse of log. 
a19

a20 = c(rep('a', 10), rep('b', 4))
a20


#10. cbind(column binding) , rbind(row binding)

# when there is no primary key, foreign key between tables, and we want to merge 2 tables, 
# then we need to use cbind provided number of rows in both the data frames are same.

x=c(1,2,3,4)
y=c('d','b','c','a')
z=c('A','B','C','D')
z1=c('x','f','m','p')

a21=data.frame(x,y)
a21 
a22=data.frame(z,z1)
a22

a23= cbind(a21,a22)
a23

# rbind is same as appending the data in 2 files. for this structure of the data frames should be same. 
# i.e. same number of columns with identical names
x=c(3,4,5,6,7,8,9)
y=c('d','c','v','b','n','m','z')

a24=data.frame(x,y)

a25 = rbind(a21, a24) # appending 2 data frames a21 and a24
a25


