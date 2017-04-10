# Load libraries
library(dplyr)
library(ggplot2)
library(MASS)
library(caret)
library(randomForest)
library(rpart)
library(gbm)
library(survival)
library(purrr)
library(reshape2)
library(tictoc)

# set working directory
setwd("D:/Data Science/R-Data-Science-Study/C8_Machine Learning/Final_project")

# Download training and testing datasets
download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv",
              "pml-training.csv")
download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv",
              "pml-testing.csv")

# Data kindly shared by http://groupware.les.inf.puc-rio.br/har

# Read the dataset
raw_train <- read.csv("pml-training.csv")
raw_validation <- read.csv("pml-testing.csv")

# Remove columns with observation number
drops <- c("X")

processed_train <- raw_train[ , !(names(raw_train) %in% drops)]
processed_validation <- raw_validation[, !(names(raw_validation) %in% drops)]

# Further cleaning to remove NA and empty observations
ind <- colSums(is.na(processed_train) | processed_train == "")

toremove_cols <- names(ind[ind > 0])

final_train <- processed_train[, !(names(processed_train)
                                        %in% toremove_cols)]

final_validation <- processed_validation[, !(names(processed_validation)
                                             %in% toremove_cols)]

# Shuffling of the train and validation set to ensure proper randomness of the dataset

final_train <- final_train[sample(nrow(final_train)), ]

# function to compare different ML algorithm with a n sampling number as input
model_comparison <- function(n) {
        train_1000 <- final_train[1:n, ]
        cross_1000 <- final_train[(n + 1):(n + 0.5 * n), ]
        m <- nrow(cross_1000)
        
        # LDA - Linear Discriminant Analysis
        tic()
        
        modelLDA <- train(classe ~ ., method = "lda", data = train_1000)
        predsLDA <- predict(modelLDA, newdata = cross_1000)
        crosstabLDA <- table(predsLDA, cross_1000$classe)
        accuracyLDA <- (sum(diag(crosstabLDA)) * 100) / m
        testPredictionsLDA <- predict(modelLDA, newdata = final_validation)
        
        exectimeLDA <- toc()
        exectimeLDA <- exectimeLDA$toc - exectimeLDA$tic
        
        # Classification tree
        tic()
        
        modelRpart <- train(classe ~ ., method = "rpart", data = train_1000)
        predsRpart <- predict(modelRpart, newdata = cross_1000)
        crosstabRpart <- table(predsRpart, cross_1000$classe)
        accuracyRpart <- (sum(diag(crosstabRpart)) * 100) / m
        testPredictionsRPart <- predict(modelRpart, newdata = final_validation)
        
        exectimeRpart <- toc()
        exectimeRpart <- exectimeRpart$toc - exectimeRpart$tic
        
        # Random Forest
        tic()
        
        modelRF <- train(classe ~ ., method = "rf", data = train_1000)
        predsRF <- predict(modelRF, newdata = cross_1000)
        crosstabRF <- table(predsRF, cross_1000$classe)
        accuracyRF <- (sum(diag(crosstabRF)) * 100) / m
        testPredictionsRF <- predict(modelRF, newdata = final_validation)
        
        exectimeRF <- toc()
        exectimeRF <- exectimeRF$toc - exectimeRF$tic
        
        # GBM - Generalized Boosted Models
        tic()
        
        modelGBM <- train(classe ~ ., method = "gbm", data = train_1000, verbose = FALSE)
        predsGBM <- predict(modelGBM, newdata = cross_1000)
        crosstabGBM <- table(predsGBM, cross_1000$classe)
        accuracyGBM <- (sum(diag(crosstabGBM)) * 100) / m
        testPredictionsGBM <- predict(modelGBM, newdata = final_validation)
        
        exectimeGBM <- toc()
        exectimeGBM <- exectimeGBM$toc - exectimeGBM$tic
        
        print(testPredictionsLDA)
        print(testPredictionsRPart)
        print(testPredictionsRF)
        print(testPredictionsGBM)

        df <- data.frame(SamplingSize = n,
                         ModelType = c("LDA", "ClassificationTree", "RF", "GBM"),
                         ModelAccuracy = c(accuracyLDA, accuracyRpart, accuracyRF, accuracyGBM),
                         ModelTime = c(exectimeLDA, exectimeRpart, exectimeRF, exectimeGBM))
}

sampling <- list(500, 750, 1000, 2000, 5000, 10000)

resdf <- map_df(sampling, model_comparison)

ind <- c("ModelType")

resdf[, ind] <- as.factor(resdf[, ind])

# Palette of color for color-blind with grey
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(resdf, aes(x = SamplingSize, y = ModelAccuracy, colour = ModelType)) +
        geom_point(size = 4, alpha = 0.6) +
        geom_line(lty = 2, alpha = 0.4, lwd = 1.2) +
        ggtitle("Model Accuracy vs. Sample size") +
        xlab("Sample Size (n)") +
        ylab("Model Accuracy (%)") +
        geom_hline(yintercept = 100, colour = "red", lty = 1.2) +
        scale_colour_manual(values = cbPalette)


ggplot(resdf, aes(x = SamplingSize, y = ModelTime, colour = ModelType)) +
        geom_point(size = 4, alpha = 0.6) +
        geom_line(lty = 2, alpha = 0.4, lwd = 1.2) +
        ggtitle("Execution Time vs. Sample size") +
        xlab("Sample Size (n)") +
        ylab("Execution Time (sec)") +
        scale_colour_manual(values = cbPalette)


ggplot(resdf, aes(x = ModelTime, y = ModelAccuracy, colour = as.factor(SamplingSize))) +
        geom_point(size = 4, alpha = 0.6) +
        geom_line(lty = 2, alpha = 0.4, lwd = 1.2) +
        ggtitle("Execution Time vs. Sample size") +
        xlab("Execution Time (sec)") +
        ylab("Model Accuracy (%)") +
        facet_wrap(~ ModelType) +
        geom_hline(yintercept = 100, colour = "red", lty = 1.2) +
        scale_colour_manual(values = cbPalette)


