library(tidyquant)
library(dplyr)

prices <- c(
  "BBAS3", "BBDC4", "ITUB4", "SANB11", "BSLI3",
  "BPAC11","BPAN4","MODL11","BNBR3","ABCB4"
) %>%
  paste0(".SA") %>%
  tq_get(get = "stock.prices" , from = "2010-01-01") %>%
  mutate(symbol = sub(".SA", "",symbol))

write.table(prices, "prices.csv", sep=",", row.names = FALSE)

prices <- read.csv("prices.csv") %>%
  mutate(date = as.Date(date))

