# make sure not to make calls too often

# get time of last call
get_gwascat_time <-
function()
{
   last <- as.numeric(Sys.getenv("GWAScat_time"))
   ifelse(is.na(last), 0, last)
}

# set gwascat time to current
set_gwascat_time <-
function() {
    Sys.setenv(GWAScat_time = as.numeric(Sys.time()))
}

# time since last call
time_since_gwascat <-
function() {
    as.numeric(Sys.time()) - get_gwascat_time()
}

# check for last time since call, and delay if necessary
# also re-set the gwascat_time
delay_if_necessary <-
function()
{
    # look for delay amount in options; otherwise set to default
    delay_amount <- getOption("GWAScat_delay")
    if(is.null(delay_amount)) {
        delay_amount <- 1
    }

    if((timesince = time_since_gwascat()) < delay_amount) {
        Sys.sleep(delay_amount - timesince)
    }

    set_gwascat_time()
}
