FROM alpine:latest

RUN adduser -S -D -H -h /xmrig miner
RUN apk --no-cache upgrade && \
    apk --no-cache add \
      git \
      cmake \
      libuv-dev \
      build-base && \
    git clone https://github.com/xmrig/xmrig tmp && \
    cd tmp && \
    sed -i 's/kDonateLevel = 5/kDonateLevel = 0/' src/donate.h && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_HTTPD=OFF && \
    make && \
    mkdir /xmrig && \
    mv xmrig /xmrig/xmrig && \
    apk del \
      build-base \
      cmake \
      git && \
    cd /xmrig && \
    rm -rf tmp
    
USER miner
WORKDIR /xmrig

RUN ls -la

ENTRYPOINT ["./xmrig", "--donate-level=1"]
