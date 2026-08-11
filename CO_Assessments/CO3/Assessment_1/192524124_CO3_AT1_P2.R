# Problem 6 - Bean Plot

library(beanplot)

quiz_marks <- c(40, 50, 55, 60, 60, 60, 65, 70, 80)

beanplot(
  quiz_marks,
  col = "green3",
  border = "black",
  what = c(1, 1, 1, 1),
  names = "Quiz Marks",
  main = "192524124 Problem 6 - Bean Plot of Quiz Marks",
  xlab = "Quiz Marks",
  ylab = "Density"
)

mtext(
  "Interpretation: Nine quiz observations are shown. The repeated score of 60 occurs three times.",
  side = 1,
  line = 4,
  cex = 0.8,
  font = 3
)