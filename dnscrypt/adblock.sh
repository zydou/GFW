#!/bin/sh

/bin/sh /etc/cont-init.d/30-adblock
/command/s6-svc -r /run/service/dnscrypt
