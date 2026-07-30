library(ggplot2)
sales <- data.frame(
  
  Month=c("Jan","Feb","Mar","Apr","May"),
  
  Sales=c(120,150,90,200,175)
  
)
ggplot(sales,
       aes(x=Month,
           y=Sales,
           fill=Month))+
  
  geom_bar(stat="identity")+
  
  labs(
    
    title="192524124 – Bar Chart: Monthly Sales Analysis",
    
    x="Month",
    
    y="Sales (Units)"
    
  )+
  
  theme_minimal(base_size=15)
