# Problem 24 - Collaboration Network

library(igraph)

# Define edges
edges <- data.frame(
  From = c(
    "R1", "R1", "R2",
    "R4", "R5"
  ),
  To = c(
    "R2", "R3", "R3",
    "R5", "R6"
  )
)

# Create the network
network <- graph_from_data_frame(
  edges,
  directed = FALSE,
  vertices = data.frame(
    name = c("R1", "R2", "R3", "R4", "R5", "R6")
  )
)

# Find connected components
components_info <- components(network)

# Display component information
print(components_info)

# Plot the network
plot(
  network,
  vertex.color = c(
    "#4563A3",
    "#4563A3",
    "#4563A3",
    "#BA5142",
    "#BA5142",
    "#BA5142"
  ),
  vertex.size = 30,
  vertex.label.color = "black",
  vertex.label.cex = 1.1,
  edge.color = "gray40",
  edge.width = 2,
  main = "192524124 Problem 24 - Researcher Collaboration Network"
)

# Add interpretation below the graph
mtext(
  "Interpretation:The network contains two separate connected groups.\nGroup 1 consists of R1, R2 and R3.\nGroup 2 consists of R4, R5 and R6.\nTherefore, the network is disconnected and forms multiple separate groups.",
  side = 1,
  line = 4,
  cex = 0.9
)