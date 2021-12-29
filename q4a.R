file <- readxl('filename.xlsx')

# empty df to store the returns. Same size as file
returns <- data.frame(matrix(ncol = ncol(file), nrow = nrow(file)))

for (stock_idx in file[2nd col to last col]) {
    # iterate through cols (the different stocks)
    for (date_idx in file[2nd row to last row]) {
        # iterate through rows (each day)
        
        # today's returns = (today - yesterday) / yesterday
        curr_returns = (file[stock_idx][date_idx] - file[stock_idx][date_idx - 1]) / file[stock_idx][date_idx - 1]
        
        # store in returns dataframe
        df[stock_idx][date_idx] = curr_returns
    }
}

# empty vector to store VaR
var95 <- c()

# 5% quantile for each stock
for (stock_idx in file[2nd to last col]) {
    var = quantile(returns[stock_idx], probs = 0.05)
    var95[stock_idx - 1] = var
}

# percentages
p <- c(.15, .2, .2, .15, .1, .15, .05)

result <- p * var95
print(sum(result))
