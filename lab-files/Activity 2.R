library(ggplot2)

#sCATTER
ggplot(
  geo_data,
  aes(
    x = Population,
    y = Avg_Temperature,
    color = City
  )
) +
  geom_point(size = 5) +
  geom_text(aes(label = City), vjust = -1) +
  labs(
    title = "Temperature vs Population",
    x = "Population",
    y = "Average Temperature"
  ) +
  theme_minimal()
