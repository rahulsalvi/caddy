FROM caddy:2.10.0

COPY globals.caddy /etc/caddy/globals.caddy
COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
RUN apk --no-cache add ca-certificates && update-ca-certificates

# add blank caddyfiles to avoid breaking compatibility with existing setups
# eventually need to remove this
RUN touch /etc/caddy/Caddyfile \
  && mkdir -p /etc/caddy/sites-enabled \
  && touch /etc/caddy/sites-enabled/Caddyfile

CMD ["caddy", "run", "--config", "/etc/caddy/globals.caddy", "--adapter", "caddyfile"]
