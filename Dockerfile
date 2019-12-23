FROM rocker/r-ver:3.6.1

COPY stretch_backports.list /etc/apt/sources.list.d/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      libxml2 \
      libxml2-dev \
      libcurl4-openssl-dev \
      openjdk-11-jdk-headless \
      libssl-dev \
      zlib1g-dev \
      libbz2-dev \
      liblzma-dev \
      libpcre3-dev \
    && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH=/usr/lib/jvm/default-java/lib/server

RUN R CMD javareconf \
    && ln -s /usr/local/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
    && install.r \
      devtools \
      curl \
      rjson \
      rlang \
      rJava \
      xml2 \
      SqlRender \
      DatabaseConnector \
      DatabaseConnectorJars

