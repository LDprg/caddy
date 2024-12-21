FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4 \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
