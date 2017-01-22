FROM alpine

RUN apk update \
    && apk add python libsodium unzip wget py2-pip \
    && pip install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip
  
#git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git\
  #  && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
  #  && unzip -d /tmp /tmp/manyuser.zip \
  #  && mv /tmp/shadowsocks-manyuser/ /shadowsocksr \
    && rm -rf /tmp/*


#WORKDIR ~/shadowsocksr/shadowsocks

ENTRYPOINT ["/usr/bin/ssserver"]
