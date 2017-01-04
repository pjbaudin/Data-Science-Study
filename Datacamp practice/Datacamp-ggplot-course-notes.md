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
