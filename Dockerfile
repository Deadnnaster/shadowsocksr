FROM alpine

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 51348
ENV PASSWORD=
ENV METHOD      aes-256-cfb
ENV PROTOCOL    auth_aes128_md5_compatible
ENV OBFS      http_post
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8
ENV DNS_ADDR_2  8.8.4.4


RUN apk update \
    && apk add python \
    libsodium \
    unzip \
    wget \
    git \
  && rm -rf /var/cache/apk/*



RUN git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git
    && cd ~/shadowsocksr
    && bash initcfg.sh


WORKDIR ~/shadowsocks


CMD python ~/shadowsocks/server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD  -O $PROTOCOL -o $OBFS
