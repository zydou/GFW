ARG VERSION
FROM v2fly/v2fly-core:${VERSION:-v4.45.2} as upstream

FROM alpine:3 as build
COPY --from=upstream /usr/bin/v2ray /usr/bin/v2ray
RUN set -xe && \
    apk add --no-cache upx && \
    upx --lzma /usr/bin/v2ray

FROM alpine:3
COPY --from=build /usr/bin/v2ray /usr/bin/v2ray
RUN apk add --no-cache tzdata && \
    wget -q -O /usr/bin/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat && \
    wget -q -O /usr/bin/geoip.dat https://github.com/Loyalsoldier/geoip/raw/release/geoip-only-cn-private.dat

ENV TZ=Asia/Shanghai
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]