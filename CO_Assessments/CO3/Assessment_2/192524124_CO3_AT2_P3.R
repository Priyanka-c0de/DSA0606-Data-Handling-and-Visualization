# Problem 12 - Q-Q Plot

library(ggplot2)

commute <- data.frame(
  Commute_Time = c(
    15, 18, 20, 22, 25,
    28, 30, 35, 40, 50,
    65, 80, 100
  )
)

ggplot(
  commute,
  aes(sample = Commute_Time)
) +
  
  stat_qq(
    color = "red2",
    size = 3
  ) +
  
  stat_qq_line(
    color = "green3",
    linewidth = 1.2
  ) +
  
  labs(
    title = "192524124 Problem 12 - Q-Q Plot of Employee Commute Times",
    subtitle = "The curved pattern indicates departure from normality",
    x = "Theoretical Quantiles",
    y = "Sample Quantiles",
    caption = "Interpretation: The curved Q-Q pattern indicates skewness rather than a normal distribution."
  ) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 11
    ),
    plot.caption = element_text(
      hjust = 0.5,
      face = "italic",
      size = 10
    )
  )