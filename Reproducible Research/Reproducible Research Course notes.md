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
* Define the question
* Define the ideal dataset
* Determine what data you can access
* Obtain the data
* Clean the data
* Exploratory data analysis
* Statistical prediction/modeling
* Interpret the results
* Challenge the results
* Synthetize/write up the results
* Create reproducible code

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

```{r}
library(kernlab)
data(spam)
str(spam[, 1:5])
```
