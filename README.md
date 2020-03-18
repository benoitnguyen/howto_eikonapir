# howto_eikonapir

Working examples to download timeseries from Eikon **in R**. Works from home for me. This uses a community-developped package https://github.com/ahmedmohamedali/eikonapir
There's also an official package supported by Eikon for Python here: https://developers.refinitiv.com/eikon-apis/eikon-data-api/quick-start

# Pre-requisites
1) A valid username/password for Eikon
2) Eikon installed on the computer. See https://eikon.thomsonreuters.com/index.html if not.
3) R installed + eikonapir package from here: https://github.com/ahmedmohamedali/eikonapir. Readme in this repository will guide you for the installation. You will need first the package "devtools" installed.
4) Set an API KEY in the Eikon terminal. It's described here in the Eikon API webpage: https://developers.refinitiv.com/eikon-apis/eikon-data-api/quick-start 

# Setup in R

```
library(eikonapir)
set_proxy_port(36036L) # Check in API, you need to have an open port
set_app_id('XXXXXXXXXXXXXXXXXXXXXXXXXX') # Enter here your API KEY
```

# Download a timeserie

**!!! looks like that you can donwload only 3000 obs per request and requestable fields are only  CLOSE (end-of-day), HIGH, LOW, OPEN, and COUNT**

This example for end-of day EURUSD (its RIC in Eikon is "EUR="). ** 'CLOSE' fields will give the last end-of day value. Eg. On 17th March at noon, you will get the value on 16th March 
```
eurusd <- get_timeseries(list("EUR="),
                           fields=list("CLOSE"), 
                           start_date = "2010-01-01T00:00:00", 
                           end_date = today,
                           interval="daily",
                           normalize=FALSE,
                           debug=TRUE)
```


You can also download multiple series but beware the 3000 obs limitation by expanding the list: list("EUR=","JPY=")

```
fx <- get_timeseries(list("EUR=","JPY="),
                           fields=list("CLOSE"), 
                           start_date = "2010-01-01T00:00:00", 
                           end_date = today,
                           interval="daily",
                           normalize=FALSE,
                           debug=TRUE)
```

# Get the latest datapoint

Use the eikonapir function get_data():

```
eurlast <- get_data(list("EUR="),
               fields=list("TR.TIMESTAMP","CF_LAST"))
```

