FROM alpine

RUN apk update \
    && apk add python libsodium unzip wget\
    && rm -rf /var/cache/apk/*

RUN makedir /shadowsocksr \
#git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git\
#pip --no-cache-dir install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip\
    
    && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
    && unzip -d /tmp /tmp/manyuser.zip \
    && mv /tmp/shadowsocks-manyuser/ /shadowsocksr \
    && rm -rf /tmp/*


WORKDIR ~/shadowsocksr/shadowsocks

ENTRYPOINT ["/usr/bin/ssserver"]
