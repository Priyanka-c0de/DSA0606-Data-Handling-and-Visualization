# ============================================================
# Problem 46 - Hypothetical Outcome Plot
# ============================================================

library(ggplot2)
library(grid)
library(gridExtra)

# Five plausible individual draws from a distribution
# with mean = 120 ms and SD = 10 ms

hop_data <- data.frame(
  Frame = 1:5,
  Response_Time = c(
    112,
    125,
    118,
    131,
    121
  )
)

hop_plot <- ggplot(
  hop_data,
  aes(
    x = Frame,
    y = Response_Time
  )
) +
  
  geom_line(
    color = "#4563A3",
    linewidth = 1
  ) +
  
  geom_point(
    color = "#4563A3",
    size = 4
  ) +
  
  geom_hline(
    yintercept = 120,
    color = "#BA5142",
    linewidth = 1.2,
    linetype = "dashed"
  ) +
  
  scale_x_continuous(
    breaks = 1:5
  ) +
  
  labs(
    title = "192524124 Problem 46 - Hypothetical Outcome Plot",
    subtitle = "Five plausible individual server response-time outcomes",
    x = "HOP Frame",
    y = "Response Time (ms)",
    caption = "Dashed line = true mean (120 ms)"
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
    ),
    
    plot.caption = element_text(
      hjust = 0.5,
      size = 9
    )
  )

# Interpretation
interpretation <- paste(
  "Interpretation: The five frames show plausible individual response times",
  "around the true mean of 120 ms. Watching the frames in sequence reveals",
  "the natural variability of individual outcomes. A single error bar only",
  "summarizes uncertainty and does not show how individual outcomes could vary."
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
  hop_plot,
  interpretation_box,
  ncol = 1,
  heights = unit.c(
    unit(1, "null"),
    grobHeight(interpretation_text) + unit(12, "mm")
  )
)