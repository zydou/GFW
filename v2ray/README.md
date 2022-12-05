# V2ray with enhanced rules dat file

![](https://img.shields.io/docker/stars/zydou/v2ray.svg) ![](https://img.shields.io/docker/pulls/zydou/v2ray.svg)

- [v2ray](https://github.com/v2fly/v2ray-core)
- [enhanced rules](https://github.com/Loyalsoldier/v2ray-rules-dat)

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/v2ray)
- [GitHub](https://github.com/users/zydou/packages/container/package/v2ray)

## Docker CLI

```bash
docker run -d -restart=always \
    --name v2ray \
    -e TZ=Asia/Shanghai \  # set desired timezone
    -p 12345:1080 \
    -p 12345:1080/udp \  # remove this line if you don't need udp proxy
    -v $(pwd)/config.json:/etc/v2ray/config.json:ro \
    zydou/v2ray:v4.45.2
```

## Docker Compose

```yml
version: "3.9"
services:
  service.v2ray:
    image: zydou/v2ray:v4.45.2
    container_name: v2ray
    environment:
      - TZ=Asia/Shanghai  # set desired timezone
    ports:
      - 12345:1080
      - 12345:1080/udp  # comment this line if you don't need udp proxy
    volumes:
      - ./config.json:/etc/v2ray/config.json:ro
    restart: always
```

This will pulls the `zydou/v2ray` image tagged `v4.45.2` from Docker Hub if it is not already present on the local host. It then starts a container running a `v2ray` service and exposes the container's internal port `1080` to port `12345` of the host machine.

Check out [all tags](https://hub.docker.com/r/zydou/v2ray/tags) if you need another version.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/LICENSE)
