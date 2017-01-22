FROM alpine:edge

RUN apk update \
    && apk add python libsodium unzip wget git py-pip \
    && rm -rf /var/cache/apk/*

RUN git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git\
#pip --no-cache-dir install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip\
    && rm -rf /tmp/*


WORKDIR ~/shadowsocksr/shadowsocks

ENTRYPOINT ["/usr/bin/ssserver"]
