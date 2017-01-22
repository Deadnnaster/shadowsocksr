FROM alpine

RUN apk update \
    && apk add python libsodium  py2-pip \
    && pip --no-cache-dir install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip

ENTRYPOINT ["/usr/bin/ssserver"]
RUN  ssserver -s 0.0.0.0 -p 12180 -k 112233 -m aes-256-cfb -O auth_aes128_md5 -o http_post_compatible -t 300
