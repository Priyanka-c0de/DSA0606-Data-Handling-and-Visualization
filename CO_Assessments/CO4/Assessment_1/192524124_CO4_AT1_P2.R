# Problem 6 - Correlogram

library(ggplot2)

# Correlation data including diagonal values
correlation_data <- data.frame(
  Variable1 = c(
    "Height", "Height", "Height",
    "Weight", "Weight", "Weight",
    "Age", "Age", "Age"
  ),
  Variable2 = c(
    "Height", "Weight", "Age",
    "Height", "Weight", "Age",
    "Height", "Weight", "Age"
  ),
  Correlation = c(
    1.00, 0.85, 0.15,
    0.85, 1.00, 0.30,
    0.15, 0.30, 1.00
  )
)

# Set factor order
correlation_data$Variable1 <- factor(
  correlation_data$Variable1,
  levels = c("Height", "Weight", "Age")
)

correlation_data$Variable2 <- factor(
  correlation_data$Variable2,
  levels = c("Age", "Weight", "Height")
)

# Create correlogram
ggplot(
  correlation_data,
  aes(
    x = Variable1,
    y = Variable2,
    fill = Correlation
  )
) +
  geom_tile(
    color = "white",
    linewidth = 1
  ) +
  geom_text(
    aes(
      label = sprintf("%.2f", Correlation)
    ),
    size = 5,
    fontface = "bold"
  ) +
  scale_fill_gradient2(
    low = "#BA5142",
    mid = "#F4E285",
    high = "#4563A3",
    midpoint = 0.5,
    limits = c(0, 1),
    breaks = c(0, 0.25, 0.50, 0.75, 1.00),
    labels = c("0.00", "0.25", "0.50", "0.75", "1.00")
  ) +
  labs(
    title = "192524124 Problem 6 - Correlation Correlogram",
    subtitle = "Darker blue indicates stronger positive correlation",
    x = NULL,
    y = NULL,
    fill = "Correlation",
    caption = "Interpretation: The diagonal values are 1.00 because each variable is perfectly correlated with itself. Height and Weight have the strongest relationship with a correlation of 0.85. Height-Age is weakest at 0.15."
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
      size = 9,
      face = "italic"
    ),
    axis.text = element_text(
      size = 11
    ),
    legend.position = "right"
  )