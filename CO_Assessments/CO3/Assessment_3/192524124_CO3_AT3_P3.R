# Problem 12 - Density Plot Critique and Redesign

library(ggplot2)

set.seed(12)

income <- c(
  rlnorm(4500, log(12000), 0.65),
  rlnorm(400, log(30000), 0.55),
  rlnorm(90, log(80000), 0.45),
  rlnorm(10, log(220000), 0.25)
)

income <- pmin(income, 350000)

income_data <- data.frame(
  Income = income
)

ggplot(
  income_data,
  aes(x = Income)
) +
  geom_histogram(
    bins = 35,
    fill = "#4563A3",
    color = NA
  ) +
  scale_x_continuous(
    limits = c(0, 350000),
    breaks = c(0, 100000, 200000, 300000),
    expand = c(0, 0)
  ) +
  labs(
    title = "192524124 Problem 12 - Flawed Income Distribution",
    subtitle = "Linear scale compresses most observations near zero",
    x = "Income (linear)",
    y = NULL,
    caption = "Interpretation: The long right tail dominates the linear scale, making the main concentration of household incomes difficult to examine."
  ) +
  theme_classic(base_size = 13) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      color = "#C65343",
      size = 14
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
    axis.title.x = element_text(size = 11),
    axis.text.x = element_text(size = 10)
  )

# Problem 12 - After (Redesigned)

ggplot(
  income_data,
  aes(x = log10(Income))
) +
  geom_histogram(
    bins = 35,
    fill = "#62935D",
    color = NA
  ) +
  scale_x_continuous(
    limits = c(4, 5.55),
    breaks = seq(4, 5.5, 0.25),
    expand = c(0, 0)
  ) +
  labs(
    title = "192524124 Problem 12 - Redesigned Log-Transformed Distribution",
    subtitle = "Log10 transformation reveals the distribution structure",
    x = "log10(Income)",
    y = NULL,
    caption = "Interpretation: The logarithmic scale compresses extreme high incomes and spreads the lower-income observations, making the skewed structure easier to interpret."
  ) +
  theme_classic(base_size = 13) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      color = "#62935D",
      size = 14
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
    axis.title.x = element_text(size = 11),
    axis.text.x = element_text(size = 10)
  )