# linear optimisation
# maximise profit
# objective function: a*AAPL + b*IBM + c*GOOG + ... + g*GS
# where a, b, ..., g are weightages of the corresponding stocks
# and AAPL, IBM, ..., GS are the prices of the stocks at the start of each month

# constraints:
#   a + b + ... + g = 1
#   a, b, ..., g >= 0

library(lpSolve)

objective_fn <- # vector of stock prices at start of month
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

# repeat for every month
