FROM alpine:3 as builder
ARG VERSION=v106.0.5249.91-2
ADD https://github.com/klzgrad/naiveproxy/releases/download/${VERSION}/naiveproxy-${VERSION}-openwrt-x86_64.tar.xz /tmp/naiveproxy.tar.xz
RUN set -ex && \
    apk add --no-cache upx && \
    tar --strip-components 1 -xJof /tmp/naiveproxy.tar.xz -C /tmp && \
    upx --lzma /tmp/naive && \
    mv /tmp/naive /usr/bin/naive && \
    rm -rf /tmp/*

FROM alpine:3
RUN apk add --no-cache libgcc
COPY --from=builder /usr/bin/naive /usr/bin
CMD ["/usr/bin/naive"]
