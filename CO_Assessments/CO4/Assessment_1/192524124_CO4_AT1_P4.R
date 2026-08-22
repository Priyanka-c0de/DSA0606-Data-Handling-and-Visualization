# Problem 18 - Bubble Chart

library(ggplot2)

product_data <- data.frame(
  Product = c("P1", "P2", "P3", "P4", "P5", "P6"),
  Price = c(20, 35, 15, 50, 25, 40),
  Rating = c(4.5, 3.8, 4.2, 4.8, 4.0, 3.5),
  Units_Sold = c(500, 300, 700, 150, 600, 250)
)

ggplot(
  product_data,
  aes(
    x = Price,
    y = Rating,
    size = Units_Sold
  )
) +
  geom_point(
    color = "#4563A3",
    alpha = 0.7
  ) +
  geom_text(
    aes(
      label = Product
    ),
    vjust = -1.2,
    size = 4,
    fontface = "bold"
  ) +
  scale_size_continuous(
    range = c(5, 18)
  ) +
  labs(
    title = "192524124 Problem 18 - Product Price, Rating and Sales",
    subtitle = "Bubble size represents units sold",
    x = "Price ($)",
    y = "Customer Rating (/5)",
    size = "Units Sold",
    caption = "Interpretation: P3 has the highest sales and a high rating, giving it the best overall combination of customer rating and sales volume."
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
    )
  )