# Problem 18 - Hexbin Evaluation

library(ggplot2)

set.seed(24)

data <- data.frame(
  X = 1:50,
  Y = 10 + (1:50) * 1.5 + rnorm(50, 0, 8)
)

ggplot(
  data,
  aes(
    x = X,
    y = Y
  )
) +
  geom_point(
    size = 3.5,
    color = "#4563A3",
    alpha = 0.75
  ) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "#BA5142",
    linewidth = 1.2
  ) +
  labs(
    title = "192524124 Problem 18 - Hexbin Evaluation",
    subtitle = "Only 50 observations: a scatterplot is clearer than hexbin binning",
    x = "X",
    y = "Y",
    caption = "Interpretation: With only 50 data points, overplotting is limited and individual observations can be viewed clearly. Hexbin binning is unnecessary; a standard scatterplot is more transparent."
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