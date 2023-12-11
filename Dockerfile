FROM debian:stable-slim as base

ENV HTTP_SERVER_PORT=8000

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 && \
    echo '#!/bin/bash' > /start.sh && \
    echo 'python3 -m http.server $HTTP_SERVER_PORT' >> /start.sh && \
    chmod +x /start.sh

FROM alpine as build

WORKDIR /

COPY mytrezor.tgz ./
RUN tar -xzf mytrezor.tgz

FROM base as final

COPY --from=build /mytrezor/ /mytrezor

WORKDIR /mytrezor
ENTRYPOINT [ "/start.sh" ]