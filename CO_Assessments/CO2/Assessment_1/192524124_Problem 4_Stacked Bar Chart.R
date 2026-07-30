headcount <- data.frame(
  
  Year=rep(c("2022","2023"),each=3),
  
  Department=c(
    "Engineering",
    "Sales",
    "Support",
    "Engineering",
    "Sales",
    "Support"),
  
  Count=c(
    40,
    25,
    15,
    55,
    30,
    20)
  
)
ggplot(headcount,
       aes(Year,
           Count,
           fill=Department))+
  
  geom_bar(stat="identity")+
  
  labs(
    
    title="192524124 – Stacked Bar Chart: Department Headcount",
    
    x="Year",
    
    y="Employees"
    
  )+
  
  theme_minimal(base_size=15)