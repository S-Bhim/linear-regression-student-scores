# GRIP Task 1 Prediction Using Supervised ML with R
# prepared by - Soumabha Bhim

# Importing the data set
data <- read.csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv")

# Fitting the model
model <- lm(Scores ~ Hours, data)

# Plotting the Model
plot(data$Hours, data$Scores, main = "Hours of Study vs Scores",
     ylab = "Scores", xlab = "Hours Studied",
     col = "blue", pch = 16)
abline(model, col = "red")

# Model Summary
summary(model)

# Residual Analysis
par(mfrow = c(2, 2))
plot(model)

# Evaluating model performance
predicted <- predict(model, data)
rmse <- sqrt(mean((data$Scores - predicted)^2))
cat("Root Mean Squared Error (RMSE):", rmse, "\n")

# Predicted score if student studied for 9.25 hours a day
predicted_score <- predict(model, data.frame(Hours = 9.25))
cat("Predicted score if student studies for 9.25 hours/day:", predicted_score, "\n")

