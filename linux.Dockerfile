# FROM debian:bullseye
FROM debian:bullseye@sha256:6d4f6b40afca63b59a44ffcedbb2e457e83b645710916d7f094b79c6c591ac28

ARG UID=1000
ARG GID=1000

RUN apt-get update && apt-get install -y \
  build-essential cmake ninja-build \
  g++-aarch64-linux-gnu \ 
  musl-tools && \
  rm -rf /var/lib/apt/lists/*


RUN addgroup --gid $GID pych_builder && \
  adduser --uid $UID --gid $GID --disabled-password --gecos "" pych_builder
  
USER pych_builder
WORKDIR /app

