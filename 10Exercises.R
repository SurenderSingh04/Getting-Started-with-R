#Exercises
#load the data frame with stringsasFactors='False' otherwise it will not get desired output
library(dplyr)
getwd()
t = read.csv("train.csv")
t=read.csv("train.csv", header=T, sep=',', stringsAsFactors = F)
test=read.csv("test.csv", header=T, sep=',', stringsAsFactors = F)
View(t)
View(test)
str(t)
head(t,1)
#====================================================================================================================

#Q1. How do we convert "4+" in "stay_in_current_city_years" variable to a value 4.
#Coverting the column of the data data frame to a value 4 where it is 4+

t1=t[t$Stay_In_Current_City_Years=='4+',]
View(t1)
nrow(t1)

t2=t
t2$Stay_In_Current_City_Years=ifelse(t2$Stay_In_Current_City_Years=='4+', '4', t2$Stay_In_Current_City_Years)
View(t2)

#====================================================================================================================
#Q2. How many rows exist with a marital_status=0?

t3=t[t$Marital_Status==0,]
View(t3)
nrow(t3)  #324731 rows
dim(t3)

#====================================================================================================================

#Q3. How many rows exist within the age_group of "26-35" with a marital status=0?

t4=t[t$Age=='26-35' & t$Marital_Status=='0',]
View(t4)
nrow(t4)   #133296

#====================================================================================================================

#Q4. How many distinct users exist within the age_group of "26-35" with a marital status=0?
  
t5=t[t$Age=='26-35' & t$Marital_Status=='0',]
t5_1=unique(t5$User_ID)
length(t5_1)  #1244

#====================================================================================================================

#Q5. How many distinct age group exist?

t6=unique(t$Age)  # will give unique values ina particular column
length(t6)  # total 7 unique age groups

t6=table(t$Age)  # will give unique values along with the count of those values
length(t6)

#====================================================================================================================

#Q6. How many distinct user_IDs exist

t7=unique(t$User_ID)
length(t7)

#====================================================================================================================


#Q7. What product ID occurs the most frequently?

t8=data.frame(table(t$Product_ID)) # will give the data frame 
t8
t8[order(t8$Freq, decreasing = T),][1,]
t8[1]
which.max(t8)

t9=table(t$Product_ID)
t9
t9=sort(t9,decreasing = T)
t9[1]
which.max(t9)

#====================================================================================================================


#Q8. What is the avg purchase rate of gender=f or age_group='0-17'

colnames(t)
unique(t$Gender)
t10=t[t$Gender=='F',]
View(t10)
mean(t10$Purchase)  # avg of purchase for female=8734.566

t11=t[t$Gender=='M',]
mean(t11$Purchase)  # avg of purchase for Male=9437.526

#----------------------------------------------F--------------------------------------------------------------------

aggregate(t$Purchase, list(t$Gender), mean)  # the agreegate will give the mean of purchase group by gender


#====================================================================================================================

#Q9. What is the average value of purchase when gender=F or age_group="0-17"

colnames(t)
t12=t[t$Gender=='F'| t$Age=='0-17',]
mean(t12$Purchase)   # avg of purchase is 8768.96

#====================================================================================================================

#Q10. What is the average value of purchase within the odd rows of train.csv?

t13=t[seq(1,nrow(t), 2),]
View(t13)
mean(t13$Purchase) #avg of purchase is : 9253.614

#====================================================================================================================

#Q11. Create a new dataset (train2) that doesn't have any row in train.csv that has missing value


tt=t[rowSums(is.na(t)<1), ] # will filter the data where no NA is present, very useful hack. 
tt                          # Basically it will take the count of those rows which don't have any NA for even single column.
                            # Ie. why we are using the codition is.na(t)<1 

#to solve the question quickly use na.omit function to omit NA values
?read.csv
nrow(t)
t14=na.omit(t)
nrow(t14)

#====================================================================================================================

#Q12. In which city_category do most of the users within age group '0-17' live?

t15=t[t$Age=='0-17', ]
t15=table(t15$City_Category)  # this will always return a list, so better convert it to a data frame

t15=t[t$Age=='0-17', ]
t15=data.frame(table(t15$City_Category))
t15
t15=t15[order(t15$Freq, decreasing=T),]   # we can apply order on a data frame. It is better than sort
t15[1,]  # answer is C

