FROM alpine:3 as builder
ARG VERSION=v106.0.5249.91-2
RUN set -ex ; \
    apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
        x86_64) export ARCH='x86_64' ;; \
        aarch64) export ARCH='aarch64_generic' ;; \
    esac; \
    wget -q -O /tmp/naiveproxy.tar.xz "https://github.com/klzgrad/naiveproxy/releases/download/${VERSION}/naiveproxy-${VERSION}-openwrt-${ARCH}.tar.xz" ; \
    tar --strip-components 1 -xJof /tmp/naiveproxy.tar.xz -C /tmp ; \
    mv /tmp/naive /usr/bin/naive ; \
    rm -rf /tmp/*

FROM alpine:3
RUN apk add --no-cache libgcc
COPY --from=builder /usr/bin/naive /usr/bin
CMD ["/usr/bin/naive"]
