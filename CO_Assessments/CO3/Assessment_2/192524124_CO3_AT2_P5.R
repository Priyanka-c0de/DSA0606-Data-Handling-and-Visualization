# Problem 24 - Proportion Visualization

library(ggplot2)

departments <- data.frame(
  Department = c("Department X", "Department Y"),
  Total = c(10, 100),
  Women = c(7, 40)
)

departments$Percentage <- departments$Women / departments$Total * 100

ggplot(
  departments,
  aes(
    x = Department,
    y = Women,
    fill = Department
  )
) +
  
  geom_col(
    color = "black",
    width = 0.6
  ) +
  
  geom_text(
    aes(
      label = paste0(
        Women,
        " women\n(",
        Percentage,
        "%)"
      )
    ),
    vjust = -0.3,
    fontface = "bold",
    size = 4
  ) +
  
  scale_fill_manual(
    values = c(
      "Department X" = "green3",
      "Department Y" = "red2"
    )
  ) +
  
  labs(
    title = "192524124 Problem 24 - Percentage vs Actual Number of Women",
    subtitle = "Percentages alone can hide the effect of different department sizes",
    x = "Department",
    y = "Number of Women",
    caption = "Interpretation: Department Y has a lower percentage but employs more women because its total headcount is much larger."
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
    ),
    legend.position = "none"
  )