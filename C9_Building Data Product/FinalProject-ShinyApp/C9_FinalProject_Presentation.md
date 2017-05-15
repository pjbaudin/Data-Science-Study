Data Science Specialization - Final Project
========================================================
author: Pierre Baudin
date: 14-May-17
autosize: true

Builing Data Product using Shiny Application
========================================================

Final project for the *Data Science Specialization*

Proposed by: John Hopkins University
Available on: <http://coursera.org>

*What is Shiny?*

- A web application framework for R
- Turn your analyses into interactive web applications
- No HTML, CSS, or JavaScript knowledge required

For more details, please visit:

<http://shiny.rstudio.com/>


Project Details
========================================================

*Objective:*

Present stock data and basic forecast

Allow user to adjust:

- the timeframe
- inflation
- forecast period
- confidence interval
        
![Shiny logo](Shinylogo.png)

Basics of the application
========================================================

- Using the *quantmod* package, the application uses data from Yahoo finance
- The stock price is adjusted for inflation using the data from the Federal Reserve Bank of St. Louis. 
- Forecast is computed using a basic arima function using the *forecast* package.
- Interactive plot of the forecast object uses *ggfortify*.

Shiny App Intructions
========================================================

- Enter a stock code (example: PFE for Pfizer)

```
  X PFE.Open PFE.High PFE.Low PFE.Close PFE.Volume PFE.Adjusted
1 1    26.15    26.42   25.98     26.29   40644800     16.94124
2 2    26.38    26.57   26.29     26.38   32246200     16.99923
```
- Select the time period you are interested in
- Select whether you want to adjust for inflation
- Select the forecast period (in number of days)
- Select the confidence interval

***

Enjoy the app!

<https://pjbaudin.shinyapps.io/c9_finalproject/>
