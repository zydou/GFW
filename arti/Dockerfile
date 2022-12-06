FROM rust:latest as builder
WORKDIR /app
RUN git clone --depth 1 https://gitlab.torproject.org/tpo/core/arti.git arti && \
    cd arti && \
    cargo build -p arti --release

FROM zydou/s6-overlay:debian-latest
COPY --from=builder /app/arti/target/release/arti /usr/bin/arti
RUN apt-get update && apt-get install -y sqlite3 openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["with-contenv", "s6-setuidgid", "abc", "/usr/bin/arti", "proxy", "--config", "/app/config.toml"]