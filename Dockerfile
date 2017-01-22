#FROM alpine
#RUN apk update \
#    && apk add python libsodium  py2-pip \
#    && pip --no-cache-dir install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip
#ENTRYPOINT ["/usr/bin/ssserver"]
FROM centos:centos6
RUN yum  -y install git python libsodium \
    && git clone https://github.com/shadowsocksr/shadowsocksr.git 
RUN cd ~/shadowsocksr bash initcfg.sh 
RUN cd ~/shadowsocksr/shadowsocks \
    && python server.py -p 8080 -k 112233 -m aes-256-cfb -O auth_aes128_md5 -o http_simple
