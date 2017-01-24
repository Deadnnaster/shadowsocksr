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

#ADD config.json /config.json
ENTRYPOINT ["/usr/bin/ssserver"]
RUN ssserver -c /config.json
#{ 
   #-c:/config.json,
   #-m: aes-256-cfb ,
   #-O: auth_aes128_md5 ,  
   #-o: http_post_compatible 
 # }
{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "server_port": 8388,
    "local_address": "127.0.0.1",
    "local_port": 1080,
    "password": "password@8388",
    "timeout": 120,
    "method": "aes-256-cfb",
    "protocol": "auth_sha1_compatible",
    "protocol_param": "",
    "obfs": "http_simple_compatible",
    "obfs_param": "",
    "redirect": "",
    "dns_ipv6": false,
    "fast_open": false,
    "workers": 1
}
