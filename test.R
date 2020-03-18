############## IMPORTANT: Prerequisites
# 1) R installed
# 2) eikonapir package installed
# 3) EIKON installed and running
# 4) an API KEY set in the EIKON terminal

############## TO READ FIRST
# each request seems limited to 3000 obs. 
# Need sometimes to split requests or select smaller timeframe.

library(data.table)
library(magrittr)

library(eikonapir)
set_proxy_port(36036L) # Check in API/this is an open port
set_app_id('XXXXXXXXXXXXXXXXXXXXXXXXX') # the API API KEY (to be set in the eikon terminal)

eurusd <- get_timeseries(list("EUR="),
                           fields=list("CLOSE"), # To get multiple fields expand this list. Could be "*" for all fields. Unfortunatly only CLOSE LOW HIGH OPEN COUNT seems requestable.
                           start_date = "2010-01-01T00:00:00", 
                           end_date = today,
                           interval="daily",
                           normalize=FALSE,
                           debug=TRUE)

# to get the last data point
eurlast <- get_data(list("EUR="),
               fields=list("TR.TIMESTAMP","CF_LAST"))
               
               
               
               
               
