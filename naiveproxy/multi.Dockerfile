ARG VERSION=latest
ARG ARCH=x86_64
FROM ghcr.io/zydou/naiveproxy:${VERSION}-${ARCH} as upstream
COPY --from=ghcr.io/shinsenter/s6-overlay:latest / /
RUN apk add --no-cache bash shadow && \
    groupadd --gid 1000 abc && \
    useradd -u 1000 -g 1000 --create-home -d /app -s /bin/false abc
COPY services/ /etc/services.d/
ENTRYPOINT ["/init"]
