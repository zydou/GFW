# syntax=docker/dockerfile:1
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETOS TARGETARCH
ARG TAG
WORKDIR /app
RUN apk add --no-cache git upx && \
    git clone https://github.com/XTLS/Xray-core.git src && \
    cd src && \
    if [ "$TAG" != "nightly" ]; then git checkout "$TAG" ; fi && \
    GOOS=$TARGETOS GOARCH=$TARGETARCH CGO_ENABLED=0 go build -o xray -trimpath -ldflags "-s -w -buildid=" ./main && \
    upx --lzma /app/src/xray

FROM --platform=${TARGETPLATFORM} alpine:latest
COPY --from=build /app/src/xray /usr/bin/xray
RUN apk add --no-cache tzdata ca-certificates && \
    mkdir -p /var/log/xray /usr/share/xray && \
    chmod +x /usr/bin/xray && \
    wget -O /usr/share/xray/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat && \
    wget -O /usr/share/xray/geoip.dat https://github.com/Loyalsoldier/geoip/raw/release/geoip-only-cn-private.dat

ENV TZ=Asia/Shanghai
CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]
