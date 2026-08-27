# ============================================================
# 192524124 - Problem 50
# GDP Linear vs Logarithmic Axis
# SIDE-BY-SIDE COMPARISON
# ============================================================

library(ggplot2)
library(grid)
library(gridExtra)

# ------------------------------------------------------------
# GDP Data
# ------------------------------------------------------------

gdp_data <- data.frame(
  Entity = c(
    "Entity 1",
    "Entity 2",
    "Entity 3",
    "Entity 4"
  ),
  
  GDP = c(
    2,
    40,
    900,
    21000
  )
)

# ------------------------------------------------------------
# Linear Axis
# ------------------------------------------------------------

linear_plot <- ggplot(
  gdp_data,
  aes(
    x = Entity,
    y = GDP
  )
) +
  geom_col(
    fill = "#4563A3",
    width = 0.65
  ) +
  labs(
    title = "Linear Axis",
    x = "Entity",
    y = "GDP (₹ billion)"
  ) +
  scale_y_continuous(
    labels = scales::comma
  ) +
  theme_classic(base_size = 12) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 14
    ),
    
    axis.title = element_text(
      size = 11
    ),
    
    axis.text.x = element_text(
      size = 10
    )
  )

# ------------------------------------------------------------
# Logarithmic Axis
# ------------------------------------------------------------

log_plot <- ggplot(
  gdp_data,
  aes(
    x = Entity,
    y = GDP
  )
) +
  geom_col(
    fill = "#BA5142",
    width = 0.65
  ) +
  scale_y_log10(
    labels = scales::comma
  ) +
  labs(
    title = "Logarithmic Axis",
    x = "Entity",
    y = "GDP (₹ billion, log scale)"
  ) +
  theme_classic(base_size = 12) +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 14
    ),
    
    axis.title = element_text(
      size = 11
    ),
    
    axis.text.x = element_text(
      size = 10
    )
  )

# ------------------------------------------------------------
# Ratios
# ------------------------------------------------------------

ratios <- c(
  40 / 2,
  900 / 40,
  21000 / 900
)

# ------------------------------------------------------------
# Interpretation
# ------------------------------------------------------------

interpretation <- paste(
  "INTERPRETATION",
  "",
  "Consecutive GDP ratios are 20×, 22.5×, and 23.33×.",
  "The linear axis is dominated by the largest GDP value of ₹21,000 billion,",
  "making the smaller values difficult to compare.",
  "The logarithmic axis reveals the multiplicative structure more clearly",
  "because it represents relative rather than absolute differences.",
  sep = "\n"
)

interpretation_text <- textGrob(
  interpretation,
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


main_title <- textGrob(
  "192524124 Problem 50 - GDP Linear vs Logarithmic Axis",
  x = unit(0.5, "npc"),
  hjust = 0.5,
  gp = gpar(
    fontsize = 16,
    fontface = "bold"
  )
)


grid.newpage()

grid.arrange(
  main_title,
  
  # Linear Axis + Logarithmic Axis
  arrangeGrob(
    linear_plot,
    log_plot,
    ncol = 2
  ),
  
  interpretation_box,
  
  ncol = 1,
  
  heights = c(
    0.7,
    5,
    1.5
  )
)