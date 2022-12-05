FROM zydou/s6-overlay:alpine-latest
COPY --from=zydou/dnscrypt /usr/bin/dnscrypt-proxy /usr/bin/dnscrypt-proxy
COPY 20-cron 30-adblock /etc/cont-init.d/
COPY 99-dnscrypt /etc/services.d/dnscrypt/run
COPY adblock.sh /etc/periodic/daily/