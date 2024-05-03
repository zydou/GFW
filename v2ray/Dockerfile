ARG VERSION
FROM v2fly/v2fly-core:${VERSION:-v4.45.2} as upstream

FROM alpine:3 as build
COPY --from=upstream /usr/bin/v2ray /usr/bin/v2ray
RUN set -xe && \
    chmod 755 /usr/bin/v2ray && \
    apk add --no-cache upx && \
    upx --lzma /usr/bin/v2ray
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat /usr/bin/geosite.dat
ADD https://github.com/Loyalsoldier/geoip/raw/release/geoip-only-cn-private.dat /usr/bin/geoip.dat

FROM alpine:3 AS v4
COPY --from=build /usr/bin/v2ray /usr/bin/v2ray
COPY --from=build /usr/bin/geosite.dat /usr/bin/geosite.dat
COPY --from=build /usr/bin/geoip.dat /usr/bin/geoip.dat
RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]


FROM alpine:3 AS v5
COPY --from=build /usr/bin/v2ray /usr/bin/v2ray
COPY --from=build /usr/bin/geosite.dat /usr/bin/geosite.dat
COPY --from=build /usr/bin/geoip.dat /usr/bin/geoip.dat
RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai
CMD [ "/usr/bin/v2ray", "run", "-config=/etc/v2ray/config.json" ]
