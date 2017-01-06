# Reproducible Research - Course 5

## Week 1 - Concept, Ideas and Structure

### What is reproducible research about?

Metaphor of music and instructions.
Develop the score of data analysis.

In data analysis, there is no standard for describing what is done.

Varieties of ways to communicate data analyis

### Reproducible research - Concept and Ideas

The ultimate standard for strengthening scientific evidence is replication of findings and conducting studies with independent:

* Investigators
* Data
* Analytical methods
* Laboratories
* Instruments

Replication is particularly important in studies that can impact broad policy or regulatory decisions.

Other scientist will cross-check and try to replicate results to confirm the findings.

** Reproducible research:**
Make analytic data and code available so that others may reproduce findings.

Validation of the data analysis.

Complex statistical methods are needed and subjected to intense scrutiny.

** Research Pipeline **

1- Measured data
2- Analytic data
3- Computational results
4- Presentation code (figures, tables, numerical summaries)
5- Article and text

Recommendations from the IOM report (omics-based tests):
* Data/metadata used to develop test should be made publicly available

* The computer code and fully specified computational procedures used for development of the candidate omics-based test should be made sustainably available

* Ideally the computer code that is released will encompass all of the steps of computational analysis, including data preprocessing steps, that have been described in this chapter. All aspects of the analysis need to be transparently reported.

** What do we need? **

* Analytic data are available
* Analytic code are available
* Documentation of code and data
* Standard means of distribution

** Who are the players? **

* Authors: want to make research reproducible

* Readers: want to reproduce

** Challenge **

* Needs a lot of effort to put data/results on the web
* Readers must download data/results individually and piece it together
* Readers may not have the same resources as Authors
* Few tool to help authors/Readers

** Literate statistical programming**
* An article is a stream of text and code
* Analysis code is divided into text and code chunks
* Each code chunk loads data and computes results* Presentation code formats results (tables, figures, etc.)
* Article text explains what is going on
* Literate programs can be weaved to produce human-readable documents and tangled to produce machine-readable documents.

Literate statistical programming is a general concept that requires:
* A documentation language (human readable)
* A programming language (machine readable)

Sweave uses LATEX and R as the documentation and programming language.

**knitr** is an alternative package brings together many features added on to the Sweave to address limitations.

**Summary**
* Reproducible research is important as a minimum standard, particularly for the studies that are difficult to replicate.
* Infrastructure is needed for creating and distributing reproducible documents, beyond what is currently available.
* There is a growing number of tools for creating reproducible documents.

### Scripting your analysis

** Golden rule of reproducibility: Script Everything**

Write everythign down

Analogy with a great piece of music

### Structure of a Data Analysis

** Steps in a data analysis **

|Order|Description|
|--|--|
|1|Define the question|
|2|Define the ideal dataset|
|3|Determine what data you can access
|4|Obtain the data
|5|Clean the data
|6|Exploratory data analysis
|7|Statistical prediction/modeling
|8|Interpret the results
|9|Challenge the results|
|10|Synthetize/write up the results
|11|Create reproducible code

 **The key Challenge in data analysis**
 - "Ask yourselves, what problem have you solved, ever, that was worth solving, where you knew all of the given information in advance? Where you didn't have a surplus of information and have to filter it out, or you had insufficient information and have to go find some?"

 Dan Myer, Mathematics Educator

Defining the question help to reduce a lot of dimensions in the dataset. Narrow down the interest and focus the question.
1. Start with a general question
2. Make it concrete

Define the ideal dataset:
* Descriptive: a whole population
* Exploratory: a random sample with many variables measured
* Inferential: the right population, randomly sampled
* Predictive: a training and test data set from the same population
* Causal: data from randomized study
* Mechanistic: data about all components of the system

Determine what data you can access
* Find free data on the web
* Sometimes buy data
* Be sure to respect the terms of use
* If the data don't exist, you may need to generate it yourself

Obtain the data
* Try to obtain the raw data
* Be sure to reference the source
* Polite emails go a long way
* If you will load the data from an internet source, record the url and time accessed.

Clean the data
* Raw data often needs to be processed
* If it is pre-processed, make sure you understand how
* Understand the source of the data (census, sample, convenience sample...)
* May need to reformating, subsampling - record these steps
* Determine if the data are good enough - if not, quit or change data

### Practice on a dataset

Dataset is from the kernlab package

```{r}
# if not install, install the kernlab package
library(kernlab)
data(spam)
str(spam[, 1:5])

# Perform the subsampling
set.seed(3435)
trainIndicator = rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)
```
Randomly separate the dataset into train and test spam dataset.
```{r}
trainSpam = spam[trainIndicator == 1, ]
testSpam = spam[trainIndicator == 0, ]

```
#### Exploratory data analysis

- Look at summaries of the data
- Check for missing data
- Create exploratory plots
- Perform exploratory analyses (e.g. clustering)

