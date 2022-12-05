ARG VERSION
FROM zydou/naiveproxy:${VERSION:-latest} as upstream

FROM zydou/s6-overlay:alpine-3
COPY --from=upstream /usr/bin/naive /usr/bin/naive
COPY services/ /etc/services.d/
RUN apk add --no-cache libgcc
