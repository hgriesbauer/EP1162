# Growth dominance statistic trial

gsd<-
  readr::read_csv("data-raw/growthDominance_trialData.csv", 
                                           col_names = FALSE) %>% 
  as.numeric() %>% 
  matrix(nrow=15,byrow = T) %>% 
  as.data.frame()


names(gsd)=c("S1","D1","SD1","S2","D2","SD2")                
                
                
gsd %>% 
  mutate(SD1a=(S1-lag(S1,default=0))*(D1+lag(D1,default=0))/10000) %>% 

