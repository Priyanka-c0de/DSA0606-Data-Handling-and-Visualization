install.packages("maps")
install.packages("ggplot2")
library(maps)
library(ggplot2)
#data
geo_data <- data.frame(
  City = c("Chennai", "Bengaluru", "Hyderabad"),
  Population = c(500000, 700000, 600000),
  Avg_Temperature = c(75, 68, 80),
  Elevation = c(1000, 800, 1200)
)

geo_data$Longitude <- c(80.2707,77.5946,78.4867)
geo_data$Latitude  <- c(13.0827,12.9716,17.3850)

geo_data

#task 1:Geo map
map("world",
    xlim=c(75,82),
    ylim=c(10,20),
    fill=TRUE,
    col="lightgray")
points(
  geo_data$Longitude,
  geo_data$Latitude,
  pch=19,
  col="red",
  cex=2
)
text(
  geo_data$Longitude,
  geo_data$Latitude,
  labels=geo_data$City,
  pos=4
)

