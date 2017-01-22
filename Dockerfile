FROM alpine
MAINTAINER smounives <smounives@outlook.com>

RUN apk add --no-cache libsodium py-pip \
    && pip --no-cache-dir install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip

ENTRYPOINT ["/usr/bin/ssserver"]
