#1. Inner Merge
#2. Left Merge
#3. Right Merge
#4. Outer(Full) Merge

ID = c(1,2,3,4,5)
age = c(22,31,34,40,45)
gen= c('M','F','M','F','M')
m1=data.frame(ID,age,gen)
View(m1)


ID = c(1,2,3,6,7)
sal = c(100,200,300,400,500)
dept1= c('A','B','A','B','A')
m2=data.frame(ID,sal,dept1)
View(m2)

innerMerge = merge(x=m1, y=m2, by='ID')
innerMerge


leftMerge = merge(x=m1, y=m2, by='ID',all.x = T)
leftMerge

rightMerge = merge(x=m1, y=m2, by='ID',all.y = T)
rightMerge

fullMerge = merge(x=m1, y=m2, by='ID',all.x = T ,all.y = T)  #Outer Merge
fullMerge

ID = c(1,1,2,2)
dept1= c('A','B','A','B')
sal = c(100,200,100,200)
m3=data.frame(ID,dept1,sal)
View(m3)


ID = c(1,2,1,2)
dept1= c('A','A','B','B')
gen=c('M','M','F','F')
m4=data.frame(ID,dept1,gen)
View(m4)

# here the primary key is composite. So we need to include 2 columns for merge i.e. ID, Dept

innerMerge_compositePK=merge(x=m3,y=m4, by.x=c('ID','dept1')) 
innerMerge_compositePK


# when column name differs in 2 data frames

ID = c(1,2,3,4,5)
age = c(22,31,34,40,45)
gen= c('M','F','M','F','M')
m5=data.frame(ID,age,gen)
View(m5)


EID = c(1,2,3,6,7)
sal = c(100,200,300,400,500)
dept1= c('A','B','A','B','A')
m6=data.frame(EID,sal,dept1)
View(m6)

# here the primary key column name is different in both data frames i.e. ID, EID

innerMerge_differentPK=merge(x=m5,y=m6, by.x='ID' , by.y = 'EID') 
innerMerge_differentPK

# Using sqldf package we can perfom join by simple sql statements

install.packages('sqldf')
library(sqldf)
install.packages('gsubfn')
install.packages('proto')
install.packages('RSQLite')

m7=sqldf("select * from m1 inner join m2 on m1.ID=m2.ID")
View(m7)
m8=sqldf("select * from m5 inner join m6 on m5.ID=m6.EID") # when PK has different names in data frames
View(m8)


