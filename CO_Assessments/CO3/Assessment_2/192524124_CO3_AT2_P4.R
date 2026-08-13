# Problem 18 - Bean Plot of Delivery Times

library(beanplot)

delivery_times <- c(
  15, 16, 17, 18, 19, 20,
  45, 46, 47, 48, 49, 50
)

beanplot(
  delivery_times,
  col = "green3",
  border = "black",
  what = c(1, 1, 1, 1),
  names = "Delivery Time",
  main = "192524124 Problem 18 - Bean Plot of Delivery Times",
  xlab = "Delivery Time (minutes)",
  ylab = "Density"
)

mtext(
  "Interpretation: Two distinct clusters suggest two different delivery processes, zones, or methods.",
  side = 1,
  line = 4,
  cex = 0.8,
  font = 3
)