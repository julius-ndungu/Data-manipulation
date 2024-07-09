library(tidyverse)
#each column is a variable
#each row is an observation
#each cell is a single value
table2 %>% 
  pivot_wider(names_from = type, values_from = count)
# problem of pivot wider
x <- tibble(
  A = c("a","b","c"),
  B = c("one","two","three"),
  C = c(1,2,3)
)
x %>% pivot_wider(names_from = B, values_from = C)
x %>% pivot_wider(names_from = B, values_from = C, values_fill = 0)

mtcars %>% 
  pivot_wider(id_cols = c(vs,am),
              names_from = cyl,
              values_from = mpg)
mtcars %>% 
  pivot_wider(id_cols = c(vs,am),
              names_from = cyl,
              values_from = mpg, values_fn = list(mpg = mean),
              values_fill = list(mpg = 999))
table4a
table4a %>% 
  pivot_longer(cols = c("1999","2000"))
table4a %>% 
  pivot_longer(cols = c("1999":"2000"),
               names_to = "year",
               values_to = "no of cases")
table5
table5 %>% 
  unite(col = "new_year",
        c("century","year"),sep = "")
table5 %>% 
  separate(col = "rate", sep = "/", into = c("cases","population"))
table5 %>% 
  separate(col = "rate", sep = "/",
           into = c("cases","population"),
          convert = T )


6+9





# Install and load necessary packages
#install.packages("vars")
library(vars)

# Set seed for reproducibility
set.seed(123)

# Generate synthetic time series data
n <- 100  # Number of observations
var1 <- cumsum(rnorm(n))  # Cumulative sum of random normal variates
var2 <- 0.7 * var1 + rnorm(n)  # Linear relationship with noise

# Combine into a data frame
data <- data.frame(var1, var2)

# Plot the generated data
plot(data, type = "l", col = c("blue", "red"), lty = 1, ylab = "Values", xlab = "Time")

# Estimate a VAR model
var_model <- VAR(data, p = 2, type = "const")  # p is the lag order

# Summary of the VAR model
summary(var_model)

