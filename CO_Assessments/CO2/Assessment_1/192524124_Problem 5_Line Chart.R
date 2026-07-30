temp <- data.frame(
  
  Day=c(
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"),
  
  Temperature=c(
    22,
    24,
    23,
    27,
    29,
    26,
    25)
  
)
ggplot(temp,
       aes(Day,
           Temperature,
           group=1))+
  
  geom_line(
    
    color="blue",
    
    linewidth=1.2
    
  )+
  
  geom_point(
    
    color="red",
    
    size=3
    
  )+
  
  geom_text(
    
    aes(label=Temperature),
    
    vjust=-1
    
  )+
  
  labs(
    
    title="192524124 – Line Chart: Daily Temperature",
    
    x="Day",
    
    y="Temperature (°C)"
    
  )+
  
  theme_minimal(base_size=15)