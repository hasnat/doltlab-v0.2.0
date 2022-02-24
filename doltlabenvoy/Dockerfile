FROM envoyproxy/envoy-alpine:v1.18-latest

RUN wget -O /usr/local/bin/envsubst https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` && \
    chmod +x /usr/local/bin/envsubst

COPY envoy.tmpl .
