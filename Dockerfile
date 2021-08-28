FROM postgres:13.3

RUN apt-get update \
    && apt-get -y install vim --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*