ARG VERSION=latest
FROM tobyxdd/hysteria:${VERSION} as upstream

FROM alpine:3 as build
COPY --from=upstream /usr/local/bin/hysteria /usr/local/bin/hysteria
RUN set -xe && \
    chmod 755 /usr/local/bin/hysteria && \
    apk add --no-cache upx && \
    upx --lzma /usr/local/bin/hysteria

FROM alpine:3
COPY --from=build /usr/local/bin/hysteria /usr/local/bin/hysteria
RUN apk add --no-cache tzdata ca-certificates && \
    if [ ! -e /etc/nsswitch.conf ]; then echo 'hosts: files dns' > /etc/nsswitch.conf; fi
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat /geosite.dat
ADD https://github.com/Loyalsoldier/geoip/raw/release/geoip-only-cn-private.dat /geoip.dat
ENV TZ=Asia/Shanghai \
    HYSTERIA_DISABLE_UPDATE_CHECK=1
ENTRYPOINT ["hysteria"]
CMD ["server", "-c", "/etc/hysteria.yaml"]
