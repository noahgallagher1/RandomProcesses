Workers’ injuries occur at a nonhomogeneous Poisson Process with the rate function 
λ(t)=A/√t  ,t≥0

Part 1) Given 30 injuries happened on average during the first year of operation, find the value of A.
        
        Since we are given the rate function, we can easily find the integrated intensity function:
        Λ(t)=∫_0^t▒λ(u)du=∫_0^t▒A/√u  du=2A√t   ,t≥0
        Since 30 injuries happen at t=1 (first year) we can write...
        Λ(1)=30
        Using this we can find the value of A...
        30=2A√1  → 30=2A → A=15
        From this, we get A=15

Part 2) Find the distribution of the time elapsing between two injuries. Simulate trajectory of 100 injuries. Find the time range of the trajectory.

        The interarrival time of the first injury has the cumulative distribution function F_(T_1 ) (t)=1-e^(-Λ(t) ),t≥0. For a fixed         time of the first injury occurrence S_1=T_1=s_1, the cumulative distribution function of T_2 is F_(T_2 ) (t)=1-e^(-(Λ(t+s_1 )-         Λ(s_1 )) ),t≥0. In general, for a given waiting time for the n^th  injury S_n=s_n, the conditional distribution of the                 interarrival time T_(n+1) is F_(T_(n+1) |S_n ) (t│s_n )=1-e^(-(Λ(t+s_n )-Λ(s_n )) ),t≥0,n≥1.

        Now, applying this to our example we get...

        T_(n+1) is F_(T_(n+1) |S_n ) (t│s_n )=1-e^(-30(√(t+s_n )-√(s_n ))). In the code, we first generate standard uniform random             variables u_i,i=1,…,n, and then solve the cumulative distribution function setting F_(T_(n+1) |S_n ) (t│s_n )= u_(n+i)  1-           e^(-30(√(t+s_n )-√(s_n )))=u_n. From here we can solve for T_1 and T_(n+1)...

        T_1 〖=[-1/30  ln⁡(1-u_n )]〗^2, with S_n=∑_(k=1)^n▒T_k 
                          &
        T_(n+1) 〖=[√(s_n )-1/30  ln⁡(1-u_n )]〗^2-s_n,n≥1
        We can now simulate the code for trajectories of 100 injuries.
        
        --> See workinjuries.R ``Part 2``
        
        ![InjuryV.Years](https://user-images.githubusercontent.com/61672116/97119413-48c66380-16cd-11eb-860d-a6ca564eb78f.png)

        Thus, our max value is 13.70859 and our min value is 0. The time range of this trajectory is [0, 13.70859].

Part 3)Assume the 100th injury occurred 12 years and 3 months (12.25 years) after the plant was opened, simulate a trajectory.

        Let S_100 be when the 100th injury took place. Then, S_100=12.25 years.
        This follows a nonhomogeneous Poisson Process, thus the event times are order statistics from the distribution with cumulative         distribution F_s (s)=(Λ(s))/(Λ(t)),0≤s≤t.
        We are given that t=S_100. Thus, F_s (s)=(Λ(s))/(Λ(S_100))=((30(√s)))/((30(√(S_100))))=√(s/S_100 )
        Now, we can simulate this trajectory with R.

        --> See workinjuries.R ``Part 3``
        
        ![InjuryV.Years2](https://user-images.githubusercontent.com/61672116/97119443-7a3f2f00-16cd-11eb-85b8-47365b4eb049.png)
