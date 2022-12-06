# Arti

![](https://img.shields.io/docker/stars/zydou/arti.svg) ![](https://img.shields.io/docker/pulls/zydou/arti.svg)

[Arti](https://gitlab.torproject.org/tpo/core/arti) is a Rust implementation
of the [Tor](https://www.torproject.org/) client.

‼️Important:‼️ Currently, arti only supports for listening on `localhost` rather than `0.0.0.0` (see[#568](https://gitlab.torproject.org/tpo/core/arti/-/issues/568)). Thus we can't use arti in a docker container right now. (But it will be solved sooner)

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/arti)
- [GitHub](https://github.com/users/zydou/packages/container/package/arti)

## Docker CLI

```bash
docker run -d -restart=always \
    --name arti \
    -p 12345:1080 \
    -p 12345:1080/udp \  # remove this line if you don't need udp proxy
    -v $(pwd)/config.toml:/app/config.toml:ro \
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
      - 12345:1080
      - 12345:1080/udp  # comment this line if you don't need udp proxy
    volumes:
      - ./config.toml:/app/config.toml:ro
    restart: always
```

This will pull the `zydou/arti` image tagged with `latest` from Docker Hub if it is not already present on the local host. It then starts a container running a `arti` service and exposes the container's internal port `1080` to port `12345` of the host machine.

Check out [all tags](https://hub.docker.com/r/zydou/arti/tags) if you need another version.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
