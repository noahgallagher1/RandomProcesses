Prompt:
  The capacity of cargo container ships and port terminals are traditionally measured in twenty-foot equivalent units(TEUs), the number of 20-foot-long containers.
  Suppose that container ship arrival to a port can be modeled by a nonhomogeneous Poisson Process with the power-law intensity function λ(t) = αβ tβ−1, α, β > 0, t ≥ 0.
  The data for 27 arrivas (in unit of 10,000 TEUs) is provided in the PortExample folder.
  
 Part A:
   Estimate the parameters of the model using the regression approach.
   See --> Port.R. (Part A)
   
   From the glm, we are given the following coefficients:
	    Intercept = -1.294
	     X = 1.145
  Thus, the estimated model parameters are:
	  \hat{\alpha}=e^{-1.294}=0.27417\ 
	  \hat{\beta}=1.145

   
 Part B:
   Estimate the parameters of the model using the maximum likelihood approach
   See --> Port.R  (Part B)
   Thus, the Maximum Likelihood Estimators are :
	    \hat{\alpha}=0.2351766
	    \hat{\beta}=1.162782

  Part C:
    Predict when the next 10,000 TEUs arrive to the port. Use both estimators from part A & part B. Compare results.
    See --> Port.R  (Part C)
    
       We use linear regression on the given data set to predict the next arrival of cargo (in units of 10,000 TEU). Regressing on parameters, we find that the estimated next 10,000 TEUs of cargo will arrive to the port on day 60.85581.

       We also use maximum likelihood on the given data set to predict the next arrival of cargo (in units of 10,000 TEU). From this, we find that the estimated next 10,000 TEUs of cargo will arrive on day 60.97308.

       These days are roughly the same, they only differ by 0.11727 days.
