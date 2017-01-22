FROM alpine

RUN apk update \
    && apk add python libsodium  py2-pip \
    && pip --no-cache-dir install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip

ENTRYPOINT ["/usr/bin/ssserver"]
