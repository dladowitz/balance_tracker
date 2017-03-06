# load libraries
library(dplyr)
library(plotly)

# load project files
source("localhost_db.R")

# Check connection
connected()

# query databse
# all.balances <- dbGetQuery(con, "SELECT * FROM account_balances")
# print(summary(all.balances))
# 
# 
# narrow.balances <- all.balances %>% select(account_name, balance, vendor_name, mint_account_id, type, created_at)
# by.account <- narrow.balances %>% arrange(mint_account_id, created_at)
# 
# # groupings
# active.investment.ids <- c(7180182, 3228223, 3228221, 3228222)
# active.investments <- narrow.balances %>% filter(mint_account_id %in% active.investment.ids) %>% arrange(created_at)
# 
# # Problems grouping by date. Maybe leap year?
# # active.investments.skip28 <- active.investments %>% filter(created_at < '2017-02-28 16:38:34' | created_at > '2017-03-01 01:01:01')
# 
# active.investments.by.day.list <- split(active.investments$balance, active.investments$created_at)
# 
# # Create data frame from date and daily balance total
# date <- c()
# daily_total <- c()
# 
# for(day in names(active.investments.by.day.list)){
#   date <- append(date, as.Date(day))
#   daily_total <- append(daily_total, sum(unlist(active.investments.by.day.list[day])))
# }
# 
# # data frame
# active.investment.daily.totals  = data.frame(date, daily_total)



# query databse
investment.query = "SELECT SUM(balance) AS daily_total, 
  date_trunc('day', created_at) AS date
  FROM account_balances
  WHERE type = 'investment'
  AND mint_account_id IN (7180182, 3228223, 3228221, 3228222)
  GROUP BY date_trunc('day', created_at)
  ORDER BY 2"

bank.query = "SELECT SUM(balance) AS daily_total,
  date_trunc('day', created_at) AS date
  FROM account_balances
  WHERE type = 'bank' or type = 'other property'
  AND mint_account_id IN (6763680, 6763682, 6788381, 6763681,6763683, 7162800 )
  GROUP BY date_trunc('day', created_at)
  ORDER BY 2"

debt.query= "SELECT SUM(balance) AS daily_total,
  date_trunc('day', created_at) AS date
  FROM account_balances
  WHERE type = 'loan' or type = 'credit'
  AND mint_account_id IN (7160389, 7198409, 7198408, 7003470)
  GROUP BY date_trunc('day', created_at)
  ORDER BY 2"

investments <- dbGetQuery(con, investment.query)
bank.accounts <- dbGetQuery(con, bank.query)
debts <- dbGetQuery(con, debt.query)
print(summary(investments))




# Create Plot
investment.plot <- ggplot(data = investments, aes(x = date, y = daily_total))
investment.plot <- investment.plot + geom_line() + geom_point(size = 2) + labs(title = "Investments")
print(investment.plot)

bank.plot <- ggplot(data = bank.accounts, aes(x = date, y = daily_total))
bank.plot <- bank.plot + geom_line() + geom_point(size = 2) + labs(title = "Investments")
print(bank.plot)

debt.plot <- ggplot(data = debts, aes(x = date, y = daily_total))
debt.plot <- debt.plot + geom_line() + geom_point(size = 2) + labs(title = "Investments")
print(debt.plot)



# Close connection. Probably should wrap queries in there own function. 
# http://stackoverflow.com/questions/33098894/rpostgresql-cannot-close-connections

dbDisconnect(con)
