FROM r-base:4.0.0
WORKDIR /app
COPY R/main.R /app/
CMD Rscript main.R
