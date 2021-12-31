# linear optimisation
# maximise profit
# objective function: a*AAPL + b*IBM + c*GOOG + ... + g*GS
# where a, b, ..., g are weightages of the corresponding stocks
# and AAPL, IBM, ..., GS are the prices of the stocks at the start of each month

# constraints:
#   a + b + ... + g = 1
#   a, b, ..., g >= 0
library(lpSolve)
source("./q4a_q4b.R")

# create monthly_returns dataframe
monthly_returns <- data.frame(matrix(rep(0, 84), ncol = 7, nrow = 12))
colnames(monthly_returns) <- colnames(returns3)[,-1]
for (day in 1:nrow(returns3)) {
  curr_month = as.numeric(format(as.Date(returns3$Date[day]), "%m"))
  monthly_returns[curr_month,] <- monthly_returns[curr_month,] + as.numeric(returns3[day,-1])
}

for (month in 1:12) {
  print(paste("end of month ", month, sep=""))
  objective_fn <- as.numeric(monthly_returns[month,]) # vector of stock prices at start of month
  constraint_mat <- matrix(c(1,1,1,1,1,1,1,
                             1,0,0,0,0,0,0,
                             0,1,0,0,0,0,0,
                             0,0,1,0,0,0,0,
                             0,0,0,1,0,0,0,
                             0,0,0,0,1,0,0,
                             0,0,0,0,0,1,0,
                             0,0,0,0,0,0,1),
                           ncol=7 , byrow=TRUE)
  constraint_dir <- c("=", ">=", ">=", ">=", ">=", ">=", ">=", ">=")
  constraint_rhs <- c(1, 0, 0, 0, 0, 0, 0, 0)

  linearprob <- lp("max", objective_fn, constraint_mat,
                    constraint_dir, constraint_rhs, compute.sens=TRUE)
  print(linearprob$solution) # prints the optimal solution for weightages of the corresponding stocks
}

# Only 2 constraints: weights must add up to 1.0 and each weight must not be negative.
# Assumptions: no restrictions on the variance of the portfolio, no minimum/maximum weight for any stock
# The programme will thus put 100% into the stock with the highest returns from the previous month
