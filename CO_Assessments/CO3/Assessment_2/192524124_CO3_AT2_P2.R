# Problem 6 - Skewed Distribution and Log Transformation

library(ggplot2)

income <- data.frame(
  Income = c(
    15000, 18000, 20000, 22000, 25000,
    28000, 32000, 40000, 60000, 500000
  )
)

income$Log_Income <- log10(income$Income)

p1 <- ggplot(
  income,
  aes(x = Income)
) +
  
  geom_histogram(
    bins = 6,
    fill = "red2",
    color = "black"
  ) +
  
  labs(
    title = "Problem 6 - Original Income Distribution",
    subtitle = "The ₹500,000 income creates a strong right skew",
    x = "Monthly Income (₹)",
    y = "Frequency",
    caption = "Interpretation: The extreme high-income value produces a long right tail."
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

p2 <- ggplot(
  income,
  aes(x = Log_Income)
) +
  
  geom_histogram(
    bins = 6,
    fill = "green3",
    color = "black"
  ) +
  
  labs(
    title = "192524124 Problem 6 - Log-Transformed Income",
    subtitle = "Log transformation reduces the effect of the extreme value",
    x = "Log10(Monthly Income)",
    y = "Frequency",
    caption = "Interpretation: The log transformation compresses extreme values and produces a more balanced distribution."
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

p1
p2