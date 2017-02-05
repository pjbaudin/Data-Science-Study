# Datacamp - Statistical Modeling part 1

## R Object for statistical model

- A model is a representation for a purpose
- A mathematical model is built from mathematical stuff
- A statistical model is trained on data, built on objects

Functions, Formulas and Dataframes

Functions:
- model training functions
- functions to evaluate models

Formula:
- How to relate variables against one another

Example:
wage ~ exper + sector

- wage as a function of sector
- wage accounted for by sector
- wage modeled by sector
- wage explained by sector
- wage given sector
- wage broken down by sector

response variable ~ explanatory variables

Use the mosaic package to upgrade function like mean()

Use the statisticalModeling package

Example of use of grpahic function from the statisticalModeling package

# Create a boxplot
gf_boxplot(Cost ~ Sex, data = AARP)

# Make a scatterplot
gf_point(Cost ~ Age, data = AARP)
