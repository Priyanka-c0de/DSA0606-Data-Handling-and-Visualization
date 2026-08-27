# Problem 50 - Simplifying Visual Encodings

library(ggplot2)
library(gridExtra)
library(grid)

data <- data.frame(
  Category = paste0("P", 1:15),
  Value = c(
    42, 55, 48, 72, 61,
    83, 67, 51, 76, 64,
    89, 58, 70, 46, 80
  )
)

p <- ggplot(
  data,
  aes(
    x = Category,
    y = Value
  )
) +
  geom_col(
    fill = "#4563A3",
    width = 0.7
  ) +
  labs(
    title = "192524124 Problem 50 - Simplifying Visual Encodings",
    subtitle = "Reducing unnecessary visual channels improves readability",
    x = "Data Point",
    y = "Value"
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
    axis.title = element_text(face = "bold"),
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )

interpretation <- textGrob(
  paste0(
    "INTERPRETATION\n\n",
    "Using color, size, shape, and a redundant secondary color scale creates unnecessary complexity.\n ",
    "A general audience may find it difficult to identify the main message.\n ",
    "The visualization should be simplified by using one primary visual encoding, such as position or bar length."
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