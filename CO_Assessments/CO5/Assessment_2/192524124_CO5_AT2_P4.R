# Problem 49 - Purposeful Color Design

library(ggplot2)
library(gridExtra)
library(grid)

data <- data.frame(
  Region = c(
    "North",
    "South",
    "East",
    "West",
    "Central",
    "Northeast",
    "Southeast"
  ),
  Value = c(
    72,
    58,
    81,
    64,
    76,
    69,
    55
  )
)

p <- ggplot(
  data,
  aes(
    x = Region,
    y = Value
  )
) +
  geom_col(
    fill = "#4563A3",
    width = 0.7
  ) +
  labs(
    title = "192524124 Problem 49 - Purposeful Color Design",
    subtitle = "Consistent color improves comparison across regions",
    x = "Region",
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
      angle = 25,
      hjust = 1
    )
  )

interpretation <- textGrob(
  paste0(
    "INTERPRETATION\n\n",
    "Arbitrary colors do not represent a meaningful variable and can distract the reader.\n ",
    "They may also create false visual emphasis between regions.\n  ",
    "A consistent single color is more appropriate because every bar represents the same type of measurement.\n "
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