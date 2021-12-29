file <- readxl('2016_data.xlsx')

# empty df to store the returns. Same size as file
returns <- data.frame(matrix(ncol = ncol(file), nrow = nrow(file)))

for (stock_idx in 2:ncol(file)) {
    # iterate through cols (the different stocks)
    for (date_idx in 2:nrow(file)) {
        # iterate through rows (each day)
        
        # today's returns = (today - yesterday) / yesterday
        curr_returns = (file[date_idx, stock_idx] - file[date_idx - 1, stock_idx]) / file[date_idx - 1, stock_idx]
        
        # store in returns dataframe
        df[date_idx][stock_idx] = curr_returns
    }
}

# empty vector to store VaR
var95 <- c()

returns2 <- returns[-1] # remove 1st row of NA values

# 5% quantile for each stock
for (stock_idx in 2 : ncol(file)) {
    var = quantile(returns2[, stock_idx], probs = 0.05)
    var95[stock_idx - 1] = var
}

# percentages
p <- c(.15, .2, .2, .15, .1, .15, .05)

result <- p * var95
print(sum(result))
