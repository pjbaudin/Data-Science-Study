library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(titanic)
library(dplyr)

# Set random seed. Don't remove this line.
set.seed(1)

df <- select(titanic_train, Survived, Pclass, Sex, Age)

# Shuffle the dataset, call the result shuffled
n <- nrow(df)
shuffled <- df[sample(n),]

# Split the data in train and test
train <- shuffled[1:round(0.7 * n), ]
test <- shuffled[(round(0.7 * n) + 1) : n, ]

tree <- rpart(Survived ~ ., train, method = "class")

fancyRpartPlot(tree)

# Predict the values of the test set: pred
pred <- predict(tree, test, type = "class")

# Construct the confusion matrix: conf
conf <- table(test$Survived, pred)

accs <- sum(diag(conf))/sum(conf)

# Calculation of a complex tree
set.seed(1)
tree <- rpart(Survived ~ ., train, method = "class", control = rpart.control(cp=0.00001))

# Draw the complex tree
fancyRpartPlot(tree)

# Prune the tree: pruned
pruned <- prune(tree, cp = 0.01)

# Draw pruned
fancyRpartPlot(pruned)

# Change the first line of code to use information gain as splitting criterion
tree_i <- rpart(Survived ~ ., train,
                method = "class",
                parms = list(split = "information"))

pred_i <- predict(tree_i, test, type = "class")

conf_i <- table(test$Survived, pred_i)

acc_i <- sum(diag(conf_i)) / sum(conf_i)

acc_i