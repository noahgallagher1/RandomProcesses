```{r, Port Part A}
############################################################################################################################################
Containership arrival is modeled by a nonhomogeneous Poisson process with the power-law intensity function λ(t) = αβ tβ−1, α, β > 0, t ≥ 0 .
############################################################################################################################################

#Part A. Estimating the parameters of the model using the regression approach.

###################################################
#linear regression method of estimation
###################################################

#reading the data set in
containership.data<- read.csv(file="/Users/noahgallagher1/Documents/FALL 2020/STAT 482/ALL_STUDY_MATERIALS 2/CHAPTER 4/Exercise4.4Data.csv", 
header=TRUE, sep=",")

#setting values for x (days) & y (arrivals)
x<- log(containership.data$days)
y<- log(containership.data$arrivals)

glm(y~x)
 

#plotting the data
plot(x,y, main="Days V. Arrival", xlab="Days", ylab="Arrivals",sub="By Noah Gallagher",col=2)

#fitting a line to the data from the glm coefficients
lines(x, -1.294+1.145*x)
```

```{r, Port Part B}
#Part B. Estimating the parameters using the Maximum Likelihood approach
###################################################
#maximum likelihood method of estimation (METHOD 2)
###################################################

#setting values for x (days) & y (arrivals)
x<-log(containership.data$days)
y<-log(containership.data$arrivals)
  
#specifying number of arrivals in data set
num.arrivals<-27

#specifying & computing estimates
beta.hat<- num.arrivals/(num.arrivals*x[num.arrivals]-sum(x))
alpha.hat<- num.arrivals/exp(x[num.arrivals]*beta.hat)

#printing estimates
print(beta.hat)
print(alpha.hat)
```

```{r, Port Part C}
#Part C.Predicting when the next 10,000 TCUs arrive to the port
########################################################
#Using Linear Regression & Maximum Likelihood.
########################################################

#using both estimates from part A and part B 
alpha.hat2<-c(0.274172, 0.2351766)
beta.hat2<-c(1.145, 1.162782)

#defining empty vector for sum
sum.hat<- c()

#implementing numerical analysis package
library(pracma)
#running for loop to print out our prediction 
for(i in 1:2){
  print(sum.hat[i]<- alpha.hat2[i]^(- 1/beta.hat2[i])*exp(alpha.hat2[i]*exp(x[num.arrivals])^beta.hat2[i])* gammainc(alpha.hat2[i]*exp(x[num.arrivals])^beta.hat2[i], 1/beta.hat2[i]+1)[2])
}
```
