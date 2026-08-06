#-------------------------------------------------------
# SET 14 - Question 1
# Histogram and Density Plot of Units_Consumed
#-------------------------------------------------------
library(ggplot2)
energy <- read.csv(file.choose())
head(energy)
summary(energy$Units_Consumed)

#-------------------------------------------------------
# Histogram
#-------------------------------------------------------

ggplot(energy, aes(x = Units_Consumed)) +
  geom_histogram(
    bins = 4,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Histogram of Units Consumed",
    x = "Units Consumed (kWh)",
    y = "Frequency"
  ) +
  theme_minimal(base_size = 14)

#-------------------------------------------------------
# Density Plot
#-------------------------------------------------------

ggplot(energy, aes(x = Units_Consumed)) +
  geom_density(
    fill = "lightgreen",
    alpha = 0.5,
    color = "darkgreen",
    linewidth = 1.2
  ) +
  labs(
    title = "Density Plot of Units Consumed",
    x = "Units Consumed (kWh)",
    y = "Density"
  ) +
  theme_minimal(base_size = 14)

#-------------------------------------------------------
# Interpretation
#-------------------------------------------------------

cat("\nInterpretation:\n")
cat("The histogram shows the distribution of energy consumption among the sectors.\n")
cat("Most observations lie between 300 and 600 kWh, while industrial sectors have higher consumption.\n")
cat("The density plot provides a smooth view of the distribution, showing concentration in lower consumption values and a smaller peak at higher values.\n")

#Question 2
ggplot(energy,
       aes(x = Temperature,
           y = Units_Consumed,
           size = Peak_Hours)) +
  
  geom_point(
    color = "blue",
    alpha = 0.6
  ) +
  
  labs(
    title = "192524124 - Bubble Scatter Plot: Temperature vs Units Consumed",
    x = "Temperature (°C)",
    y = "Units Consumed (kWh)",
    size = "Peak Hours"
  ) +
  
  theme_minimal()

#QUESTION 3
avg_data <- aggregate(
  Renewable_Usage ~ Sector,
  data = energy,
  mean
)

avg_data
ggplot(avg_data,
       aes(x = Sector,
           y = Renewable_Usage,
           fill = Sector)) +
  
  geom_bar(
    stat = "identity"
  ) +
  
  geom_text(
    aes(label = round(Renewable_Usage,1)),
    vjust = -0.5
  ) +
  
  labs(
    title = "192524124 - Average Renewable Usage by Sector",
    x = "Sector",
    y = "Average Renewable Usage (%)"
  ) +
  
  theme_minimal()
