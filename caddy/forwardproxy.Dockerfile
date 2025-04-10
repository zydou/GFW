FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddyserver/caddy@master \
    --with github.com/caddyserver/certmagic@master \
    --with github.com/caddy-dns/cloudflare@master \
    --with github.com/caddyserver/forwardproxy=github.com/klzgrad/forwardproxy@naive

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
