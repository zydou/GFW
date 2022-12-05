#!/bin/bash

wget -O /tmp/accelerated-domains.china.conf https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf

cat /tmp/accelerated-domains.china.conf | grep -v '^#server' | sed -e 's|/| |g' -e 's|^server= ||' | sed 's/114.114.114.114/223.5.5.5/g' > /app/forwarding-rules.txt

rm -f /tmp/accelerated-domains.china.conf

/command/s6-svc -r /run/service/dnscrypt
