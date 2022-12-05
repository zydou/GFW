FROM alpine:edge

RUN apk add --no-cache curl tor && \
    echo "SocksPort 0.0.0.0:9050" > /etc/tor/torrc

EXPOSE 9050

HEALTHCHECK --interval=60s --timeout=15s --start-period=20s \
    CMD curl -s --socks5 127.0.0.1:9050 'https://check.torproject.org/' | grep -qm1 Congratulations

USER tor

CMD ["tor"]
