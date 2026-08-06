#=========================================================
# SET 15 - Student Mini Data Analysis
#=========================================================
library(ggplot2)
library(zoo)
student <- read.csv(file.choose(), stringsAsFactors = FALSE)
head(student)
str(student)
summary(student)

#=========================================================
# QUESTION 1
# Histogram of Math Score
#=========================================================

ggplot(student, aes(x = Math_Score)) +
  
  geom_histogram(
    bins = 5,
    fill = "steelblue",
    color = "black"
  ) +
  
  labs(
    title = "Histogram of Math Scores",
    x = "Math Score",
    y = "Frequency"
  ) +
  
  theme_minimal(base_size = 14)

#=========================================================
# QUESTION 1
# Boxplot of Science Score by Gender
#=========================================================

ggplot(student,
       aes(x = Gender,
           y = Science_Score,
           fill = Gender)) +
  
  geom_boxplot() +
  
  labs(
    title = "Science Score by Gender",
    x = "Gender",
    y = "Science Score"
  ) +
  
  theme_minimal(base_size = 14)

cat("\n-------------------------------------------\n")
cat("QUESTION 1 INTERPRETATION\n")
cat("-------------------------------------------\n")
cat("Most students scored between 60 and 90 in Mathematics.\n")
cat("Female students performed slightly better in Science than Male students.\n")

#=========================================================
# QUESTION 2
# Scatter Plot with Regression Line
#=========================================================

ggplot(student,
       aes(x = Study_Hours,
           y = Math_Score,
           color = Gender)) +
  
  geom_point(
    size = 4,
    alpha = 0.8
  ) +
  
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "black",
    linewidth = 1
  ) +
  
  labs(
    title = "Relationship between Study Hours and Math Score",
    x = "Study Hours",
    y = "Math Score",
    color = "Gender"
  ) +
  
  theme_minimal(base_size = 14)

cat("\n-------------------------------------------\n")
cat("QUESTION 2 INTERPRETATION\n")
cat("-------------------------------------------\n")
cat("Students who study more hours generally obtain higher Math scores.\n")
cat("The regression line indicates a positive relationship.\n")

#=========================================================
# QUESTION 3
# Monthly Average Math Score Trend
#=========================================================
student$Exam_Date <- as.Date(student$Exam_Date)
student$Month <- format(student$Exam_Date,"%Y-%m")

monthly_avg <- aggregate(
  Math_Score ~ Month,
  data = student,
  FUN = mean
)

colnames(monthly_avg)[2] <- "Average_Math"

print(monthly_avg)

monthly_avg$Moving_Average <- zoo::rollmean(
  monthly_avg$Average_Math,
  k = 2,
  fill = NA,
  align = "right"
)

print(monthly_avg)

#=========================================================
# Line Chart
#=========================================================

ggplot(monthly_avg,
       aes(x = Month,
           y = Average_Math,
           group = 1)) +
  
  geom_line(
    color = "blue",
    linewidth = 1.2
  ) +
  
  geom_point(
    color = "red",
    size = 3
  ) +
  
  geom_line(
    aes(y = Moving_Average),
    color = "darkgreen",
    linetype = "dashed",
    linewidth = 1
  ) +
  
  labs(
    title = "Monthly Average Math Score Trend",
    x = "Month",
    y = "Average Math Score"
  ) +
  
  theme_minimal(base_size = 14)

cat("\n-------------------------------------------\n")
cat("QUESTION 3 INTERPRETATION\n")
cat("-------------------------------------------\n")
cat("The line chart shows the monthly average Math scores.\n")
cat("The dashed green line represents the moving average.\n")
cat("An increasing trend indicates improvement in student performance over time.\n")