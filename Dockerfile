FROM debian:stable-slim as base

EXPOSE 8000

WORKDIR /mytrezor

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 && \
    echo '#!/bin/bash' > /start.sh && \
    echo 'python3 -m http.server 8000' >> /start.sh && \
    chmod +x /start.sh

FROM alpine as build

WORKDIR /

RUN wget https://wallet.trezor.io/data/mytrezor-archive.tgz && \
    tar -xzf  mytrezor-archive.tgz

FROM base as final

COPY --from=build /mytrezor/ /mytrezor

ENTRYPOINT [ "/start.sh" ]