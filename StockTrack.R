# Load necessary libraries
install.packages(c("tidyquant", "dplyr"))
library(tidyquant)
library(dplyr)

# List of stock tickers you are interested in
stock_tickers <- c("AAPL", "GOOGL", "AMZN", "MSFT")

# Fetch the latest stock prices
stock_data <- tq_get(stock_tickers, from = Sys.Date() - 7) # Last 7 days

# Calculate basic statistics for each stock
stats <- stock_data %>%
  group_by(symbol) %>%
  summarise(
    Latest_Price = last(close),  # The last recorded price
    Highest_Price = max(close),  # Highest price in the period
    Lowest_Price = min(close),   # Lowest price in the period
    Average_Price = mean(close)  # Average price in the period
  )

# Print the statistics
print(stats)

