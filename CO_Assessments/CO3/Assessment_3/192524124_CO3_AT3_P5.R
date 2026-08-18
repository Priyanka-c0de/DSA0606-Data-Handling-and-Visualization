# Problem 24 - Sunburst Critique and Redesign

library(plotly)

company <- data.frame(
  Level1 = rep("Company", 8),
  Level2 = c(
    "Technology", "Technology", "Technology", "Technology",
    "Business", "Business", "Business", "Business"
  ),
  Level3 = c(
    "Software", "Software", "Hardware", "Hardware",
    "Sales", "Sales", "Finance", "Finance"
  ),
  Level4 = c(
    "Development", "Testing", "Engineering", "Support",
    "Domestic", "International", "Accounting", "Audit"
  ),
  Level5 = c(
    "Team A", "Team B", "Team C", "Team D",
    "Team E", "Team F", "Team G", "Team H"
  ),
  Level6 = c(
    "Unit 1", "Unit 2", "Unit 3", "Unit 4",
    "Unit 5", "Unit 6", "Unit 7", "Unit 8"
  ),
  Value = c(20, 15, 18, 12, 25, 20, 10, 8)
)

company$Path1 <- company$Level1

company$Path2 <- paste(
  company$Level1,
  company$Level2,
  sep = "/"
)

company$Path3 <- paste(
  company$Level1,
  company$Level2,
  company$Level3,
  sep = "/"
)

company$Path4 <- paste(
  company$Level1,
  company$Level2,
  company$Level3,
  company$Level4,
  sep = "/"
)

company$Path5 <- paste(
  company$Level1,
  company$Level2,
  company$Level3,
  company$Level4,
  company$Level5,
  sep = "/"
)

company$Path6 <- paste(
  company$Level1,
  company$Level2,
  company$Level3,
  company$Level4,
  company$Level5,
  company$Level6,
  sep = "/"
)

nodes <- data.frame(
  id = character(),
  label = character(),
  parent = character(),
  value = numeric(),
  stringsAsFactors = FALSE
)

for (i in 1:nrow(company)) {
  
  paths <- c(
    company$Path1[i],
    company$Path2[i],
    company$Path3[i],
    company$Path4[i],
    company$Path5[i],
    company$Path6[i]
  )
  
  labels <- c(
    company$Level1[i],
    company$Level2[i],
    company$Level3[i],
    company$Level4[i],
    company$Level5[i],
    company$Level6[i]
  )
  
  for (j in 1:6) {
    
    current_id <- paths[j]
    
    if (!current_id %in% nodes$id) {
      
      parent_id <- if (j == 1) "" else paths[j - 1]
      
      nodes <- rbind(
        nodes,
        data.frame(
          id = current_id,
          label = labels[j],
          parent = parent_id,
          value = 0,
          stringsAsFactors = FALSE
        )
      )
    }
    
    nodes$value[nodes$id == current_id] <-
      nodes$value[nodes$id == current_id] + company$Value[i]
  }
}

sunburst_colors <- c(
  "#F4E285",
  "#B8B8B8",
  "#E76F51",
  "#F4A6A6",
  "#D95F02",
  "#8ECAE6",
  "#9B59B6",
  "#2A9D8F",
  "#E9C46A",
  "#457B9D",
  "#C77DFF",
  "#6A994E",
  "#F1C0E8",
  "#577590",
  "#F9844A",
  "#90BE6D",
  "#F9C74F",
  "#43AA8B",
  "#B56576",
  "#6D597A",
  "#355070",
  "#E56B6F",
  "#EAAC8B",
  "#5A189A",
  "#52B788",
  "#FFB703",
  "#219EBC",
  "#8338EC",
  "#FB5607",
  "#264653"
)

sunburst <- plot_ly(
  data = nodes,
  ids = ~id,
  labels = ~label,
  parents = ~parent,
  values = ~value,
  type = "sunburst",
  branchvalues = "total",
  marker = list(
    colors = sunburst_colors[1:nrow(nodes)],
    line = list(
      color = "white",
      width = 1
    )
  )
)

sunburst <- sunburst %>%
  layout(
    title = list(
      text = paste0(
        "<b>192524124 - Problem 24 - Six-Level Sunburst Chart</b>",
        "<br><sub>Flawed Visualization: Deep hierarchy creates tiny and unreadable outer rings</sub>"
      ),
      x = 0.5,
      xanchor = "center"
    ),
    annotations = list(
      list(
        text = "<b>Interpretation:</b> Six hierarchical levels produce very small outer segments, making labels and comparisons difficult to read.",
        x = 0.5,
        y = -0.12,
        xref = "paper",
        yref = "paper",
        showarrow = FALSE,
        xanchor = "center",
        font = list(size = 13)
      )
    ),
    margin = list(
      l = 20,
      r = 20,
      t = 90,
      b = 100
    )
  )

sunburst


treemap <- plot_ly(
  data = nodes,
  ids = ~id,
  labels = ~label,
  parents = ~parent,
  values = ~value,
  type = "treemap",
  branchvalues = "total"
)

treemap <- treemap %>%
  layout(
    title = list(
      text = paste0(
        "<b>192524124 - Problem 24 - Redesigned Treemap</b>",
        "<br><sub>Redesign: Treemap improves readability of deep hierarchical structures</sub>"
      ),
      x = 0.5,
      xanchor = "center"
    ),
    annotations = list(
      list(
        text = "<b>Interpretation:</b> The treemap uses rectangular areas efficiently, making the six-level hierarchy easier to explore and compare.",
        x = 0.5,
        y = -0.12,
        xref = "paper",
        yref = "paper",
        showarrow = FALSE,
        xanchor = "center",
        font = list(size = 13)
      )
    ),
    margin = list(
      l = 20,
      r = 20,
      t = 90,
      b = 100
    )
  )

treemap