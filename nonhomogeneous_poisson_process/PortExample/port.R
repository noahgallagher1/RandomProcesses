```{r, Port}
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
