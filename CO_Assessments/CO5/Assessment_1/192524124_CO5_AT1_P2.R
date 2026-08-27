# ============================================================
# Problem 47 - Bootstrap Resampling
# ============================================================

library(ggplot2)
library(grid)
library(gridExtra)

sample_data <- c(
  64,
  66,
  74,
  77,
  77
)

# One fixed bootstrap resample
bootstrap_sample <- c(
  77,
  64,
  77,
  74,
  77
)

bootstrap_mean <- mean(bootstrap_sample)

# Plot original sample
plot_data <- data.frame(
  Observation = 1:5,
  Output = sample_data
)

bootstrap_plot <- ggplot(
  plot_data,
  aes(
    x = Observation,
    y = Output
  )
) +
  
  geom_point(
    color = "#4563A3",
    size = 4
  ) +
  
  geom_line(
    color = "#4563A3",
    linewidth = 1
  ) +
  
  scale_x_continuous(
    breaks = 1:5
  ) +
  
  labs(
    title = "192524124 Problem 47 - Bootstrap Resampling",
    subtitle = "Original machine output counts",
    x = "Observation",
    y = "Output Count"
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
    )
  )

interpretation <- paste(
  "Calculation: One bootstrap resample = (77, 64, 77, 74, 77).",
  "Bootstrap mean = (77 + 64 + 77 + 74 + 77) / 5 = 73.8.",
  "Repeating this resampling thousands of times produces a distribution",
  "of bootstrap means. The middle 95% of those means gives a percentile",
  "bootstrap confidence interval for the population mean."
)

wrapped_text <- paste(
  strwrap(
    interpretation,
    width = 95
  ),
  collapse = "\n"
)

interpretation_text <- textGrob(
  wrapped_text,
  x = unit(0.5, "npc"),
  y = unit(0.5, "npc"),
  hjust = 0.5,
  vjust = 0.5,
  gp = gpar(
    fontsize = 10.5,
    lineheight = 1.4
  )
)

interpretation_box <- grobTree(
  rectGrob(
    gp = gpar(
      fill = "#F3F8F0",
      col = "#62935D",
      lwd = 1.5
    )
  ),
  interpretation_text
)

grid.newpage()

grid.arrange(
  bootstrap_plot,
  interpretation_box,
  ncol = 1,
  heights = unit.c(
    unit(1, "null"),
    grobHeight(interpretation_text) + unit(12, "mm")
  )
)