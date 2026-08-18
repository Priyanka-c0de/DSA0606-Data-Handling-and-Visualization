# Problem 18 - Overplotting and Redesign

library(ggplot2)

set.seed(123)

transactions <- data.frame(
  Transaction_Value = rnorm(
    100000,
    mean = 500,
    sd = 120
  ),
  Transaction_Time = rnorm(
    100000,
    mean = 50,
    sd = 12
  )
)

transactions$Transaction_Time <- 
  transactions$Transaction_Time +
  transactions$Transaction_Value * 0.02

ggplot(
  transactions,
  aes(
    x = Transaction_Value,
    y = Transaction_Time
  )
) +
  
  geom_point(
    color = "black",
    alpha = 0.15,
    size = 0.8
  ) +
  
  labs(
    title = "192524124 Problem 18 - Flawed Scatterplot",
    subtitle = "100,000 transaction records create severe overplotting",
    x = "Transaction Value",
    y = "Transaction Time"
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
    )
  )
ggplot(
  transactions,
  aes(
    x = Transaction_Value,
    y = Transaction_Time
  )
) +
  
  geom_bin2d(
    bins = 40
  ) +
  
  scale_fill_gradient(
    low = "yellow",
    high = "red"
  ) +
  
  labs(
    title = "192524124 Problem 18 - Redesigned Transaction Visualization",
    subtitle = "2D binning reduces overplotting and reveals data concentration",
    x = "Transaction Value",
    y = "Transaction Time",
    fill = "Number of\nTransactions",
    caption = "Interpretation: Aggregating observations into bins reveals areas of high and low transaction concentration."
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