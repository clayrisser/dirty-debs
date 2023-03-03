FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    alien \
    apt-file \
    autoconf \
    automake \
    build-essential \
    cmake \
    curl \
    git \
    git-lfs \
    jq \
    make \
    mason \
    ninja-build \
    vim && \
    apt-file update

WORKDIR /tmp

ENTRYPOINT [ "/bin/bash" ]
