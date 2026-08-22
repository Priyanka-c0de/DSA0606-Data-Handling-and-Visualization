# ============================================================
# Problem G10 - Cartogram Evaluation
# ============================================================

library(ggplot2)
library(gridExtra)
library(grid)

# ------------------------------------------------------------
# Geographic reference data
# ------------------------------------------------------------

country_data <- data.frame(
  Country = c(
    "Country A",
    "Country B",
    "Country C",
    "Country D",
    "Country E"
  ),
  
  GDP = c(
    30,
    55,
    90,
    120,
    180
  ),
  
  map_x = c(
    1,
    2.5,
    4,
    5.5,
    7
  ),
  
  map_y = c(
    1.5,
    2,
    1.5,
    2,
    1.5
  )
)

# ------------------------------------------------------------
# Geographic Map
# ------------------------------------------------------------

geographic_plot <- ggplot(
  country_data,
  aes(
    x = map_x,
    y = map_y
  )
) +
  
  geom_tile(
    aes(
      width = 1.2,
      height = 1.2
    ),
    fill = "#4563A3",
    color = "white",
    linewidth = 1
  ) +
  
  geom_text(
    aes(
      label = Country
    ),
    color = "white",
    fontface = "bold",
    size = 4
  ) +
  
  coord_fixed(
    xlim = c(0.2, 7.8),
    ylim = c(0.7, 2.8),
    expand = FALSE
  ) +
  
  labs(
    title = "192524124 Problem G10 - Geographic Map",
    subtitle = "Geographic shape preserves country recognizability"
  ) +
  
  theme_void() +
  
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 15
    ),
    
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 11
    ),
    
    plot.margin = margin(
      10, 20, 10, 20
    )
  )

# ------------------------------------------------------------
# GDP Cartogram Data
# ------------------------------------------------------------

cartogram_data <- data.frame(
  Country = c(
    "Country A",
    "Country B",
    "Country C",
    "Country D",
    "Country E"
  ),
  
  GDP = c(
    30,
    55,
    90,
    120,
    180
  ),
  
  x = c(
    1.0,
    2.7,
    4.3,
    5.8,
    7.2
  ),
  
  y = c(
    1.4,
    1.9,
    1.4,
    2.0,
    1.4
  ),
  
  width = c(
    0.55,
    0.80,
    1.10,
    1.30,
    1.55
  ),
  
  height = c(
    0.55,
    0.80,
    1.10,
    1.30,
    1.55
  )
)

# ------------------------------------------------------------
# GDP Cartogram
# ------------------------------------------------------------

cartogram_plot <- ggplot(
  cartogram_data,
  aes(
    x = x,
    y = y
  )
) +
  
  geom_tile(
    aes(
      width = width,
      height = height,
      fill = GDP
    ),
    color = "white",
    linewidth = 1
  ) +
  
  # Keep the smallest country label readable
  geom_text(
    aes(
      label = ifelse(
        Country == "Country A",
        "A",
        Country
      )
    ),
    color = "white",
    fontface = "bold",
    size = 3.4
  ) +
  
  scale_fill_gradient(
    low = "#F4D35E",
    high = "#A63D32",
    name = "GDP"
  ) +
  
  coord_fixed(
    xlim = c(0.3, 8.2),
    ylim = c(0.45, 2.9),
    expand = FALSE
  ) +
  
  labs(
    title = "192524124 Problem G10 - GDP Cartogram",
    subtitle = "Country areas are resized according to GDP"
  ) +
  
  theme_void() +
  
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 15
    ),
    
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 11
    ),
    
    legend.position = "right",
    
    plot.margin = margin(
      10, 20, 10, 20
    )
  )

# ------------------------------------------------------------
# Evaluation
# ------------------------------------------------------------

evaluation_text <- paste(
  "EVALUATION\n\n",
  
  "A GDP-based cartogram is effective for showing economic magnitude",
  "because countries with larger GDP receive greater visual area.",
  "However, this creates a trade-off: geographic accuracy and country",
  "recognizability decrease as the shapes are increasingly distorted.",
  "When distortion becomes extreme, readers may have difficulty",
  "identifying countries without labels or a geographic reference.",
  
  sep = " "
)

evaluation_grob <- grobTree(
  
  rectGrob(
    gp = gpar(
      fill = "#F3F8F0",
      col = "#62935D",
      lwd = 1.5
    )
  ),
  
  textGrob(
    label = paste(
      strwrap(
        evaluation_text,
        width = 115
      ),
      collapse = "\n"
    ),
    
    x = unit(0.025, "npc"),
    y = unit(0.92, "npc"),
    
    hjust = 0,
    vjust = 1,
    
    gp = gpar(
      fontsize = 10,
      lineheight = 1.35
    )
  )
)

# ------------------------------------------------------------
# Recommendation
# ------------------------------------------------------------

recommendation_text <- paste(
  "RECOMMENDATION\n\n",
  
  "Use a moderate cartogram transformation rather than extreme resizing.",
  "Keep country labels visible and provide a small geographic reference",
  "map alongside the cartogram. This preserves the ability to compare GDP",
  "while helping readers identify the countries despite the distortion.",
  
  sep = " "
)

recommendation_grob <- grobTree(
  
  rectGrob(
    gp = gpar(
      fill = "#FFF6E8",
      col = "#BA5142",
      lwd = 1.5
    )
  ),
  
  textGrob(
    label = paste(
      strwrap(
        recommendation_text,
        width = 115
      ),
      collapse = "\n"
    ),
    
    x = unit(0.025, "npc"),
    y = unit(0.92, "npc"),
    
    hjust = 0,
    vjust = 1,
    
    gp = gpar(
      fontsize = 10,
      lineheight = 1.35
    )
  )
)

# ------------------------------------------------------------
# Display complete answer
# ------------------------------------------------------------

grid.newpage()

grid.arrange(
  
  geographic_plot,
  
  cartogram_plot,
  
  evaluation_grob,
  
  recommendation_grob,
  
  ncol = 1,
  
  heights = c(
    2.7,
    3.2,
    2.2,
    2.0
  )
)