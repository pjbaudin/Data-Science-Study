## Datacamp ggplot part 1 - Course Notes

### Introduction: Grammar of graphics

** Essential grammatical elements **
* Data
* Aesthetics: the scales onto which we map our data
* Geometries: the visual elements used for our data

** All grammatical elements **
* Data
* Aesthetics: the scales onto which we map our data
* Geometries: the visual elements used for our data
* Facets: plotting small multiples
* Statistics: representations of our data to aid understanding
* Coordinates: the space on which the data will be plotted
* Themes: all non-data ink

### Data, Objects and Layers

**Data Layer**
* How data structure influences plots
* How we understand data

**Proper data format**
* Use tidyr and dplyr

### Aesthetics

**Visible Aesthetics**
* Attributes
* Mapping onto color
* Call in aes()

Typical aesthetics:

|Aesthetics|Description|
|-----------|----------|
|x        | X axis position|
|y        | Y axis position|
|colour   | Colour of dots, outlines of other shapes|
|fill     | Fill colour|
|size     | Diameter of points, thickness of lines|
|alpha    | Transparency|
|linetype | Line dash pattern|
|labels   | Text on a plot or axes|
|shape    | Shape|

**Modifying Aesthetics**
* Position identity (default)
* Position = jitter
* Can also create jitter as a variable and use it as needed to maintain consistency between graphs.
* Scale functions scale_ (limits, breaks, expand, labels)

** Aesthetics Best Practices **
* Be creative
* Clear guideline
* Jacques Bertin
* William Cleveland

Form follows function
Align scales
Categorical variables: avoid redondancy

### Plots

#### Scatter Plots
- Points, jitter, abline
- Each geom has specific aesthetics mapping
- ggplot2 can also calculate statistics
- geom_jitter helps to highlight region of high density
- Optimize shape, col and transparency of the plots

#### Bar Plots
- Histogram, bar, errorbar
- Histogram plot a statistical function, slightly different binning algorithm
- summary table calculated in the background
- Bar plot, two types: absolute counts or distribution

#### Line plots - Time series
- geom_line()
- can use line type, size and color
- area fill with geom_area() and can adjust the position.
- geom_ribbon() to show uncertainty

### qplot()
- Easier, quicker and dirtier
- qplot() takes advantage of the grammar of graphics

## Summary

1- Grammatical Elements

- data, aesthetics, geometry

2- Aesthetics Elements

- scales = encoding elements
- tidy dataset for different output and variables
- Continuous or categorical variables
- colors, shape, transparency
