# 3 types of data structers. 1-D(vectors, lists), 2-D(matrics, data frames, lists), multi-D(Lists)

#1. Vectors
v=c(10,20,30,40,50)  # homogenous vector
class(v) # numeric

v1=c('ram','suri','kat')   # homogenous vector
class(v1)  #character

v2=c(10,20,30,40,50,'ram','suri','kat')   # hetrogenous vector
class(v2)  #character  --  least flexible data type(out of the two data types involved) is assigned

v3=c(10,20,c,'B')
class(v3)  # list

v4=c(50:60)
class(v4)
v4[1]     #50    -- [] knon as slicing element
v4[4:6]  # 53 54 55
v4[c(3,7,2)]  # will print the respective elements of v4. 1.e. 52 56 51
v4[-1]  # it will exclude the first element of vector and will print the rest elements
v4[-2:-5] # will exclude elements from 2 to 5  --i.e. 52 53 54 55 will be excluded
v4[13] =60  # we have assigned 13th value to an vector which has only 11 elements. what will happen to 12th value
           # and this new value assignment will change the data type of the vector from integer to numeric automatically
v4[12]    # NA -- it will assign NA to the 12th value  
v4[6:1]  # prints values in reverse order 
class(v4) # numeric becuse of missing 2th value
v4=as.integer(v4)  # Type casting
class(v4)
v4[13] =50.5  # addition of a decimal value to a ineteger type vector automatically changes its type to numeric from integer
class(v4)  # numeric

#------------------------------------------------------------------------------------------------------------------

# 2 Dimensional data structures.
## 1. Data Frames Creaation and analysis

id=c(1,2,3,4,5)
age=c(20,30,40,50, 60)
desG=c("A","B", "A", "B", "A")
emp=data.frame(id,age,desG) # creating a data frame
View(emp)  # creates a table with rows and columns. In R rows are known as 'Observations' and columns are known as 'variables'
head(emp)  # head will print first 6 observations of tha data frmae
tail(emp)  # tail will print last 6 observations of tha data frame
head(emp,3)  # first 3 observations
tail(emp,4) # last 4 observations
str(emp)  # each column will have a different/same data type. here desG column is automatically converted to factor data type by R
dim(emp)  # gives no of observations and variables in data frame
nrow(emp) # no of rows(observations) in the data frame
ncol(emp) # no of columns(variables) in the data frame

### slicing a Data Frame
# we can slice the data frame on rows and on columns. they are separated by a comma
# 1. row Slicing
emp[1,]  # 1st row
emp[c(1,3,5), ]  # 1,,3 ,5 rows
emp[seq(1,5,2), ]  # will show you 1 to 5 rows with gap of 2. i.e. 1st, 3rd and 5th rows
emp[seq(1,nrow(emp),2), ] # will show all the odd rows
emp[6,] = c(6, NA, 'A')
 
#2. Column slicing

emp[, c(1,3)] # will print all rows and 1,3rd column
emp2 = emp[,c(-3)]  # will exclude 3rd column
emp3 = emp[, -c(2,3)]  # exclude 2,3rd column. then th resulting emp3 will be automatically converted to a vector, as it is no more a data frame
emp4 = emp[1:3, 1:2]  # first 3 rows and first 2 columns
emp5 = emp[, c("id", "age")] # slicing with variable names


### Add a new column to the data frame

gender = c("M", "F", "M", "F" , "M" , "F")
empx=data.frame(emp, gender)  # add a new column 'gender' to the data frame
empx
emp$gender = gender   #a new way to assign a new column to the emp data frame. In R '.' is used as a name character 
                      #so $ is used to do the same work which'.' do in other languages like java. 
emp$dept = c("E", "D", "E", "D", "E", "D") # one more way to assign a new column

emp$gender=as.factor(emp$gender) # when we create a data frame , R create factor variables automatically
emp$dept = as.factor(emp$dept)   # But when we add a column explicitly, we need to type caste it to factor variable if needed

### deletion

emp$dept =NULL  # will completely  delete th entire column


### Add more columns

empx = data.frame(emp, a1, b1, c1)  ### columns a1, b1, c1 will be added to the data frame empx. But before that we should have a1, b1, c1 available


### Create data frame by reading data from external files.
## five important functions to analyze data frame : str, head, tail, nrow, ncol
getwd()
df1= read.csv("credit.csv", header = T , sep = ',' , stringsAsFactors = F)
View(df1)

## important arguments of the read.csv function. 1. file= give the file name/path 2. header= t/F based on the 
# header present in file or not 3. Sep="," , type of separator present in the input file  4. stringsasFactors=F, will 
# read the integers/characters as int/char itself instaed of factors

str(df1)   ## see the structure of the data frame
df1$checking_balance  = as.factor(df1$checking_balance)  ## convert few variables to factors
df1$other_credit = as.factor(df1$other_credit)
df1$phone = as.factor(df1$phone)
df1$default = as.factor(df1$default)

df2 = df1[,seq(1, ncol(df1) , 2)]   ## select the odd variables(column slicing)
View(df2)
df3 = df1[seq(2, nrow(df1) , 2),]   ## select the even observations(row slicing)
View(df3)
df4 = df1[seq(10, nrow(df1) , 10),]   ## select every 10th observation(row slicing)
View(df4)
df5 = df1[,-c(3,8,13, 17)]   ## select everything except column 3,8,13,17
View(df5)

df6=df1
df6$checking_balance = NULL  ## will delete the column - checking_balance
View(df6)










