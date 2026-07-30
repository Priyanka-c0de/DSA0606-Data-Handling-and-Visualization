revenue <- data.frame(
  
  Quarter=rep(c("Q1","Q2","Q3","Q4"),2),
  
  Product=rep(c("A","B"),each=4),
  
  Revenue=c(
    
    200,250,300,280,
    
    180,220,260,310)
  
)
ggplot(revenue,
       aes(Quarter,
           Revenue,
           fill=Product))+
  
  geom_bar(
    
    stat="identity",
    
    position="dodge"
    
  )+
  
  labs(
    
    title="192524124 – Grouped Bar Chart: Quarterly Revenue Comparison",
    
    x="Quarter",
    
    y="Revenue ($'000)"
    
  )+
  
  theme_minimal(base_size=15)