# naiveproxy

![](https://img.shields.io/docker/stars/zydou/naiveproxy.svg) ![](https://img.shields.io/docker/pulls/zydou/naiveproxy.svg)

This is a dockerized [naiveproxy](https://github.com/klzgrad/naiveproxy) client based on alpine. (only ~5MB)

## Container Registry

- [Docker Hub](https://hub.docker.com/r/zydou/naiveproxy)
- [GitHub](https://github.com/users/zydou/packages/container/package/naiveproxy)

### Supported Architectures

- `x86`
- `x86_64`
- `aarch64_cortex-a53-static`
- `aarch64_cortex-a53`
- `aarch64_cortex-a72-static`
- `aarch64_cortex-a72`
- `aarch64_cortex-a76`
- `aarch64_generic-static`
- `aarch64_generic`
- `arm_arm1176jzf-s_vfp`
- `arm_cortex-a15_neon-vfpv4`
- `arm_cortex-a5_vfpv4`
- `arm_cortex-a7`
- `arm_cortex-a7_neon-vfpv4-static`
- `arm_cortex-a7_neon-vfpv4`
- `arm_cortex-a7_vfpv4`
- `arm_arm926ej-s`
- `arm_cortex-a8_vfpv3`
- `arm_cortex-a9-static`
- `arm_cortex-a9`
- `arm_cortex-a9_neon`
- `arm_cortex-a9_vfpv3-d16`
- `arm_mpcore`
- `arm_xscale`

### Docker CLI

If you are running on `amd64`, run the following command:
```bash
docker run -d -restart=always \
    --name naiveproxy \
    -p 12345:1080 \
    zydou/naiveproxy:x86_64 \
    naive --listen=socks://0.0.0.0:1080 --proxy=https://user:pass@domain.com
    # replace `socks` to `http` in the above command if you need a http proxy
```

### Docker Compose

```yml
version: "3.9"
services:
  service.naiveproxy:
    image: zydou/naiveproxy:x86_64  # This is amd64 version, see all tags for other architectures
    container_name: naiveproxy
    ports:
      - 12345:1080
    restart: always
    command: naive --listen=socks://0.0.0.0:1080 --proxy=https://user:pass@domain.com
    # replace `socks` to `http` in the above command if you need a http proxy
```

See [offical docs](https://github.com/klzgrad/naiveproxy/blob/master/USAGE.txt) for more command options

This will pull the `zydou/naiveproxy` image tagged with `x86_64` from Docker Hub if it is not already present on the local host. It then starts a container running a `naiveproxy` service and exposes the container's internal port `1080` to port `12345` of the host machine.

Check out [all tags](https://hub.docker.com/r/zydou/naiveproxy/tags) if you need another version.

## Additional Feature

Currently, naiveproxy doesn't support multiple listen addresses, nor multiple server addresses. ([#365](https://github.com/klzgrad/naiveproxy/issues/365)).

I use a `alpine` based [s6-overlay](https://github.com/just-containers/s6-overlay) image to enable the multiple listen addresses and multiple server addresses support.

To use this feature, you need `zydou/naiveproxy` image tagged with `multi` (i.e. `multi-x86_64`). An example `docker-compose.yml` is shown below.

```yml
version: "3.9"
services:
  service.naiveproxy:
    image: zydou/naiveproxy:multi-x86_64  # need the `multi` tag
    container_name: naiveproxy
    #   - PUID=1000  # (Optional) Set PUID and PGID to your UID & GID to drop the privilege,
    #   - PGID=1000  # (Optional) Otherwise the `naiveproxy` client will run by `root`
      - NAIVE_LISTEN_ADDRESS_0=socks://0.0.0.0:1080       # listen address 0
      - NAIVE_SERVER_ADDRESS_0=https://user0:pass0@domain0.com  # server address 0
      - NAIVE_EXTRA_0=--log  # extra cli options of instance 1

    # Comment out lines below if you need more instances
    #   - NAIVE_LISTEN_ADDRESS_1=socks://0.0.0.0:1081
    #   - NAIVE_SERVER_ADDRESS_1=https://user1:pass1@domain1.com
    #   - NAIVE_EXTRA_1=--log
    #   - NAIVE_LISTEN_ADDRESS_2=socks://0.0.0.0:1081
    #   - NAIVE_SERVER_ADDRESS_2=https://user2:pass2@domain2.com
    #   - NAIVE_EXTRA_2=--log
    #   - NAIVE_LISTEN_ADDRESS_3=socks://0.0.0.0:1082
    #   - NAIVE_SERVER_ADDRESS_3=https://user3:pass3@domain3.com
    #   - NAIVE_EXTRA_3=--log
    #   - NAIVE_LISTEN_ADDRESS_4=socks://0.0.0.0:1083
    #   - NAIVE_SERVER_ADDRESS_4=https://user4:pass4@domain4.com
    #   - NAIVE_EXTRA_4=--log
    ports:
      - 12345:1080
    #   - 12346:1081
    #   - 12347:1082
    #   - 12348:1083
    #   - 12349:1084
    restart: always
```

Note: the `zydou/naiveproxy:multi-x86_64` image currently supports up to **10** servers. If you need more, you can checkout the [source code](https://github.com/zydou/gfw/naiveproxy) to build your own image.

## Source code

[GitHub](https://github.com/zydou/gfw) (Also contains other tools to bypass the GFW)

## LICENSE

[MIT](https://github.com/zydou/gfw/blob/master/LICENSE)
