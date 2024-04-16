# Arti

![](https://img.shields.io/docker/stars/zydou/arti.svg) ![](https://img.shields.io/docker/pulls/zydou/arti.svg)

[Arti](https://gitlab.torproject.org/tpo/core/arti) is a Rust implementation
of the [Tor](https://www.torproject.org/) client.

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/arti)
- [GitHub](https://github.com/users/zydou/packages/container/package/arti)

## Docker CLI

```bash
docker run -d -restart=always \
    --name arti \
    -p 9150:9150 \
    -p 9150:9150/udp \  # remove this line if you don't need udp proxy
    -p 5353:5353/udp \  # remove this line if you don't need dns proxy service
    zydou/arti:latest
```

## Docker Compose

```yml
version: "3.9"
services:
  service.arti:
    image: zydou/arti:latest
    container_name: arti
    ports:
      - 9150:9150
      - 9150:9150/udp  # comment this line if you don't need udp proxy
      - 5353:5353/udp  # comment this line if you don't need udp proxy
    restart: always
```

This will pull the `zydou/arti` image tagged with `latest` from Docker Hub if it is not already present on the local host. It then starts a container running a `arti` service and exposes the container's internal port `9150` to port `9150` of the host machine for socks5 proxy, and `5353` port for DNS query proxy.

Check out [all tags](https://hub.docker.com/r/zydou/arti/tags) if you need another version.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