#====================================================================================================================


#Q13. For How many rows is"Product_category_2"missing a value

sum(is.na(t$Product_Category_2))  # 173638 rows
View(t)

#OR

t16=t[is.na(t$Product_Category_2),]
nrow(t16)

#====================================================================================================================

#Q.14 Which value of "product_Category_1" occurs most whenever product_category_2 value is missing

t17=t[is.na(t$Product_Category_2),]
t17=data.frame(table(t17$Product_Category_1))
View(t17)
t17=t17[order(t17$Freq, decreasing=T),]
t17[1,]   # Ans is 63700

#====================================================================================================================

#Q15.Of all the users that exist in "test.csv" how many of them also exist in "train.csv"

#t18=merge(x=test, y=t, by='User_ID') # don't try merge with huge data set. It will hang the system
#View()

?intersect

t18=intersect(unique(t$User_ID), unique(test$User_ID))  # will return only vector where both are common
length(t18)  # Ans. is 5891

#====================================================================================================================
 
#Q16. Of all the users in "train.csv"  how many of them also exist in "test.csv"
#ans is same, intersect picks the common values whtever way you apply it

#====================================================================================================================

#Q17. What is the averge purchase of customers who exist in "train.csv" but not in test.csv

t19=t[!(t$User_ID %in% (intersect(unique(t$User_ID), unique(test$User_ID)))),]
View(t19)  # there is no user which is present in train but not present in test. i.e. why this data set is coming 
           # out to be null

#OR

t20=setdiff(t$User_ID, test$User_ID) # this will return all the user IDs which are there in train but not in test
t20

length(unique(t$User_ID))    #5891
length(unique(test$User_ID)) #5891

#Q18.How many distinct combinations of "user_id" & "Product_id" are available in "train.csv"

t21=data.frame(t$User_ID, t$Product_ID)
nrow(t21)
t21=distinct(t21)
nrow(t21)

#OR

length(unique(paste(t$User_ID, t$Product_ID, sep='-')))  #concatenation of 2 columns and check check for unique values

#Q19.Among all the variables from "Gender" to "Product_Category_3":
#A) calculate the average purchase rate for all the dictinct values of each variable
#B) Identify the variable that has the highest lift in purchase rate
#(for example if City has 3 distinct values (A,b,c) with average purchase rate of 100,200,300 and overall average of 200 
#    then lift is (300/200 - 100/200))
# i.e Highest average value         Lowest Average value
#     ________________________  __  ________________________
#     Overall Average purchase      Overall Average Purchase

t23=NULL
for(i in 3:11)
{
  print(colnames(t[i]))
  t22=aggregate(t$Purchase, list(t[,i]) , mean, na.rm=T)
  t22$var=(colnames(t[i]))
  t23=rbind(t23, t22)
}

View(t23)

View(t)

t25=NULL
t24=NULL
for(i in 3:11)
  
{
  print(colnames(t[i]))
  t25=aggregate(t$Purchase, list(t[,i]) , mean, na.rm=T)
  lift=(max(t25$x)-min(t25$x))/mean(t$Purchase)
  print(class(lift))
  lift$var=colnames(t[i])
  t24=rbind(t24,lift)
}
View(t25)
View(t24)
lift

#Q20. Write a function that takes variable name as input and give out the frequency of occurence 
# table of the distinct values of the variable

colnames(t)
my_func=function(n)
  
{
  t=read.csv("train.csv", header=T, sep=',', stringsAsFactors = F)
  t27=table(t$n)
  return(t27)
}
my_func("User_ID")


#Q21. Write a function that takes variable name and creates dummy variables. 
#For Example, if we give age as input function, then the function creates 7 distinct columns names 
#age_0-1, age_55+ and so on.

#For each of the 7 columns, it gives a value of 1 to the row if the value belongs to the column
#i.e. Age_0-17 will be 1 only if Age = "0-17"else it is a 0. 

t28=NULL
dummy=function(y)
  
{
  for(level in unique(y))
  {
    t28[paste("dummy", level, sep='-')]= ifelse(y==level,1,0)
  }
 View(t28)
 return(t28)
}

dummy(t$Age)


