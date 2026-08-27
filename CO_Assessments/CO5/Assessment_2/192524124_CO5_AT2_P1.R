# Problem 46 - Jittering and Transparency

library(ggplot2)
library(gridExtra)
library(grid)

data <- data.frame(
  Cluster = rep(c("Cluster A", "Cluster B", "Cluster C"), each = 12),
  ResponseTime = c(
    120,121,120,122,121,120,123,121,122,120,121,122,
    145,146,145,147,146,145,148,146,147,145,146,147,
    175,176,175,177,176,175,178,176,177,175,176,177
  )
)

p <- ggplot(data, aes(x = Cluster, y = ResponseTime)) +
  geom_jitter(
    width = 0.18,
    height = 0,
    alpha = 0.45,
    size = 3,
    color = "#4563A3"
  ) +
  labs(
    title = "192524124 Problem 46 - Jittering and Transparency",
    subtitle = "Improving readability of heavily stacked categorical observations",
    x = "Server Cluster",
    y = "Response Time (ms)"
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
    axis.title = element_text(face = "bold")
  )

interpretation <- textGrob(
  paste0(
    "INTERPRETATION\n\n",
    "Jittering separates overlapping points so individual observations become visible.\n ",
    "Partial transparency makes dense regions appear darker, revealing concentration. \n",
    "Using both techniques reduces point-stacking and makes the distribution easier to read."
  ),
  x = 0.5,
  y = 0.5,
  hjust = 0.5,
  vjust = 0.5,
  gp = gpar(
    fontsize = 10,
    lineheight = 1.3
  )
)

green_box <- grobTree(
  rectGrob(
    gp = gpar(
      fill = "#EAF4E3",
      col = "#6A994E",
      lwd = 1.5
    )
  ),
  interpretation
)

grid.newpage()

grid.arrange(
  p,
  green_box,
  ncol = 1,
  heights = c(5, 1.4)
)