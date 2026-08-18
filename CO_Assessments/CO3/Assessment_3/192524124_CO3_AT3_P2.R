# Problem 6 - 100% Stacked Bar Chart

library(ggplot2)

gender_data <- data.frame(
  Department = c(
    "Science", "Science",
    "Commerce", "Commerce"
  ),
  Gender = c(
    "Boys", "Girls",
    "Boys", "Girls"
  ),
  Count = c(
    60, 40,
    20, 30
  )
)

gender_data$Department <- factor(
  gender_data$Department,
  levels = c("Science", "Commerce")
)

gender_data$Gender <- factor(
  gender_data$Gender,
  levels = c("Boys", "Girls")
)

# Flawed Code

before_chart <- ggplot(
  gender_data,
  aes(
    x = Department,
    y = Count,
    fill = Gender
  )
) +
  geom_bar(
    stat = "identity",
    position = "fill",
    width = 0.65
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, 0.2),
    labels = function(x) paste0(x * 100, "%"),
    expand = c(0, 0)
  ) +
  scale_fill_manual(
    values = c(
      "Boys" = "#4563A3",
      "Girls" = "#BA5142"
    )
  ) +
  labs(
    title = "192524124 Problem 6 - Flawed 100% Stacked Bar Chart",
    subtitle = "Percentages show gender composition but hide department size",
    x = "Department",
    y = "% of total",
    caption = "Interpretation: All departments appear equal in height because the chart shows only percentages. The actual number of employees in each department is hidden."
    
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      color = "#C13F32",
      size = 18
    ),
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 13
    ),
    axis.title = element_text(size = 13),
    axis.text = element_text(size = 12),
    legend.position = "none"
  )

print(before_chart)

ggsave(
  "problem6_before.png",
  before_chart,
  width = 8,
  height = 6,
  dpi = 300
)

# Redesigned Code

after_chart <- ggplot(
  gender_data,
  aes(
    x = Department,
    y = Count,
    fill = Gender
  )
) +
  geom_bar(
    stat = "identity",
    width = 0.65
  ) +
  geom_text(
    aes(label = Count),
    position = position_stack(vjust = 0.5),
    color = "white",
    fontface = "bold",
    size = 5
  ) +
  scale_y_continuous(
    breaks = seq(0, 100, 20),
    limits = c(0, 105),
    expand = c(0, 0)
  ) +
  scale_x_discrete(
    labels = c(
      "Science" = "Sci (Total 100)",
      "Commerce" = "Comm (Total 50)"
    )
  ) +
  scale_fill_manual(
    values = c(
      "Boys" = "#4563A3",
      "Girls" = "#BA5142"
    )
  ) +
  labs(
    title = "192524124 Problem 6 - Redesigned Stacked Bar Chart",
    subtitle = "Actual department headcounts and gender composition are visible",
    x = "Department",
    y = "Actual count",
    caption = "Interpretation: The redesigned chart shows the actual headcount. Department A has 100 employees, Department B has 100 employees, and Department C has 200 employees."
    
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      color = "#4D884C",
      size = 18
    ),
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 13
    ),
    axis.title = element_text(size = 13),
    axis.text = element_text(size = 12),
    legend.position = "top",
    legend.text = element_text(size = 12)
  )

print(after_chart)

ggsave(
  "problem6_after.png",
  after_chart,
  width = 8,
  height = 6,
  dpi = 300
)