FROM rocker/r-base:3.6.3
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
libxml2-dev \
libcairo2-dev \
libsqlite3-dev \
libmariadbd-dev \
libpq-dev \
libssh2-1-dev \
unixodbc-dev \
libcurl4-openssl-dev \
libssl-dev

## Install packages from CRAN
RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    lubridate \
    dplyr \
    bigrquery \
    
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
