# Hysteria with GeoIP embedded

![](https://img.shields.io/docker/stars/zydou/hysteria.svg) ![](https://img.shields.io/docker/pulls/zydou/hysteria.svg)

- [hysteria](https://github.com/apernet/hysteria)
- [GeoIP](https://github.com/Loyalsoldier/geoip)

Note: We only support hysteria v2.

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/hysteria)
- [GitHub](https://github.com/users/zydou/packages/container/package/hysteria)

## What's the difference from the [official docker image](https://hub.docker.com/r/tobyxdd/hysteria)?

1. The binary is compressed using `upx`, so the image size is much smaller (~50%).

2. Hysteria will automatically download the ACL resources from the [Loyalsoldier/v2ray-rules-dat](https://github.com/Loyalsoldier/v2ray-rules-dat) repository, there will be no problem deploying hysteria on overseas VPS. However, when deployed as a client in China, downloading the `geosite` and `geoip` database from GitHub can be very slow or even impossible. Therefore, this image embeds the `geosite.dat` and a lite version of the GeoIP database that only contains: `geoip:cn` and `geoip:private`, which can meet the needs of most Chinese users.

## Docker CLI

```bash
docker run -d -restart=always \
    --name hysteria \
    -e TZ=Asia/Shanghai \  # set desired timezone
    --network host \
    -v $(pwd)/hysteria.yaml:/etc/hysteria.yaml:ro \
    zydou/hysteria:latest
```

## Docker Compose

```yml
version: "3.9"
services:
  service.hysteria:
    image: zydou/hysteria:latest
    container_name: hysteria
    environment:
      - TZ=Asia/Shanghai  # set desired timezone
    network_mode: host
    volumes:
      - ./hysteria.yaml:/etc/hysteria.yaml:ro
    restart: always
```

Please see the [official docs](https://v2.hysteria.network/docs/advanced/Full-Server-Config/) to write your own `hysteria.yaml`.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
