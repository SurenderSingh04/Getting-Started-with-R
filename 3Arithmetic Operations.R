##Arithmetic Operators 
### On vectors
a=20
b=10
a+b;a-b ;a/b ; a*b ; # add/subtract/ division/multipliction
a %% b  # remainder

c=2
a**c  ## a raise to the power c
A^c   ## a raise to the power c


a1=c(10,20,30,40,50)
b1=c(1,2,3,4,5)
a1+b1

d1=c(1,2)
a1+d1   ## while doing arithmetic operations on vectors, the smaller vector gets repeated 
        ##equal to the length of the lengthier vector. However it will throw a warning

        ## But if the lengthier vector has no of elements = multiple of the no of elements of 
        ## the smaller vector, then warning itself will not apear

## on Data Frames

View(df1)

df1$emi = df1$amount / df1$months_loan_duration  ## creatd a new column 'emi' to data frame df1
df1$emi = round(df1$emi ,digits =  2)            ## Rounding to 2 digits
View(df1$emi)
df1$years_loan_duration = df1$months_loan_duration/12
df1$years_loan_duration = round(df1$years_loan_duration, 1)
View(df1$years_loan_duration)


### Comparison Operators
##Unlike arithmetic operators we cant perform comparison operators on the elements of unequal lengths

a2=c(10,20,30,40)
b2=c(20,30, 20 , 30)
a2>b2

a2==b2
a2!= b2
a2>=b2  ## a>b | a==b

## comparison operators in the data frame
df6 = df1[df1$years_loan_duration >=4 , ] ## select data where loan duration is greater than 4
View(df6)

df7 =df1[df1$credit_history =='good' , ] ## select data where credit history is good
View(df7)

df8 =df1[df1$credit_history=='good' & df1$amount >1500 ,] ## select data where credit history is good and amount is greater then 1500
View(df8)

# since we are filtering the rows here so we have sliced the data frame with conditions on observations

df9 = df1[df1$credit_history=='good' | df1$credit_history=='perfect' , ] 
View(df9)

df10 = df1[df1$credit_history!='critical'  , ]  ## credit_history not equal to critical
View(df10)

df12 =unique(df1$credit_history)## to find the unique values from a column
df12

df13 =table(df1$credit_history)   ## another important function. It gives unique values along with
                            ##the count of those values
df13
df11 = df1[df1$credit_history %in% c("good" , "perfect"),]  # to select multiple conditions like sql the 'in' keyword syntax  
View(df11)

### Creating new columns using comparison of variables

df1$agege30 = ifelse(df1$age >=30, "Yes","No") ## ifelse is a function which we can use to assign some 
                                               ## value based on the fullfillment of a condition. 
                                               ##this is a separate function and not a conditional statemnet

View(df1)  ## a new column(agege30) got added in the end of the data frame. 
           ##A new column will always get added in the end of a data frame


