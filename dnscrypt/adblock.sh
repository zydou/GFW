#!/bin/sh

wget -O /app/blocked-names.txt https://anti-ad.net/domains.txt
/command/s6-svc -r /run/service/dnscrypt
