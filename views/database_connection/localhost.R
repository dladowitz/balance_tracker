#https://www.r-bloggers.com/getting-started-with-postgresql-in-r/

#require library
require("RPostgreSQL")

# brings in database account information
source("accounts.R")


# create a connection

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")

# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "finances",
                 host = "localhost", port = 5432,
                 localhost.username, localhost.password)

# check for the account_balances table
dbExistsTable(con, "account_balances")
# TRUE


# query databse
balances <- dbGetQuery(con, "SELECT account_name, balance, created_at FROM account_balances LIMIT 10")
print(balances)




