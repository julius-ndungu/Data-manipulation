#install.packages("RMySQL")
# Connect to the MySQL database hosted locally
library(RMySQL)
con <- dbConnect(MySQL(), 
                 user = "your_username",
                 password = "your_password",
                 dbname = "example_db",
                 host = "localhost")
# Connect to the MySQL database hosted remotely
con <- dbConnect(MySQL(), 
                 user = "your_username",
                 password = "your_password",
                 dbname = "example_db",
                 host = "your_remote_server_ip_or_domain")


# Execute the SQL query
query <- "SELECT u.id, u.name
          FROM users u
          JOIN orders o ON u.id = o.user_id
          GROUP BY u.id, u.name"

result <- dbGetQuery(con, query)

# Close the database connection
dbDisconnect(con)
