# Problem 5 - Color Perception and Pie Chart Redesign

library(ggplot2)

data <- data.frame(
  Category = c("Category A", "Category B", "Category C"),
  Value = c(34, 33, 33)
)

data$Percentage <- round(
  data$Value / sum(data$Value) * 100,
  1
)

flawed <- ggplot(
  data,
  aes(
    x = "",
    y = Value,
    fill = Category
  )
) +
  geom_bar(
    stat = "identity",
    width = 1,
    color = "black"
  ) +
  coord_polar(theta = "y") +
  scale_fill_manual(
    values = c(
      "Category A" = "red",
      "Category B" = "orange",
      "Category C" = "yellow"
    )
  ) +
  labs(
    title = "192524124 Problem 5 - Flawed Pie Chart",
    subtitle = "Similar colors make nearly equal slices difficult to distinguish",
    fill = "Category"
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
    )
  )

flawed
# redesigned 
redesigned <- ggplot(
  data,
  aes(
    x = "",
    y = Value,
    fill = Category
  )
) +
  geom_bar(
    stat = "identity",
    width = 1,
    color = "black"
  ) +
  coord_polar(theta = "y") +
  scale_fill_manual(
    values = c(
      "Category A" = "green3",
      "Category B" = "red2",
      "Category C" = "yellow"
    )
  ) +
  geom_text(
    aes(
      label = paste0(Percentage, "%")
    ),
    position = position_stack(vjust = 0.5),
    fontface = "bold",
    size = 5
  ) +
  labs(
    title = "192524124 Problem 5 - Redesigned Pie Chart",
    subtitle = "Distinct colors improve category identification",
    fill = "Category",
    caption = "Interpretation: Clearly separated colors make the three nearly equal categories easier to distinguish."
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
      face = "italic",
      size = 10
    )
  )

redesigned