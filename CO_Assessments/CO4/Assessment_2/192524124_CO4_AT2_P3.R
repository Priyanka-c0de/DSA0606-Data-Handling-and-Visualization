# Problem 12 - PCA Variance Evaluation

library(ggplot2)

pca_data <- data.frame(
  Component = c("PC1", "PC2", "PC3", "PC4"),
  Variance = c(40, 30, 20, 10)
)

ggplot(
  pca_data,
  aes(
    x = Component,
    y = Variance
  )
) +
  geom_col(
    fill = "#4563A3",
    color = "black",
    width = 0.65
  ) +
  geom_text(
    aes(
      label = paste0(Variance, "%")
    ),
    vjust = -0.4,
    size = 5,
    fontface = "bold"
  ) +
  scale_y_continuous(
    limits = c(0, 50),
    breaks = seq(0, 50, 10)
  ) +
  labs(
    title = "192524124 Problem 12 - PCA Variance Evaluation",
    subtitle = "PC1 explains only 40% of the total variance",
    x = "Principal Component",
    y = "Variance Explained (%)",
    caption = "Interpretation: Keeping only PC1 loses 60% of the total variance. For a final 2D visualization, PC1 and PC2 should be retained because together they explain 70% of the variance."
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
      face = "italic",
      size = 9
    )
  )