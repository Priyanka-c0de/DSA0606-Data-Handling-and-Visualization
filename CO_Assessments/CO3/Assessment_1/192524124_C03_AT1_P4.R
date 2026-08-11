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

ggplot(
  scores,
  aes(
    x = Section,
    y = Score,
    fill = Section
  )
) +
  
  geom_boxplot(
    width = 0.55,
    color = "black",
    outlier.shape = NA
  ) +
  
  geom_errorbar(
    aes(
      ymin = Score,
      ymax = Score
    ),
    width = 0.16,
    color = "black",
    linewidth = 0.8
  ) +
  
  stat_summary(
    fun = median,
    geom = "crossbar",
    width = 0.55,
    color = "black",
    fatten = 2
  ) +
  
  scale_fill_manual(
    values = c(
      "Section A" = "green3",
      "Section B" = "red2"
    )
  ) +
  
  labs(
    title = "192524124 Problem 18 - Box Plot of Test Scores",
    subtitle = "Comparison of median and spread between Section A and Section B",
    x = "Section",
    y = "Test Score",
    caption = "Interpretation: Section A has a median of 70, while Section B has a median of 60 and greater overall spread."
  ) +
  
  scale_y_continuous(
    breaks = seq(40, 100, 10),
    limits = c(35, 100)
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