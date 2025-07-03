# Load package
library(glmtoolbox)

# Load data
data <- read.csv("data/credit_scoring.csv")

# Drop leakage features
data$leak_col_good <- NULL
data$leak_col_subtle <- NULL

# Model logistic regression
model <- glm(default ~ ., data = data[,-1], family = "binomial")

# Hosmer-Lemeshow Test
hltest(model)
