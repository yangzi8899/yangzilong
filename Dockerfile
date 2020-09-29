FROM alpine:edge

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk add --no-cache shadowsocks-libev && \
	v2rayplugin_URL="$(wget -qO- https://api.github.com/repos/shadowsocks/v2ray-plugin/releases/latest | grep -E "browser_download_url.*linux-amd64" | cut -f4 -d\")" && \
    wget -O - $v2rayplugin_URL | tar -xz -C /usr/bin/ && chmod +x /usr/bin/v2ray-plugin_linux_amd64 && \
    mv /usr/bin/ss-server /usr/bin/nothing && \
    mv /usr/bin/v2ray-plugin_linux_amd64 /usr/bin/onthing && \
    rm -rf /var/cache/apk/*

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD /run.sh