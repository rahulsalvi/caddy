FROM caddy:2.10.0

COPY Caddyfile /etc/caddy/Caddyfile
COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
RUN cat /usr/local/share/ca-certificates/*.crt >> /etc/ssl/certs/ca-certificates.crt
