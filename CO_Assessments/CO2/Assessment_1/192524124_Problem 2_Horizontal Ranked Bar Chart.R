traffic <- data.frame(
  Source=c(
    "Organic Search",
    "Direct",
    "Social Media",
    "Referral",
    "Email"),
  Visits=c(
    4500,
    2200,
    1800,
    900,
    600)
)
ggplot(traffic,
       aes(x=reorder(Source,Visits),
           y=Visits,
           fill=Visits))+
  geom_col()+
  coord_flip()+
  labs(
    title="192524124 – Horizontal Bar Chart: Website Traffic by Source",
    x="Traffic Source",
    y="Visits"
  )+
  theme_minimal(base_size=15)