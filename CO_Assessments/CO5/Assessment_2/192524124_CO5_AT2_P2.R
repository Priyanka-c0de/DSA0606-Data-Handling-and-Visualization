# Problem 47 - 2D Histogram

library(ggplot2)
library(gridExtra)
library(grid)

set.seed(47)

data <- data.frame(
  Age = rnorm(5200, 45, 12),
  BloodPressure = rnorm(5200, 125, 18)
)

p <- ggplot(
  data,
  aes(
    x = Age,
    y = BloodPressure
  )
) +
  geom_bin2d(bins = 30) +
  scale_fill_gradient(
    low = "#EAF4E3",
    high = "#4563A3"
  ) +
  labs(
    title = "192524124 Problem 47 - 2D Histogram",
    subtitle = "Color intensity represents the concentration of observations",
    x = "Age (years)",
    y = "Blood Pressure (mmHg)",
    fill = "Count"
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
    "Each cell represents a range of age and blood-pressure values.\n ",
    "The cell color represents the number of observations in that region.\n ",
    "A very dark cell indicates a high concentration of data points. \n",
    "This approach is suitable for 5,200 observations because it reduces overplotting.\n"
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