FROM alpine

RUN apk update \
    && apk add python libsodium unzip wget py2-pip \
    && pip install https://github.com/Deadnnaster/shadowsocksr/archive/Deadnnaster-patch-1.zip
  
#git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git\
  #  && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
  #  && unzip -d /tmp /tmp/manyuser.zip \
  #  && mv /tmp/shadowsocks-manyuser/ /shadowsocksr \
  #  && rm -rf /tmp/*
#WORKDIR ~/shadowsocksr/shadowsocks

ENTRYPOINT ["/usr/bin/ssserver"]
CMD python server.py -s 0.0.0.0 -p 12180 -k 112233 -m aes-256-cfb -O auth_aes128_md5 -o http_post_compatible -t 300
