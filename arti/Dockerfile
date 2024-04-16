FROM alpine:3 as binary
WORKDIR /app
RUN wget -q -O arti.tar.xz "https://github.com/zydou/cli-tools/releases/download/arti/arti-$(uname -m)-unknown-linux-musl.tar.xz" && \
    tar -xvf arti.tar.xz && \
    rm -f arti.tar.xz && \
    echo "[proxy]" > /config.toml && \
    echo 'socks_listen = "0.0.0.0:9150"' >> /config.toml && \
    echo 'dns_listen = "0.0.0.0:5353"' >> /config.toml

FROM gcr.io/distroless/cc-debian12:nonroot
COPY --from=binary /app/arti /arti
COPY --from=binary /config.toml /config.toml
ENTRYPOINT [ "/arti" ]
CMD [ "proxy", "-c", "/config.toml" ]
