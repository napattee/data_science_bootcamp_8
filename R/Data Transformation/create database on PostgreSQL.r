library(RPostgreSQL)
library(tidyverse)

con <- dbConnect(PostgreSQL(),
                  host = "rain.db.elephantsql.com",
                  port = 5432,
                  user = "komvtcfk",
                  password = "eRdyyHSDZysOxDAdcx5nCx4CpkoEb8VV",
                  dbname = "komvtcfk")

dbListTables(con)

pizza_menu <- data.frame(
  menu_id = 1:4,
  menu_name = c("cheese", "hawaiian", "seafood", "chicken bbq"),
  price = c(219, 219 , 239, 219)
  )

customers <- data.frame(
  customer_id = 1:6,
  customer_name = c("Lebron", "Taeyeon", "IU", "Rashford", "Ronaldo","Toey"),
  customer_city = c("Los Angeles","Seoul", "Seoul", "Manchester", "Riyadh", "Bangkok")
)

invoices <- data.frame(
  invoice_id = 1:6,
  customer_id = c(1, 3, 4, 5, 2, 6),
  menu_id =  c(1, 2, 3, 4, 2, 3),
  quantity = c(3, 1, 1, 2, 1, 1),
  invoice_date = c("2023-01-12",
                   "2023-01-07",
                   "2023-02-06",
                   "2023-03-16",
                   "2023-04-28",
                   "2023-05-31")
)

dbWriteTable(con,"pizza_menu",pizza_menu)
dbWriteTable(con,"customers", customers)
dbWriteTable(con,"invoices", invoices)

dbGetQuery(con, "select * from pizza_menu")
dbGetQuery(con, "select * from customers")
dbGetQuery(con, "select * from invoices")

dbRemoveTable(con, "invoices ")

invoices %>% 
  left_join(pizza_menu, by = "menu_id") %>% 
  left_join(customers, by = "customer_id") %>% 
  select(customer_name,menu_name,price,quantity) %>% 
  mutate(total_price = price * quantity)

invoices %>% 
  left_join(pizza_menu, by = "menu_id") %>% 
  left_join(customers, by = "customer_id") %>%
  select(customer_name,customer_city,menu_name) %>% 
  filter(customer_city == "Seoul")

invoices %>% 
  left_join(pizza_menu, by = "menu_id") %>% 
  left_join(customers, by = "customer_id") %>%
  select(menu_name,quantity) %>% 
  group_by(menu_name) %>% 
  summarise(total_quantiy = sum(quantity))

dbDisconnect(con)
