# Reproducible Research - Week 4

## Caching Computations

### Literate Statistical Programming

* An article is a stream of text and code
* Analysis code is divided into text and code "chunks"
* Each code chunk loads data and computes results
* Presentation code formats results (tables, figures, etc.)
* Article explains what is going on
* Literate programs can be weaved to produce human-readable documents and tangled to produce machine-readable documents

* Literate programming is a general concept that requires:
      * A documentation language (human readable)
      * A programming language (machine readable)

Package for caching computation: cacher

* Evaluates code written in files and stores intermediate results in a key-value database
* R expressions are given SHA-1 hash values so that changes can be tracked and code reevaluated if necessary
* "Cacher packages" can be build for distribution
* Others can "clone" an analysis and evaluate subsets of code or inspect data objects

Using *cacher* as an author
1. Parse the R source file; create the necessary cache directories and subdirectories
2. Cycle through each expression in the source file
      - If an expression has never been evaluated, evaluate it and store any resulting R objects in the cache database
      - If a cached result exists, lazy-load the result from the cache database and move to the next expression
      - If an expression does not create any R objects (i.e. there is nothing to cache), add the expression to the list of expressions where evaluation needs to be forced
      - Write out metadata for this expression to the metadata file
3. The *cachepackage* function creates a *cacher* package storing:
      - Source file
      - Cached data objects
      - Metadata
4. Package file is zipped and can be distributed
5. Readers can unzip the file and immediately investigate its content via *cacher* package

***cacher* summary**
- the *cacher* package can be used by authors to create cache packages from data analyses for distribution
- Readers can use the *cacher* package to inspect others' data analyses by examining cached computations
- *cacher* is mindful of readers' resources and efficiently loads only those data objects that are needed

## Case Study: Air Pollution

Reproducible research helps to review and evaluate results of research in a timely manner and with all the information available.

Outliers can make a difference in the interpretation of the data. The most of the information cannot come from only a few outliers.

## Case Study: High Throughput Biology

Reproducible Research example and best practices

## Commentaries on Data Analysis
