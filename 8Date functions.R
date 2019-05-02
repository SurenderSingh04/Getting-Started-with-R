#Date Functions

# one very important package for date operations is lubridate

install.packages('lubridate')
library(lubridate)

a="10/10/2017"
class(a)
a_date=as.Date(a)  # will give "0010-10-20" , default R date
a_date
class(a_date)

a_date1 = as.Date(a, "%d/%m/%Y") #Now it will understand the input pattern of our date string and will convert it to standard date format 
a_date1

a1="10-08-18"

a_date2 = as.Date(a1, "%d-%m-%y") # Y= complete year e.g. 2018 and y=last 2 digits of the year e.g. 18
a_date2

a2="10-08-99"
a_date3=as.Date(a2,"%d-%m-%y") # R will take any given date string and will convert it to R standard format "yyyy-mm-dd"
a_date3

a4="10_08_99"
a_date5=as.Date(a4,"%d_%m_%y")
a_date5

month(a_date3)
year(a_date3)
day(a_date3)
week(a_date3)
weekdays(a_date3)


a_date4 = as.Date("2018-08-26")
b_date4 =as.Date("2018-08-01")
a_date4-b_date4                # will give th edifference of days between 2 dates

difftime(a_date4, b_date4, units = "days") # Time difference of 25 days
difftime(a_date4, b_date4, units = "mins") #Time difference of 36000 mins
difftime(a_date4, b_date4, units = "secs") #Time difference of 2160000 secs
difftime(a_date4, b_date4, units = "weeks")#Time difference of 3.571429 weeks
difftime(b_date4 ,a_date4, units = "days") # Time difference of -25 days
