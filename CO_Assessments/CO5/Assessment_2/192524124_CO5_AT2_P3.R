# Problem 48 - Density Plot with Contours

library(ggplot2)
library(gridExtra)
library(grid)

set.seed(48)

data <- data.frame(
  Rainfall = rnorm(1000, 80, 20)
)

data$CropYield <- 20 +
  0.45 * data$Rainfall +
  rnorm(1000, 0, 8)

p <- ggplot(
  data,
  aes(
    x = Rainfall,
    y = CropYield
  )
) +
  stat_density_2d_filled(alpha = 0.75) +
  stat_density_2d(
    color = "white",
    linewidth = 0.8
  ) +
  labs(
    title = "192524124 Problem 48 - Rainfall and Crop Yield Density",
    subtitle = "Contour spacing shows how rapidly data density changes",
    x = "Rainfall",
    y = "Crop Yield",
    fill = "Density"
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
    "Tightly packed contour lines indicate a rapid change in data density \n",
    "over a small range of rainfall and crop-yield values.\n ",
    "Widely spaced contour lines indicate a more gradual change in density. \n",
    "Therefore, contour spacing helps identify how sharply the distribution changes."
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