# matrices

b11=c(10,20,30,40)
b12 = matrix(b11, nrow=2, ncol=2)
b12


b13 = matrix(seq(2,20, length.out = 10) , nrow=5, ncol=5 )
b13

b14= matrix(seq(2,20, length.out = 10), nrow = 4, ncol=2)  
# will give  wrning message because nrow =4 is not a multiple of total number of elements of the sequence

b14

b14[1,]
b14[2,1:2]
b14[,2]
sum(b14[,1])
sum(b14[,2])

#--------------------------------------------------------------------------------------------------------
b15 = matrix(seq(2,20,2), nrow = 5, ncol=2, byrow=T)
sum(b15[,1])  # sum by function sum
b15

# sum by for loop
value=0
nrow(b15)
for(i in 1:nrow(b15)){
  value=value+b15[i,1]

}
value  # equivalent to sum(b15[,1])

colSums(b15) # will give sum of columns of b15
rowSums(b15) # will give sum of rows of b15

#--------------------------------------------------------------------------------------------------------

a=c(2,3,4,5)
b=c(1,2)

a=matrix(a,nrow=2, ncol=2)
b16=matrix(b,nrow=2, ncol=1)

a+b  # a and b can't be added because they are not convertible

# but for equal sizes we can add easily

b17=matrix(b,nrow=2, ncol=2)

a+b  # will add up a, b

#----------------------------------------------------------------------------------------------------------