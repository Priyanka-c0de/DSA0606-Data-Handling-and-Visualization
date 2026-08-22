# Problem 5 - Correlation Does Not Prove Causation

library(ggplot2)

data <- data.frame(
  X = c(1, 2, 3, 4, 5, 6, 7, 8),
  Y = c(2, 4, 5, 8, 10, 12, 14, 16)
)

ggplot(
  data,
  aes(
    x = X,
    y = Y
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
    title = "192524124 Problem 5 - Correlation Does Not Prove Causation",
    subtitle = "A strong visual relationship between X and Y does not establish a causal effect",
    x = "X",
    y = "Y",
    caption = paste(
      "Interpretation: The strong positive pattern indicates association,",
      "but the scatterplot alone cannot prove that X directly causes Y.",
      "Additional evidence such as controlled experiments, temporal evidence,",
      "and control of confounding variables is required."
    )
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
      size = 9,
      lineheight = 1.15,
      margin = margin(t = 12, b = 5)
    ),
    plot.caption.position = "plot",
    plot.margin = margin(
      t = 15,
      r = 20,
      b = 45,
      l = 20
    )
  )