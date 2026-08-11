# Problem 12 - Violin Plot

library(ggplot2)

marks <- data.frame(
  Class = c(
    rep("Class A", 7),
    rep("Class B", 7)
  ),
  Marks = c(
    50, 55, 58, 60, 60, 62, 65,
    30, 40, 50, 60, 70, 80, 90
  )
)

ggplot(marks, aes(x = Class, y = Marks, fill = Class)) +
  geom_violin(
    color = "black",
    alpha = 0.7,
    trim = FALSE
  ) +
  geom_boxplot(
    width = 0.12,
    fill = "yellow",
    color = "black"
  ) +
  geom_jitter(
    width = 0.08,
    color = "red2",
    size = 2.5
  ) +
  labs(
    title = "192524124 Problem 12 - Violin Plot of Class Marks",
    subtitle = "Class A is more clustered, while Class B has a wider spread.",
    x = "Class",
    y = "Marks",
    caption = "Interpretation: Both classes have similar average marks, but Class B shows substantially greater variability."
  ) +
  scale_fill_manual(
    values = c(
      "Class A" = "green3",
      "Class B" = "red2"
    )
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
    legend.position = "none"
  )