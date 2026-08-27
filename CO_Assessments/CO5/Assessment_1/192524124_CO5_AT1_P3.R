# ============================================================
# 192524124 - Problem 48
# Linear vs Logarithmic Axis
# SIDE-BY-SIDE COMPARISON
# ============================================================

library(ggplot2)
library(grid)
library(gridExtra)

# ------------------------------------------------------------
# Follower Data
# ------------------------------------------------------------

follower_data <- data.frame(
  Entity = c(
    "Entity 1",
    "Entity 2",
    "Entity 3",
    "Entity 4"
  ),
  
  Followers = c(
    80,
    2500,
    60000,
    1800000
  )
)

# ------------------------------------------------------------
# Linear Axis
# ------------------------------------------------------------

linear_plot <- ggplot(
  follower_data,
  aes(
    x = Entity,
    y = Followers
  )
) +
  geom_col(
    fill = "#4563A3",
    width = 0.65
  ) +
  labs(
    title = "Linear Axis",
    x = "Entity",
    y = "Followers"
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
  follower_data,
  aes(
    x = Entity,
    y = Followers
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
    y = "Followers (log scale)"
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
# Ratios and Interpretation
# ------------------------------------------------------------

ratios <- c(
  2500 / 80,
  60000 / 2500,
  1800000 / 60000
)

interpretation <- paste(
  "INTERPRETATION",
  "",
  "Consecutive follower ratios are 31.25×, 24×, and 30×.",
  "The linear axis is dominated by the 1.8 million value,",
  "making the smaller entities difficult to compare.",
  "The logarithmic axis reveals the multiplicative structure",
  "much more clearly because values spanning several orders",
  "of magnitude are compressed into a readable scale.",
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

# ------------------------------------------------------------
# Main Title
# ------------------------------------------------------------

main_title <- textGrob(
  "192524124 Problem 48 - Linear vs Logarithmic Axis",
  x = unit(0.5, "npc"),
  hjust = 0.5,
  gp = gpar(
    fontsize = 16,
    fontface = "bold"
  )
)

# ------------------------------------------------------------
# Display - SIDE BY SIDE
# ------------------------------------------------------------

grid.newpage()

grid.arrange(
  main_title,
  
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
    1.8
  )
)