FROM alpine

RUN apk update \
    && apk add python libsodium unzip wget py2-pip \
    && pip install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip
  
#git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git\
  #  && wget --no-check-certificate https://github.com/breakwa11/shadowsocks/archive/manyuser.zip -O /tmp/manyuser.zip \
  #  && unzip -d /tmp /tmp/manyuser.zip \
  #  && mv /tmp/shadowsocks-manyuser/ /shadowsocksr \
  #  && rm -rf /tmp/*

#WORKDIR ~/shadowsocksr/shadowsocks

ADD config.json /config.json

ENTRYPOINT ["/usr/bin/ssserver"]
RUN ssserver -p 443 
             -k password 
             -m aes-256-cfb 
             -O auth_sha1_v4 
             -o http_simple
#{ 
   #-c:/config.json,
   #-m: aes-256-cfb ,
   #-O: auth_aes128_md5 ,  
   #-o: http_post_compatible 
 # }
