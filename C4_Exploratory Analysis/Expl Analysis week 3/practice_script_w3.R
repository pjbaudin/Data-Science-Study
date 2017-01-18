# hierarchical clustering - Example

set.seed(1234)

par(mar = c(0, 0, 0, 0))

x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)

plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame) ## Eucledian by default
hClustering <- hclust(distxy)
plot(hClustering)

## Prettier dendograms

myplclust <- function(hclust, lab = hclust$labels, lab.col = rep(1, length(hclust$labels)), hang = 0.1, ...) {
      # modification of plclust for plotting hclust objects in colours
      # Copyright Eva KF Chan 2009
      # Arguments:
      # hclust: hclust object
      # lab: a character vextor of labels of the leaves of the tree
      # lab.col: colour of the labels;
      # NA = defaults device foreground colour
      # hang: as in hclust and plclust
      # Side effect: a display of hierarchical cluster with coloured leaf labels
      y <- rep(hclust$height, 2)
      x <- as.numeric(hclust$merge)
      y <- y[which(x < 0)]
      x <- x[which(x < 0)]
      x <- abs(x)
      y <- y[order(x)]
      x <- x[order(x)]
      plot(hclust, labels = FALSE, hang = hang, ...)
      text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order], col = lab.col[hclust$order], srt = 90, adj = c(1, 0.5), xpd = NA, ...)
}

myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)



###########################
# K-means clustering example

set.seed(1234)

par(mar = c(0, 0, 0, 0))

x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)

plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

# Computing kmeans
dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)

# Print the cluster element
kmeansObj$cluster

# Print centers location in the space
kmeansObj$centers

# Plot the results
par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)


#######################
# Visualizing the clusters using a heatmap
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)

par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")


##################
# Principal Component Analysis and Singular Value Decomposition
# 

set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

par(mar = rep(0.2, 4))
heatmap(dataMatrix)

# Add a pattern to the data

set.seed(678910)
for (i in 1:40) {
      # flip a coin
      coinFlip <- rbinom(1, size = 1, prob = 0.5)
      # if coin is head add a common pattern to that row
      if (coinFlip) {
            dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
      }
}

# Replot the data
par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

par(mar = rep(0.2, 4))
heatmap(dataMatrix)

# Patterns in rows and columns
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]

par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, ,xlab = "Row mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)


## Components of the SCD - U and V

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered): 1])
plot(svd1$u[, 1], 40:1, , xlab = "Row", ylab = "First left singular vector", pch = 19)
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector", pch = 19)


## Components of the SVD - Variance Explained
par(mfrow = c(1, 2), mar = c(5, 4, 4, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular Values", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch = 19)


## Relationship to principal components
svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)
plot(pca1$rotation[, 1], svd1$v[, 1], pch = 19, xlab = "Principal component 1", ylab = "Right Singular Vector 1")
abline(c(0, 1))

## Components of the SVD - Variance Explained
## part 2

constantMatrix <- dataMatrixOrdered * 0
for (i in 1:dim(dataMatrixOrdered)[1]) {
      constantMatrix[i, ] <- rep(c(0, 1), each = 5)
}

svd1 <- svd(constantMatrix)
par(mfrow = c(1, 3))
image(t(constantMatrix)[, nrow(constantMatrix):1])
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2 / sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch = 19)


## Let's add a second pattern in the dataset

set.seed(678910)
for (i in 1:40) {
      # flip a coin
      coinFlip1 <- rbinom(1, size = 1, prob = 0.5)
      coinFlip2 <- rbinom(1, size = 1, prob = 0.5)
      # if coin is heads, add a common pattern to that row
      if (coinFlip1) {
            dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 5), each = 5)
      }
      if (coinFlip2) {
            dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 5), 5)
      }
}

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]

### Ploting the results
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rep(c(0, 1), each = 5), pch = 19, xlab = "Column", ylab = "Pattern 1")
plot(rep(c(0, 1), 5), pch = 19, xlab = "Column", ylab = "Pattern 2")

# Run teh SVD on thi snew matrix to try to find the two patterns
# V and patterns of variance in rows

svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd2$v[, 1], pch = 19, xlab = " Column", ylab = "First right singular vector")
plot(svd2$v[, 2], pch = 19, xlab = "Column", ylab = " Second right singular vector")

# d and variance explained
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2 / sum(svd1$d^2), xlab = "Column", ylab = "Percent of variance explained", pch = 19)

# Handling missing values
dataMatrix2 <- dataMatrixOrdered
## Randomly insert some missing data
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA

# svd1 <- svd(scale(dataMatrix2))
## Does not work because of missing values

# One solution: Imputing {impute}
# library(impute) not working for R version 3.3.2
# Use:
# dataMatrix2 <- impute.knn(dataMatrix2$data)

