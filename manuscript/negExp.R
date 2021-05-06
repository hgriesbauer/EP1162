# Script to calculate negative exponential diameter distribution of tree stems

negExp<-function(xVar,yVar) {
  
  require(broom)
  
   # Estimate the rest parameters using a linear model
  model.0 <- lm(log(yVar) ~ xVar)  
  alpha.0 <- exp(coef(model.0)[1])
  beta.0 <- coef(model.0)[2]
  
  # Starting parameters
  start <- list(alpha = alpha.0, beta = beta.0)
  
  # fit model
  model <- nls(yVar ~ alpha * exp(beta * xVar), start = start)
  
  # calculate Q factor
  q<-
    tidy(model) %>% 
    slice(2) %>% 
    pull(estimate) %>% 
    abs() %>% 
    exp()
  
  # return coef
  tidy(model) %>% 
    mutate(q.factor=c(NA,q)) %>% 
    return()
    
}










