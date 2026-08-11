# Problem 18 - Box Plot

library(ggplot2)

scores <- data.frame(
  Section = c(
    rep("Section A", 7),
    rep("Section B", 7)
  ),
  Score = c(
    60, 65, 68, 70, 72, 75, 80,
    40, 50, 55, 60, 65, 70, 95
  )
)

ggplot(scores, aes(x = Section, y = Score, fill = Section)) +
  geom_boxplot(
    color = "black",
    width = 0.6,
    outlier.color = "red2",
    outlier.size = 3
  ) +
  geom_jitter(
    width = 0.08,
    color = "black",
    size = 2.5,
    alpha = 0.7
  ) +
  labs(
    title = "192524124 Problem 18 - Box Plot of Test Scores",
    subtitle = "Section A has a more consistent score distribution, while Section B has greater spread.",
    x = "Section",
    y = "Test Score",
    caption = "Interpretation: Section A has a median of 70, while Section B has a median of 60 and a wider spread."
  ) +
  scale_fill_manual(
    values = c(
      "Section A" = "green3",
      "Section B" = "red2"
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