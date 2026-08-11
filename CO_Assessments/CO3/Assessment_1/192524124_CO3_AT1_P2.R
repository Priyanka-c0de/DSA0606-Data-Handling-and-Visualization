# Problem 6 - Bean Plot

library(ggplot2)

quiz <- data.frame(
  Student = paste0("S", 1:9),
  Quiz_Marks = c(40, 50, 55, 60, 60, 60, 65, 70, 80)
)

ggplot(quiz, aes(x = factor(1), y = Quiz_Marks)) +
  geom_violin(
    fill = "green3",
    color = "black",
    alpha = 0.6,
    width = 0.7
  ) +
  geom_point(
    position = position_jitter(width = 0.08),
    color = "red2",
    size = 3
  ) +
  geom_text(
    aes(
      x = 1,
      y = 60,
      label = "Repeated value: 60 occurs 3 times"
    ),
    color = "red2",
    fontface = "bold",
    size = 4
  ) +
  labs(
    title = "192524124_Problem 6 - Bean Plot of Quiz Marks",
    subtitle = "The distribution shows a repeated quiz score of 60 marks.",
    x = "",
    y = "Quiz Marks",
    caption = "Interpretation: The score 60 occurs three times and is clearly visible in the distribution."
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
    ),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank()
  )