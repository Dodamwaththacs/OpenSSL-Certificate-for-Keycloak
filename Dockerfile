FROM alpine:latest
RUN apk add --no-cache openssl
WORKDIR /certs
CMD openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout server.key -out server.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=*" \
    -addext "subjectAltName = IP:0.0.0.0,DNS:*" && \
    chmod 777 server.key && \
    chmod 777 server.crt