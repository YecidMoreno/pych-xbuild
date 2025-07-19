# FROM alpine:latest
FROM alpine@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1


ARG UID=1000
ARG GID=1000

RUN apk add --no-cache \
    bash \
    iproute2 \
    can-utils \
    build-base \
    cmake \
    git \
    linux-headers \
    openssh

RUN apk add --no-cache \
    openssh \
    rsync

RUN apk add --no-cache \
    ninja

RUN apk add --no-cache \
    docker-cli

RUN addgroup -g $GID pych_builder && \
    adduser -D -u $UID -G pych_builder pych_builder

USER pych_builder
WORKDIR /app
