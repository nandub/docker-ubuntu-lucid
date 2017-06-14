FROM ubuntu:10.04
LABEL maintainer "Fernando Ortiz <nandub@nandub.info>"

WORKDIR /root

COPY ./patches /root/patches
RUN chmod 755 /root/patches/lucid-sources.sh \
    && /root/patches/lucid-sources.sh \
    && rm -rf /root/patches

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/lib/apt/lists/partial

ENTRYPOINT ["/bin/bash"]
