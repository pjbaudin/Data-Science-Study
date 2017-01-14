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

