# Problem 5 - ECDF Comparison

library(ggplot2)

delivery <- data.frame(
  Vendor = c(
    rep("Vendor A", 10),
    rep("Vendor B", 10)
  ),
  Time = c(
    15, 18, 20, 21, 22, 24, 25, 27, 29, 35,
    12, 18, 25, 32, 35, 38, 42, 45, 48, 50
  )
)

ggplot(
  delivery,
  aes(
    x = Time,
    color = Vendor
  )
) +
  
  stat_ecdf(
    linewidth = 1.3
  ) +
  
  scale_color_manual(
    values = c(
      "Vendor A" = "green3",
      "Vendor B" = "red2"
    )
  ) +
  
  labs(
    title = "192524124 Problem 5 - ECDF of Delivery Times",
    subtitle = "Vendor A shows greater concentration between 20 and 30 minutes",
    x = "Delivery Time (minutes)",
    y = "Cumulative Proportion",
    color = "Vendor",
    caption = "Interpretation: Vendor A's steeper ECDF between 20–30 minutes indicates greater concentration of deliveries in this range."
  ) +
  
  annotate(
    "rect",
    xmin = 20,
    xmax = 30,
    ymin = 0,
    ymax = 1,
    alpha = 0.1,
    fill = "yellow"
  ) +
  
  annotate(
    "text",
    x = 25,
    y = 0.25,
    label = "20–30 minute range",
    fontface = "bold",
    size = 4
  ) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 11
    ),
    plot.caption = element_text(
      hjust = 0.5,
      face = "italic",
      size = 10
    )
  )