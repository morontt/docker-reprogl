FROM debian:bookworm-slim

ENV TZ "Europe/Moscow"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    nodejs npm \
    pngquant \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN npm install npm@latest -g \
    && npm install -g yarn \
    && npm install -g grunt-cli@1.4.3 \
    ;

COPY ./.bashrc /root/.bashrc
