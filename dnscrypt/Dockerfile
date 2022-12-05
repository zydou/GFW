FROM golang:alpine AS builder
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
        build-base \
        upx \
        git && \
    cd /root && \
    git clone https://github.com/jedisct1/dnscrypt-proxy src && \
    cd /root/src/dnscrypt-proxy && \
    LDFLAGS="-s -w" && \
    go build -ldflags "$LDFLAGS" -mod vendor -o /usr/bin/dnscrypt-proxy && \
    upx --lzma /usr/bin/dnscrypt-proxy

FROM alpine:3
COPY --from=builder /usr/bin/dnscrypt-proxy /usr/bin/dnscrypt-proxy
RUN mkdir -p -m 777 /etc/dnscrypt-proxy
EXPOSE 5353/udp
CMD /usr/bin/dnscrypt-proxy -config /etc/dnscrypt-proxy/dnscrypt-proxy.toml
