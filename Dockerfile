FROM caddy:2.10.0

COPY globals.caddy /etc/caddy/globals.caddy
COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
RUN apk --no-cache add ca-certificates && update-ca-certificates

CMD ["caddy", "run", "--config", "/etc/caddy/globals.caddy", "--adapter", "caddyfile"]
