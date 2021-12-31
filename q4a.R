library(readxl)
file <- read_xlsx('2016_data.xlsx')

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

# empty vectors to store VaR and CVaR
var95 <- c()
cvar95 <- c()
returns2 <- returns[-1] # remove 1st row of NA values

# 5% quantile for each stock
for (stock_idx in 2 : ncol(file)) {
    curr_stock_returns = returns2[, stock_idx]
    var = quantile(curr_stock_returns, probs = 0.05)
    worst5percent = curr_stock_returns[curr_stock_returns < var]
    var95[stock_idx - 1] = var
    cvar95[stock_idx - 1] = mean(worst5percent)
}

# percentages
p <- c(.15, .2, .2, .15, .1, .15, .05)

result_var <- p * var95
result_cvar <- p * cvar95
print(paste("VaR95 = ", sum(result_var), sep = ""))
print(paste("CVaR95 = ", sum(result_cvar), sep = ""))
