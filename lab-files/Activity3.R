library(ggplot2)
#Bubble Chart
ggplot(
  geo_data,
  aes(
    x = Population,
    y = Avg_Temperature,
    size = Elevation,
    color = City
  )
) +
  geom_point(alpha = 0.8) +
  labs(
    title = "Geographic Data Analysis",
    x = "Population",
    y = "Average Temperature",
    size = "Elevation"
  ) +
  theme_minimal()