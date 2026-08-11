# Problem 5 - Pie Chart
library(ggplot2)

revenue <- data.frame(
  Product_Line = c("Electronics", "Clothing", "Books"),
  Revenue = c(50000, 30000, 20000)
)

print(revenue)


revenue$Percentage <- 
  revenue$Revenue / sum(revenue$Revenue) * 100
print(revenue)


ggplot(revenue,
       aes(x = "",
           y = Revenue,
           fill = Product_Line)) +
  
  geom_bar(
    stat = "identity",
    width = 1,
    color = "white"
  ) +
  
  coord_polar(theta = "y") +
  
  geom_text(
    aes(
      label = paste0(round(Percentage, 1), "%")
    ),
    position = position_stack(vjust = 0.5),
    size = 5,
    fontface = "bold"
  ) +
  
  scale_fill_manual(
    values = c(
      "Electronics" = "green3",
      "Clothing" = "red2",
      "Books" = "gold"
    )
  ) +
  
  labs(
    title = "192524124 Problem 5 - Revenue Share by Product Line",
    subtitle ="Electronics contributes the highest revenue share (50%), followed by Clothing (30%) and Books (20%).",
    fill = "Product Line",
    caption = "Interpretation: Electronics is the major revenue-generating product line."
  ) +
  
  theme_void() +
  
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
      size = 10,
      face = "italic"
    ),
    legend.title = element_text(
      face = "bold"
    )
  )