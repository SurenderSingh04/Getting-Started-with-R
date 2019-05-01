#Data Types

a=10
class(a)

#Type Casting

a=as.numeric(a)
class(a)
a=as.character(a)
class(a)
a=as.integer(a)
class(a)

a="10.5"
class(a)  #character
a=as.numeric(a)
class(a)  # Numeric

# if character values contain alphabets then we can't type cast them to integer/numeric

a='Apple'
a=as.numeric(a)  #It will not be able to convert a character value with alphabets into numeric. But it will convert the data type of a to numeric.
class(a)  # type is numeric


#verifying a data type

is.numeric(a)  #datatype of a is numeric. So it returns TRUE
is.character(a)  # FALSE

#Boolean data Types
a=TRUE
b=T
k=F

class(a)
class(b)
class(k)
