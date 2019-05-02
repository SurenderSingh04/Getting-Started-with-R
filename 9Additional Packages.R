# Additional Packages
#1. RODBC Package. this is a very popular package which allows connection between R and any other database with ODBC connection
install.packages("RODBC")
library(RODBC)

?odbcConnect
mydbcon = odbcConnect(dsn = 'mydb' , uid="a123", pwd='xyz123')
mydbcon = odbcConnect(dsn="mydb" , uid='poweruser') # in case of system administrator provides password less authentication. 

#to fetch teh data from any extrenal db

dfdba = sqlQuery(channel = mydbcon, query = "select * from df3")

#2. sqldf
library(sqldf)
library(gsubfn)
library(proto)
library(RSQLite)

m7=sqldf("select * from m1 inner join m2 on m1.ID=m2.ID")
View(m7)
m8=sqldf("select * from m5 inner join m6 on m5.ID=m6.EID") # when PK has different names in data frames
View(m8)


#3.dplyr
# dplyr functions: select, filter, mutate

library(dplyr)
m9 =select (m6, EID) #Select Any Specific column or columns
m9=select (m6, EID, sal)

m10 = filter(m6, EID>3,sal>400 )
m10
churn =read.csv("Churn.csv")  # read the data frame churn.csv
View(churn)
getwd()
head(churn,3)

churn_1=select(churn,1,2,3) #selection by index
View(churn_1)
churn2= select(churn, Day.Mins, Eve.Mins, Night.Mins) #selection by name 
churn3=filter(churn, Day.Mins>=200)
churn3=filter(churn, Day.Mins>=200 & State %in% c("NY","CA"))
churn4=mutate(churn, usage=Day.Mins+Eve.Mins) # will provide the new modified column along with other columns
View(churn4)
churn5=transmute(churn, usage=Day.Mins+Eve.Mins) # will provide only the modified column
View(churn5)

#summarise(churn$State)

churn6=arrange(churn, Day.Mins) #sorting 
View(churn6)

churn7=arrange(churn, Day.Mins, desc(Eve.Mins))
?arrange
View(churn7)

#-------------------------------------------------------------------------------------------------------------------
#Joins using dplyr

ID = c(1,2,3,4)
age = c(22,31,34,40)
gen= c('M','F','M','F')
dp1=data.frame(ID,age,gen)
View(dp1)


ID = c(2,3,4,5)
sal = c(100,200,300,400)
dept1= c('A','B','A','B')
dp2=data.frame(ID,sal,dept1)
View(dp2)

dp3=inner_join(dp1,dp2,dp1.ID=dp2.ID)
?inner_join
View(dp3)
dp4=left_join(dp1,dp2,'ID')
View(dp4)
dp5=right_join(dp1,dp2,'ID')
View(dp5)
dp6=full_join(dp1,dp2,'ID')
View(dp6)

#--------------------------------------------------------------------------------------------------------------------
#distinct in dplyr (distinct in dplyr is different from the unique in the sense that unique gives only unique values in a 
#vector but distinct gives all the distinct observations(rows) in a data frame)

ID = c(1,2,3,4,1)
age = c(22,31,34,40,22)
gen= c('M','F','M','F','M')
dp7=data.frame(ID,age,gen)
View(dp7)

dp8=distinct(dp7)
View(dp8) # 1st row was getting repeated in dp7, which is removed from dp8

# but if we want to identify the duplicate records to specify only the id variable , then

ID = c(1,2,3,4,1)
age = c(22,31,34,40,20)
gen= c('M','F','M','F','M')
dp7=data.frame(ID,age,gen)
View(dp7)

dp8=distinct(dp7)
View(dp8)

dp9=distinct(dp7, ID, .keep_all=T)
View(dp9)
#---------------------------------------------------------------------------------------------------------------------

# mutate
churn8=mutate(churn, usage=Day.Mins+Eve.Mins+Night.Mins, charges=usage*1.08)  
# mutate will allow you to create one more variable(charges) in the same line, and use the 1st one(usage) in its calculation 
 View(churn8)    
 
#---------------------------------------------------------------------------------------------------------------------
  summarise(churn, mean(Day.Mins))

#--------------------------------------------------------------------------------------------------------------------- 
#Sample
churn9=sample_n(churn, 100)  # will select 100 random observations from parent data frame(churn)
churn10=sample_frac(churn, 0.01) # will select 1% of the total observations in the churn dat aframe
View(churn10)
View(churn9)

#---------------------------------------------------------------------------------------------------------------------
#Reshaping the data  OR casting and melting(will be converting values in a column as separate columns)
Region=c('A','A','A','B','B','B')
month =c('Jan','Feb','Mar','Jan','Feb','Mar')
sales=c(100,200,300,400,200,100)

pivot1=data.frame(Region,month,sales)

install.packages('reshape2')
library(reshape2)

pivot2=reshape(pivot1, timevar = "month" , idvar='Region',direction='wide') # reshape function
View(pivot2)

# but this has changed the names of columns to "Region" , "sales.Jan" , "sales.Feb" , "sales.Mar".
# We need to convert the column names to Region, Jan, Feb, Mar . how to do that:

varNames = colnames(pivot2)
varNames

for(i in 1:length(varNames))
{
  varNames[i] = gsub(x=varNames[i],pattern = "sales.", replacement =" ")
}
varNames

names(pivot2) = varNames  
colnames(pivot2)

#---------------------------------------------------------------------------------------------------------------------
