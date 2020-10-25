```{r, Work Injuries Part 2}
############################################################################################################
#Workers' injuries at an industrial manufacturing plant occur according to a non homogeneous Poisson process
#The rate function = A/sqrt(t) , where t is greater than or equal to 0
############################################################################################################

#Simulating trajectory of 100 injuries. Find the time range of the trajectory.

#specifying number of injuries
njumps<- 100

#defining states and times as vectors
N<- c()
T<- c()
S<- c()

#specifying initial values
N[1]<- 0

#setting seed
set.seed(78923492)

#generating standard uniforms
U<- 1:njumps
for(i in 1:njumps)
U[i]<- runif(1)

#computing injury times
T[1]<- (-log(1-U[1])/30)**2
S[1]<- T[1]
for(i in 2:njumps) {
  T[i]<- (sqrt(S[i-1])-log(1-U[i])/30)**2-S[i-1]
  S[i]<- S[i-1]+T[i]
}

#generating the points for the plot
time<- 1:(2*njumps+1)
state<- 1:(2*njumps+1)

time[1]<- 0
state[1]<- 0
for (i in seq(2, 2*njumps, 2)) {
  time[i]<- S[i/2]-0.001
  time[i+1]<- S[i/2]
  state[i]<- state[i-1]
  state[i+1]<- state[i-1]+1
}

#plotting simulated trajectory of 100 injuries
plot(time, state, type="l", col=2, 
panel.first=grid(),main="Injury v. Years Plot",xlab="Years",ylab="Injuries",sub="By Noah Gallagher")
```

```{r, Work Injuries Part 3}
#Assume the 100th injury occurred 12.25 years after the plant was opened, simulate a trajectory.

#setting parameters
years<- 12.25
rate<- 30*sqrt(years)

#setting seed
set.seed(832749239)

#generating N(t)
N<- rpois(1,rate)

#generating N(t) standard uniforms
u<- 1:N
for(i in 1:N)
u[i]<- runif(1)

#sorting u (standard uniforms)
u.sorted<- sort(u)

#computing N(t) injury times
s<- years*u.sorted**2

#generating points for plotting injuries against years
time<- 1:2*N
state<- 1:2*N

#specifying initial values for time and state
time[1]<- 0
state[1]<- 0

#for loop executing simulation
for (i in seq(2, 2*N, 2)) {
  time[i]<- s[i/2]-0.01
  time[i+1]<- s[i/2]
  state[i]<- state[i-1]
  state[i+1]<- state[i-1]+1
}

#plotting simulated trajectory of injuries against years
plot(time, state, type="l", col=2, 
panel.first=grid(),main="Injury v. Years Plot",xlab="Years",ylab="Injuries",sub="By Noah Gallagher")

```


