# Problem 12 - PCA Scatterplot

library(ggplot2)

score_data <- data.frame(
  Math = c(60, 70, 80, 90, 50),
  Science = c(65, 72, 78, 85, 55)
)

ggplot(
  score_data,
  aes(
    x = Math,
    y = Science
  )
) +
  geom_point(
    size = 4,
    color = "#4563A3"
  ) +
  geom_abline(
    slope = 1,
    intercept = 0,
    color = "#BA5142",
    linewidth = 1.2,
    linetype = "dashed"
  ) +
  labs(
    title = "192524124 Problem 12 - Math and Science Scores",
    subtitle = "Scatterplot with diagonal reference line for PCA interpretation",
    x = "Math Score",
    y = "Science Score",
    caption = "Interpretation: The points follow a strong positive diagonal pattern. PC1 would align closely with this diagonal because Math and Science scores increase together."
  ) +
  theme_classic(base_size = 13) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 15
    ),
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 10
    ),
    plot.caption = element_text(
      hjust = 0.5,
      size = 9,
      face = "italic"
    )
  )