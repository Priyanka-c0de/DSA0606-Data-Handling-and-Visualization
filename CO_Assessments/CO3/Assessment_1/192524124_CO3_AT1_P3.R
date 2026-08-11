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

ggplot(
  marks,
  aes(
    x = Class,
    y = Marks,
    fill = Class
  )
) +
  
  geom_violin(
    trim = TRUE,
    scale = "width",
    adjust = 0.8,
    color = "black",
    alpha = 0.8
  ) +
  
  geom_boxplot(
    width = 0.12,
    fill = "yellow",
    color = "black",
    outlier.shape = NA
  ) +
  
  geom_errorbar(
    aes(
      ymin = Marks,
      ymax = Marks
    ),
    width = 0.18,
    color = "black",
    linewidth = 0.8
  ) +
  
  scale_fill_manual(
    values = c(
      "Class A" = "green3",
      "Class B" = "red2"
    )
  ) +
  
  labs(
    title = "192524124 Problem 12 - Violin Plot of Class Marks",
    subtitle = "Class A is clustered, whereas Class B is widely spread",
    x = "Class",
    y = "Marks",
    caption = "Interpretation: Both classes have similar average marks, but Class B has greater variability."
  ) +
  
  scale_y_continuous(
    breaks = seq(30, 90, 10),
    limits = c(25, 95)
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