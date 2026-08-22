# Problem 5 - Scatterplot

library(ggplot2)

screen_data <- data.frame(
  Screen_Time = c(2, 3, 4, 5, 6, 7, 8, 9),
  Sleep_Hours = c(8.5, 8, 7.5, 7, 6.5, 6, 5.5, 5)
)

ggplot(
  screen_data,
  aes(
    x = Screen_Time,
    y = Sleep_Hours
  )
) +
  geom_point(
    size = 4,
    color = "#4563A3"
  ) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "#BA5142",
    linewidth = 1.2
  ) +
  labs(
    title = "192524124 Problem 5 - Screen Time and Sleep Hours",
    subtitle = "Scatterplot showing the relationship between daily screen time and sleep",
    x = "Screen Time (hours/day)",
    y = "Sleep Hours",
    caption = "Interpretation: The scatterplot shows a strong negative linear relationship. As screen time increases, sleep hours decrease."
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