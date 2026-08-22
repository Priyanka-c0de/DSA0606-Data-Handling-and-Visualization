# ============================================================
# Problem 30 - Reliance Industries Stock Analysis
# ============================================================

library(ggplot2)
library(gridExtra)
library(grid)

# ------------------------------------------------------------
# Data
# ------------------------------------------------------------

stock_data <- data.frame(
  Month = 1:15,
  Close = c(
    2330.73, 2508.87, 2390.67, 2513.89, 2563.02,
    2428.57, 2564.51, 2500.98, 2663.50, 2617.45,
    2659.06, 2745.53, 2983.36, 2815.43, 3030.43
  )
)

# ------------------------------------------------------------
# Analysis function
# ------------------------------------------------------------

analyze_window <- function(n) {
  
  d <- stock_data[1:n, ]
  
  # Linear trend model
  model <- lm(Close ~ Month, data = d)
  
  d$Trend <- predict(model)
  
  # Trend slope
  slope <- coef(model)[2]
  
  # Residual variation
  residuals <- d$Close - d$Trend
  residual_sd <- sd(residuals)
  
  # Total variation
  total_sd <- sd(d$Close)
  
  # Noise ratio
  noise_ratio <- residual_sd / total_sd
  noise_percent <- noise_ratio * 100
  
  # R-squared
  r_squared <- summary(model)$r.squared
  
  # Trend direction
  trend_direction <- ifelse(
    slope > 0,
    "Increasing",
    "Decreasing"
  )
  
  # ----------------------------------------------------------
  # Trend plot
  # ----------------------------------------------------------
  
  trend_plot <- ggplot(
    d,
    aes(
      x = Month,
      y = Close
    )
  ) +
    
    geom_line(
      color = "#4563A3",
      linewidth = 1
    ) +
    
    geom_point(
      color = "#4563A3",
      size = 3
    ) +
    
    geom_line(
      aes(y = Trend),
      color = "#BA5142",
      linewidth = 1.2
    ) +
    
    labs(
      title = paste0(
        "192524124 Problem 30 - Reliance Industries: ",
        n,
        "-Month Window"
      ),
      subtitle = "Actual monthly closing prices and fitted linear trend",
      x = "Month",
      y = "Closing Price (₹)"
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
        size = 11
      ),
      
      axis.title = element_text(
        size = 11
      )
    )
  
  # ----------------------------------------------------------
  # Calculation text
  # ----------------------------------------------------------
  
  calculation_text <- paste0(
    "TREND & NOISE CALCULATION\n\n",
    
    "Trend slope = ",
    round(slope, 2),
    " ₹/month\n",
    
    "Residual SD = ",
    round(residual_sd, 2),
    "\n",
    
    "Total variation SD = ",
    round(total_sd, 2),
    "\n\n",
    
    "Noise ratio = Residual SD / Total SD\n",
    
    "= ",
    round(residual_sd, 2),
    " / ",
    round(total_sd, 2),
    " = ",
    round(noise_ratio, 3),
    " (",
    round(noise_percent, 1),
    "%)\n",
    
    "R² = ",
    round(r_squared, 3),
    "\n\n",
    
    "Seasonality = Not reliably identifiable from this window."
  )
  
  calculation_grob <- grobTree(
    rectGrob(
      gp = gpar(
        fill = "#F5F8F2",
        col = "#62935D",
        lwd = 1.5
      )
    ),
    
    textGrob(
      label = paste(
        strwrap(
          calculation_text,
          width = 105
        ),
        collapse = "\n"
      ),
      x = unit(0.025, "npc"),
      y = unit(0.95, "npc"),
      hjust = 0,
      vjust = 1,
      gp = gpar(
        fontsize = 10,
        lineheight = 1.25
      )
    )
  )
  
  # ----------------------------------------------------------
  # Interpretation
  # ----------------------------------------------------------
  
  interpretation_text <- paste0(
    "INTERPRETATION\n\n",
    
    "The ",
    n,
    "-month window shows an ",
    trend_direction,
    " underlying trend. ",
    
    "The fitted slope of ",
    round(slope, 2),
    " ₹/month indicates that the estimated closing price ",
    "increases by approximately ₹",
    round(slope, 2),
    " per month on average. ",
    
    "The noise ratio is ",
    round(noise_percent, 1),
    "%, meaning that this proportion of the observed ",
    "price variation remains as residual variation after ",
    "removing the fitted linear trend. ",
    
    "Seasonality cannot be reliably established because ",
    "the window does not provide enough repeated cycles ",
    "to identify a stable seasonal pattern."
  )
  
  interpretation_grob <- grobTree(
    rectGrob(
      gp = gpar(
        fill = "#FFF8EC",
        col = "#BA5142",
        lwd = 1.5
      )
    ),
    
    textGrob(
      label = paste(
        strwrap(
          interpretation_text,
          width = 105
        ),
        collapse = "\n"
      ),
      x = unit(0.025, "npc"),
      y = unit(0.95, "npc"),
      hjust = 0,
      vjust = 1,
      gp = gpar(
        fontsize = 10,
        lineheight = 1.3
      )
    )
  )
  
  # ----------------------------------------------------------
  # Display
  # ----------------------------------------------------------
  
  grid.newpage()
  
  grid.arrange(
    trend_plot,
    calculation_grob,
    interpretation_grob,
    
    ncol = 1,
    
    heights = c(
      5.5,
      2.8,
      2.8
    )
  )
}

# ------------------------------------------------------------
# Separate views
# ------------------------------------------------------------

analyze_window(5)

analyze_window(10)

analyze_window(15)