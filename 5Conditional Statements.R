# syntax of if-else

age =30
ageGroup=' '

if(age>=18){
            ageGroup='18+'
          }else 
               {
                ageGroup='0-18'    
               }

ageGroup

#-----------------------------------------------------------------------------------------------------------
age=49

if(age<=25){
  ageGroup='0-25'
}else if(age>25 & age<=30){
  ageGroup='26-30'
}else if(age>30 & age<=40){
  ageGroup='31-40'
}else if(age>40 & age<=50){
  ageGroup='41-50'
}else {
  ageGroup='50+'
}

ageGroup
#------------------------------------------------------------------------------------------------------------

# same can be achieved through ifelse() function in a much easier way

age =60
ageGroup =ifelse(age<=25 , '0-25' , ifelse(age>25 & age<=35 , '26-35' , ifelse(age>35 & age<=45 , '36-45' ,'45+')))
ageGroup

#-------------------------------------------------------------------------------------------------------------

#Control Structures
#1. for loop  

age1 = c(21,36,49,54)
ageGroup=c()  # always initialize the objects before for loop
for(i in 1:length(age1)){
  if(age1[i]<=25){
    ageGroup[i]='0-25'
  }else if(age1[i]>25 & age1[i]<=30){
    ageGroup[i]='26-30'
  }else if(age1[i]>30 & age1[i]<=40){
    ageGroup[i]='31-40'
  }else if(age1[i]>40 & age1[i]<=50){
    ageGroup[i]='41-50'
  }else {
    ageGroup[i]='50+'
  }
}

ageGroup 


#------------------------------------------------------------------------------------------------------

# operation on a column(variable of data frame)


ID1=c(1,2,3,4)
age2=c(22,33,44,55)

dffor=data.frame(ID1,age2)

ageGroup1=c()

dffor$ageGroup1=ageGroup1

for(i in 1:nrow(dffor)){
  if(dffor$age2[i]<=25){
    dffor$ageGroup1[i]='0-25'
  }else if(dffor$age2[i]>25 & dffor$age2[i]<=30){
    dffor$ageGroup1[i]='26-30'
  }else if(dffor$age2[i]>30 & dffor$age2[i]<=40){
    dffor$ageGroup1[i]='31-40'
  }else if(dffor$age2[i]>40 & dffor$age2[i]<=50){
    dffor$ageGroup1[i]='41-50'
  }else {
    dffor$ageGroup1[i]='50+'
  }
}

View(dffor)  

#----------------------------------------------------------------------------------------------------------
# with the help of ifelse(), this thing becomes vevry simple and we don't even need to use for loop

ID1=c(1,2,3,4)
age2=c(50,50,36,55)

dffor=data.frame(ID1,age2)

dffor$ageGroup1=ifelse(dffor$age2<=25 , '0-25' ,ifelse(dffor$age2>25 & dffor$age2<=30 , '26-30' ,ifelse(dffor$age2>30 & dffor$age2<=40 , '31-40' , '40+')))
View(dffor)

#-----------------------------------------------------------------------------------------------------------
getwd()
