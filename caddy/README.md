# Dockerized [caddy](https://hub.docker.com/_/caddy) with cloudflare plugin

![](https://img.shields.io/docker/stars/zydou/caddy.svg) ![](https://img.shields.io/docker/pulls/zydou/caddy.svg)


## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/caddy)
- [GitHub](https://github.com/users/zydou/packages/container/package/caddy)


## Docker CLI

```bash
docker run -d -restart=always \
    --name caddy \
    -e CFAPI=your-cloudflare-api
    -p 80:80 \
    -p 80:80/udp \
    -p 443:443 \
    -p 443:443/udp \
    -v $(pwd)/Caddyfile:/etc/caddy/Caddyfile \
    zydou/caddy:latest
```

## Docker Compose

```yml
version: "3.9"
services:
  service.caddy:
    image: zydou/caddy:latest
    container_name: caddy
    restart: always
    environment:
      CFAPI: "your-cloudflare-api"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - ./html:/srv
      - ./.caddy_data:/data
      - ./.caddy_config:/config
    ports:
      - 80:80
      - 80:80/udp
      - 443:443
      - 443:443/udp
```

## Additional Feature

The `zydou/caddy:latest` only has `cloudflare` plugin. If you need to work with [naiveproxy](https://github.com/klzgrad/naiveproxy), you must use the `naive` tag (i.e `zydou/caddy:naive`), which also has the [forwardproxy](https://github.com/klzgrad/forwardproxy) plugin.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)