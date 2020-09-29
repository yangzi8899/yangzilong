FROM alpine:edge

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk add --no-cache shadowsocks-libev && \
    wget -c https://github.com/shadowsocks/v2ray-plugin/releases/download/v${PV:=1.3.1}/v2ray-plugin-linux-amd64-v${PV:=1.3.1}.tar.gz -O - | tar -xz -C /usr/bin/ && \
    chmod +x /usr/bin/v2ray-plugin_linux_amd64 && \
    mv /usr/bin/ss-server /usr/bin/nothing && \
    mv /usr/bin/v2ray-plugin_linux_amd64 /usr/bin/onthing && \
    rm -rf /var/cache/apk/*

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD /run.sh
