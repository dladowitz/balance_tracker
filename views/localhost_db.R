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
con <- dbConnect(drv, dbname = localhost.financeDB,
                  host = "localhost", port = 5432,
                  localhost.username, localhost.password)


# verify connection
connected <- function(){
  if (dbExistsTable(con, "account_balances")) {
    print(paste0("Successfully connected to: ", localhost.financeDB))
  } else {
    print(paste0("Something has gone wrong. Could not connect to: ", localhost.financeDB))
  }
}






