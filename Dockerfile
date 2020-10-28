FROM rocker/shiny-verse:4.0.3

RUN rm -rf /srv/shiny-server/*
RUN echo > /srv/shiny-server/index.html

RUN apt-get -qqy update 
RUN apt-get -qqy install libudunits2-0 libudunits2-dev libcurl4-openssl-dev libxml2-dev libgdal-dev libssl-dev > /dev/null
RUN sed -i "s/MAKE=.*/MAKE='make -j 8'/" /usr/local/lib/R/etc/Renviron

RUN R -q -e "devtools::install_github('osbdr/versions')"

WORKDIR /srv/shiny-server/Demo

RUN R -q -e "versions::install.versions('shinydashboard', '0.7.1');"

COPY . /srv/shiny-server/Demo
