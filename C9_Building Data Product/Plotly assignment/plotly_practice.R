# Load libraries
library(ggplot2)
library(plotly)
library(quantmod)

## Plotly and ggplot

# Plotly is an easy to use function to produce interactive graph. An simple way to demonstrate that is to use it in combination to ggplot2.

# Create the ggplot2 graph
ggplot(data = mtcars, aes(x = wt, y = mpg, col = cyl)) +
        geom_point()

# Make your plot interactive
ggplotly()


## Going further with plotly

# Plotly also proposes a range of function to improve the interactivity with the graph. In the following R code, we will produce a range slider of the Amazon stock.

# We will use the quantmod package to get the price of the amazon stocks and plot the time series.

# Download Amazon stock price
amazon_stock_price <- getSymbols("AMZN")

# Plot using the quantmod functionality
chartSeries(AMZN, subset = "last 3 months")
addBBands()

# Convert dataset to a dataframe and add Date column
AMZN_plotly <- as.data.frame(AMZN) 
AMZN_plotly$Date <- row.names(AMZN_plotly)

# Amazon Stock Price With Rangeslider using plotly
plot_ly(AMZN_plotly, x = ~ Date) %>%
        add_lines(y = ~ AMZN.Adjusted, name = "Amazon") %>% 
        rangeslider() %>% 
        layout(
                title = "Stock Price Amazon",
                xaxis = list(title = "Date"),
                yaxis = list(title = "Price"))

## Conclusion

# Plotly is a very efficient way to produce interactive visualization of the data. I enjoyed going through the examples on their website and my eyes was caught with the great possibility of making a full dashboard.

## R session info
sessionInfo()