```{r}
# Summaries
names(trainSpam)
table(trainSpam$type)
plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve +1) ~ trainSpam$type)

# Relationship between predictors
plot(log10(trainSpam[, 1:4] +1))

# Clustering
hCluster = hclust(dist(t(trainSpam[, 1:57])))
plot(hCluster)

# Improved clustering
hClusterUpdated <- hclust(dist(t(log10(trainSpam[, 1:55] + 1 ))))
plot(hClusterUpdated)
```
#### Statistical prediction/modeling

- Should be informed by the results of your exploratory analysis
- Exact methods depends on the question of interest
- Transformation/processing should be accounted for when necessary
- Measures of uncertainty should be reported

Creation a logistic regression model (see machine learning course)

```{r}
trainSpam$numType <- as.numeric(trainSpam$type) - 1
costFunction <- function(x, y) {sum(x != (y > 0.5))}
cvError <- rep(NA, 50)

library(boot)

for(i in 1:55) {
      lmFormula <- reformulate(names(trainSpam)[i], response = "numType")
      glmFit <- glm(lmFormula, family = "binomial", data = trainSpam)
      cvError[i] <- cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}

# Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)]
```

Get a measure of uncertainty
Logistic regression model

```{r}
# Use the best model from the group
predictionModel <- glm(numType ~ charDollar, family = "binomial", data = trainSpam)

# Get predictions on the test set
predictionTest <- predict(predictionModel, testSpam)
predictedSpam <- rep("nonspam", dim(testSpam)[1])

# Classify as 'spam' for those with prob > 0.5
predictedSpam[predictionModel$fitted > 0.5] = "spam"
```
Results:
```{r}
# Classification table
table(predictedSpam, testSpam$type)

# Error rate
(61 + 458) / (1346 + 458 + 61 + 449)

```
Error rate is at 22%

#### Interpret results

- Use the appropriate language
    - Describes
    - Correlates with/associated with
    - Leads to/causes
    - Predicts
- Give an explanation
- Interpret coefficients
- Interpret measures of uncertainty (helps with calibration of the results)

For our example:
- The fraction of characters that are dollar signs can be used to predict if an email is SPAM.
- Anything with more than 6.6% dollar signs is classified as SPAM.
- More dollar signs always means more SPAM under our prediction
- Our test set error rate was 22.4%

#### Challenge the results

- Challenge all steps:
    - Question
    - Data source
    - Processing
    - Analysis
    - Conclusions
- Challenge measures of uncertainty
- Challenge choices of term to include in models
- Think of potential alternative analyses

#### Synthetize / Write-up results

- Lead with the question
- Summarize the analyses into the story
- Don't include every analysis, include it if:
    - if it is needed for the story
    -  if it is needed to address a challenge
- Order analyses according to the story, rather than chronologically
- Include "pretty"
 figures that contribute to the story

**In our example:**

Lead with the question:
- Can I use quantitative characteristics of the emails to classify them as SPAM/HAM?

Describe the approach:
- Collected data from UCI -> created training/test sets
- Explored relationships
- Choose logistic model on training set by cross-validation
- Applied to test, 78% test set accuracy

Interpret the results:
- Number of dollar signs seems reasonable (e.g. "Make money with this $$$$!")

Challenge the results:
- 78% isn't that great
- I could use more variables
- Why logistic regression?

**Finally: create reproducible code!**

### Organizing a Data Analysis

#### Data analysis files

- Data
    - Raw data
    - Processed data
- Figures
    - Exploratory figures
    - Final figures
- R code
    - Raw / unused scripts
    - Final scripts
    - R Markdown files
- Text
    - README files
    - Text of analysis / report

**Raw data** should be stored in your analysis folder. If accessed from the web, include url, description, and date accessed in README.
 **Processed data** should be named so it is easy to see which script generated the data. The processing script - processed data mapping should occur in the README. Processed data should be tidy.

 **Exploratory figures** made during the course of your analysis, not necessarily part of your final report. They fon't need to be pretty.

 **Final figures** are usually a small subset of the original figures. Axes and colors set are set to make the figure clear. They can be possibly displayed in multiple panels.

 **Raw scripts** may be less commented (but comments help you!), may be multiple versions, may include analyses that are later discarded.

 **Final scripts** are clearly commented including:
 - Small comments liberally - what, when, why, how
 - Bigger commented blocks for whole sections

Final scripts include processing details and only analyses that appear in the final write up.

**R Markdown files** can be used to generate reproducible reports. Text and R code are integrated. They are very easy to create in RStudio.

**README files** are not necessary if you use R Markdown. They should contain step-by-step instruction for analysis.

[Here is an example of README file](https://github.com/jtleek/swfdr/blob/master/README.md)

**Text of the document** should include a title, an introduction (motivation), methods (statistics you used), results (including measures of uncertainty), and conclusions (including potential problems). It should tell a story. It should not include every analysis you performed. References should be included for statistical methods.

### Resources:
[https://www.r-statistics.com/2010/09/managing-a-statistical-analysis-project-guidelines-and-best-practices/](https://www.r-statistics.com/2010/09/managing-a-statistical-analysis-project-guidelines-and-best-practices/)

[http://projecttemplate.net/index.html](http://projecttemplate.net/index.html)
