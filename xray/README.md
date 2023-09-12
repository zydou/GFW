# Xray with enhanced rules dat file

![](https://img.shields.io/docker/stars/zydou/xray.svg) ![](https://img.shields.io/docker/pulls/zydou/xray.svg)

- [xray](https://github.com/XTLS/Xray-core)
- [enhanced rules](https://github.com/Loyalsoldier/xray-rules-dat)

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/xray)
- [GitHub](https://github.com/users/zydou/packages/container/package/xray)

## Docker CLI

```bash
docker run -d -restart=always \
    --name xray \
    -e TZ=Asia/Shanghai \  # set desired timezone
    -p 12345:1080 \
    -p 12345:1080/udp \  # remove this line if you don't need udp proxy
    -v $(pwd)/config.json:/etc/xray/config.json:ro \
    zydou/xray:v1.8.4
```

## Docker Compose

```yml
version: "3.9"
services:
  service.xray:
    image: zydou/xray:v1.8.4
    container_name: xray
    environment:
      - TZ=Asia/Shanghai  # set desired timezone
    ports:
      - 12345:1080
      - 12345:1080/udp  # comment this line if you don't need udp proxy
    volumes:
      - ./config.json:/etc/xray/config.json:ro
    restart: always
```

This will pull the `zydou/xray` image with the tag `v1.8.4` from Docker Hub, if it is not already stored locally. It then launches a container that runs an `xray` service and maps its internal port `1080` to port `12345` on the host machine.

Check out [all tags](https://hub.docker.com/r/zydou/xray/tags) if you need another version.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
