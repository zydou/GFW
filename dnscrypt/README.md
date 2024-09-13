# [DNScrypt](https://github.com/DNSCrypt/dnscrypt-proxy) client based on alpine

![](https://img.shields.io/docker/stars/zydou/dnscrypt.svg) ![](https://img.shields.io/docker/pulls/zydou/dnscrypt.svg)

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/dnscrypt)
- [GitHub](https://github.com/users/zydou/packages/container/package/dnscrypt)

## Docker CLI

```bash
    docker run -d --restart=always \
        --name dnscrypt \
        -p 53:5353 \  # remove this line if you don't need tcp query
        -p 53:5353/udp \
        -v $(pwd)/dnscrypt-proxy.toml:/etc/dnscrypt-proxy/dnscrypt-proxy.toml
        zydou/dnscrypt:latest
```

## Docker Compose

```yml
version: "3.9"
services:
  service.dnscrypt:
    image: zydou/dnscrypt:latest
    container_name: dnscrypt
    environment:
      - TZ=Asia/Shanghai  # set desired timezone
    ports:
      - 53:5353  # remove this line if you don't need tcp query
      - 53:5353/udp
    volumes:
      - ./dnscrypt-proxy.toml:/etc/dnscrypt-proxy/dnscrypt-proxy.toml:ro
    restart: always
```

A minimum `dnscrypt-proxy.toml` example:

```toml
listen_addresses = ['[::]:5353']  # DO NOT change port 5353
```

See [official docs](https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml) for more configurations.

## Additional Features

### Adblock

`adblock` tag is bundled with an [anti-AD](https://github.com/privacy-protection-tools/anti-AD) domain list file and using `cron` job to update daily. The `BLOCKLIST_URL` environment variable can be used to choose a different blocklist.

The domain file is located at `/app/blocked-names.txt` inside the container.

You can add the following lines to your `dnscrypt-proxy.toml` to enable the adblock feature.

```toml
[blocked_names]
blocked_names_file = '/app/blocked-names.txt'
```

### Accelerate Chinese domains

`cnlist` tag is bundled with a forwarding rule file generated from [dnsmasq-china-list](https://github.com/felixonmars/dnsmasq-china-list)'s [accelerated-domains.china.conf](https://github.com/felixonmars/dnsmasq-china-list/blob/master/accelerated-domains.china.conf) and use `cron` job to update daily.

The forwarding rule file is located at `/app/forwarding-rules.txt` inside the container.

You can add the following lines to your `dnscrypt-proxy.toml` to enable the this feature.

```toml
forwarding_rules = '/app/forwarding-rules.txt'
```

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
