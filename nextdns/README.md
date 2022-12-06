# Dockerized [nextdns](https://github.com/nextdns/nextdns) client

![](https://img.shields.io/docker/stars/zydou/nextdns.svg) ![](https://img.shields.io/docker/pulls/zydou/nextdns.svg)

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/nextdns)
- [GitHub](https://github.com/users/zydou/packages/container/package/nextdns)

## Docker CLI

```bash
docker run -d -restart=always \
    --name nextdns \
    -p 53:5353/udp \
    -e NEXTDNS_ID=abcdef \  # (optional) replace with your own Endpoint ID
    -e NEXTDNS_ARGUMENTS=-listen :5353 -report-client-info -log-queries -cache-size 10MB -max-ttl 5s \ # (optional) custom CLI options
    zydou/nextdns:latest
```

## Docker Compose

```yml
version: "3.9"
services:
  service.nextdns:
    image: zydou/nextdns:latest
    container_name: nextdns
    environment:
      - NEXTDNS_ID=abcdef  # (optional) replace with your own Endpoint ID or remove this line
      - NEXTDNS_ARGUMENTS=-listen :5353 -report-client-info -log-queries -cache-size 10MB -max-ttl 5s  # custom CLI options
    ports:
      - 53:5353/udp
    restart: always
```

This will pull the `zydou/nextdns` image tagged with `latest` from Docker Hub if it is not already present on the local host. It then starts a container running a `nextdns` service and exposes the container's internal port `5353` to port `53` of the host machine.

You can set environment variable `NEXTDNS_ID` to use your own Endpoint ID which can be found on the NextDNS Setup page.

You can also set custom command line parameters with `NEXTDNS_ARGUMENTS` environment variable.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
