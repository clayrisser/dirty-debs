FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    alien \
    apt-file \
    autoconf \
    automake \
    build-essential \
    checkinstall \
    cmake \
    curl \
    git \
    git-lfs \
    jq \
    make \
    meson \
    ninja-build \
    tree \
    vim && \
    apt-file update

WORKDIR /tmp

ENTRYPOINT [ "/bin/bash" ]
