# Problem 24 - Stacked Bar Chart

library(ggplot2)

results <- data.frame(
  Class = c(
    "Class A", "Class A",
    "Class B", "Class B"
  ),
  Result = c(
    "Pass", "Fail",
    "Pass", "Fail"
  ),
  Students = c(
    35, 5,
    28, 12
  )
)

ggplot(
  results,
  aes(
    x = Class,
    y = Students,
    fill = Result
  )
) +
  geom_bar(
    stat = "identity",
    color = "black",
    width = 0.6
  ) +
  geom_text(
    aes(
      label = Students
    ),
    position = position_stack(vjust = 0.5),
    fontface = "bold",
    size = 5
  ) +
  labs(
    title = "192524124 Problem 24 - Pass and Fail Composition by Class",
    subtitle = "Class A has a higher pass proportion than Class B.",
    x = "Class",
    y = "Number of Students",
    fill = "Result",
    caption = "Interpretation: Class A has 35 passes and 5 failures, while Class B has 28 passes and 12 failures."
  ) +
  scale_fill_manual(
    values = c(
      "Pass" = "green3",
      "Fail" = "red2"
    )
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