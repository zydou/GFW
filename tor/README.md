# Dockerized tor client based on alpine

![](https://img.shields.io/docker/stars/zydou/tor.svg) ![](https://img.shields.io/docker/pulls/zydou/tor.svg)

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/tor)
- [GitHub](https://github.com/users/zydou/packages/container/package/tor)

## Docker CLI

```bash
docker run -d -restart=always \
    --name tor \
    -p 12345:9050 \
    # -v $(pwd)/torrc:/etc/tor/torrc:ro \  # Optional, mount your own torrc configuration
    zydou/tor:latest
```

## Docker Compose

```yml
version: "3.9"
services:
  service.tor:
    image: zydou/tor:latest
    container_name: tor
    ports:
      - 12345:9050
    # volumes:
    #   - ./torrc:/etc/tor/torrc:ro  # Optional, mount your own torrc configuration
    restart: always
```

This will pull the `zydou/tor` image tagged with `latest` from Docker Hub if it is not already present on the local host. It then starts a container running a `tor` service and exposes the container's internal port `1080` to port `12345` of the host machine.

Check out [all tags](https://hub.docker.com/r/zydou/tor/tags) if you need another version.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
