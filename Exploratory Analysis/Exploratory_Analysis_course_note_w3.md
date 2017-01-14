# Exploratory Data Analysis - Week 3 - Course Notes

## Hierarchical Clustering

Clustering organizes things that are close into groups.

* How do we define close?
* How do we group things?
* How do we visualize the grouping?
* How do we interpret the grouping?

Hugely important and impactful method

* An agglomerative approach
* Requires
    * A defined distance
    * A merging approach
* Produces a tree showing how close things are to each other

How do we define close?

* Garbage in -> Garbage out
* Distance or similarity
    - Continuous - Euclidean Distance
    - Continuous - Correlation similarity
    - Binary - Manhattan Distance
* Pick a distance/similarity that makes sense for your problem

1. Calculate the distances between the different points

Can be done using the function dist()

2. Use hclust() to compute the clustering

3. Plot the result (dendogram)

Does not tell how many clusters there are.

4. Determine how many clusters

[Gallery for Clustering](http://gallery.r-enthusiasts.com/RGraphGallery.php?graph=79)

How to merge points together:
- average linkage
- complete linkage (farthest distance)

Heatmap function to help with large number and big scale dataset.

Helps to visualize groups or blocks of observations.

Should be used primarily for exploration

## K-means Clustering and Dimension Reduction

Help to understand patterns in data

Definition:
- A partioning approach:
    - fix a number of clusters
    - Get "centroids" of each cluster
    - Assign data points to closest "centroid"
    - Recalculate centroids
- Requires:
    - A defined distance metric
    - A number of cluseters
    - An initial guess as to cluster centroids
- Produces:
    - Final estimate of cluster centroids
    - An assignment of each point to clusters

In R, use the kmeans() function with the following paramters:
- x
- centers
- iter.max
- nstart

**Notes and further resources**
- kmeans requires a number of cluster
    - pick by eye/intuition
    - Pick by cross validation/information theory, etc.
    - Determining the number of clusters
- K-means is not deterministic
    - Different number of clusters
    - Different number of iterations

See book: Elements of statistical learning

## Dimension Reduction

Principal Components Analysis (PCA) and Singular Value Decomposition (SVD).

See R practice script

**Related problems**  
Working with multivariate variables
- Find a new set of multivariate variables that are uncorrelated and explain as much variance as possible
- If you put all the variables in one matrix, find the best matrix created with fewer variables (lower rank) that explains the original data  

The first goal is **statistical** and the second goal is **data compression**.

### Singular Value Decomposition

If X is a matrix with each variable in a column and each observations in a row then the SVD is a "matrix decomposition".

X = UDV(transpose)

Where the columns of U are orthogonal (left singular vectors), the columns of V are orthogonal (right singular vectors) and D is a diagonal matrix (singular values)

### Principal Component Analysis

The principal components are equal to the right singular values if you first scale (subtract the mean, divide but the standard deviation) the variables.


## Working with Colors
