FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libevent-dev \
    libboost-dev \
    libdb5.3++-dev \
    libsqlite3-dev \
    libzmq3-dev \
    libminiupnpc-dev \
    libnatpmp-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /bitcoin

CMD rm -rf build && \
    cmake -B build -DBUILD_GUI=OFF -DWITH_ZMQ=ON -DWITH_MINIUPNPC=ON -DUSE_NATPMP=ON -DRDTS_CONSENT=IMPLICIT && \
    cmake --build build -j$(nproc)