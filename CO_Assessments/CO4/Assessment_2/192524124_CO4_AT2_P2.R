# Problem 6 - Correlogram with Two Variables

library(ggplot2)

cor_data <- data.frame(
  Variable1 = "X",
  Variable2 = "Y",
  Correlation = 0.85
)

ggplot(
  cor_data,
  aes(
    x = Variable1,
    y = Variable2,
    fill = Correlation
  )
) +
  geom_tile(
    color = "white",
    linewidth = 1.5,
    width = 0.8,
    height = 0.8
  ) +
  geom_text(
    aes(
      label = "0.85"
    ),
    size = 7,
    fontface = "bold"
  ) +
  scale_fill_gradient2(
    low = "#BA5142",
    mid = "#F4E285",
    high = "#4563A3",
    midpoint = 0.5,
    limits = c(0, 1)
  ) +
  labs(
    title = "192524124 Problem 6 - Two-Variable Correlogram",
    subtitle = "A single correlation cell provides limited comparison value",
    x = NULL,
    y = NULL,
    fill = "Correlation",
    caption = "Interpretation: A correlogram is more useful when comparing several variables. With only two variables, a simple correlation coefficient or scatterplot is clearer and more informative."
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