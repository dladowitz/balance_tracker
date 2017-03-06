
source("localhost_db.R")

# Check connection
connected()

# query databse
all_balances <- dbGetQuery(con, "SELECT account_name, balance, created_at FROM account_balances")
print(all_balances)

# Close connection. Probably should wrap queries in there own function. 
# http://stackoverflow.com/questions/33098894/rpostgresql-cannot-close-connections

dbDisconnect(con)
