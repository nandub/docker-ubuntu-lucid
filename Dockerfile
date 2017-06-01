FROM ubuntu:10.04
LABEL maintainer "Fernando Ortiz <nandub@nandub.info>"

WORKDIR /root

RUN mkdir /root/patches
COPY ./patches /root/patches
RUN chmod 755 /root/patches/lucid-sources.sh

RUN /root/patches/lucid-sources.sh

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get --no-install-recommends install -y \
    build-essential \
    ca-certificates \
    curl \
    wget \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
