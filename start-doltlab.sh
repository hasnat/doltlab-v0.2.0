
#!/bin/bash

#
# THIS SCRIPT IS GENERATED AND SHOULD NOT BE EDITED DIRECTLY
#

set -e

export HOST_IP

check_env() {
  if [[ -z "$HOST_IP" || -z "$POSTGRES_PASSWORD" || -z "$DOLTHUBAPI_PASSWORD" ]]; then
    echo "Must supply HOST_IP, POSTGRES_PASSWORD, and DOLTHUBAPI_PASSWORD"
    exit 1
  fi
  if [[ -z "$EMAIL_HOST" || -z "$EMAIL_PORT" || -z "$EMAIL_USERNAME" || -z "$EMAIL_PASSWORD" || -z "$NO_REPLY_EMAIL" ]]; then
    echo "Must supply EMAIL_HOST, EMAIL_PORT, EMAIL_USERNAME, EMAIL_PASSWORD, and NO_REPLY_EMAIL"
    exit 1
  fi
}

create_token_keys() {
  chmod +x ./gentokenenckey
  ./gentokenenckey > iter_token.keys
}

create_envoy_config() {
  cat envoy.tmpl | envsubst \$HOST_IP > envoy.yaml
}

update_images() {
  docker-compose pull
}

start_services() {
  POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  DOLTHUBAPI_PASSWORD="$DOLTHUBAPI_PASSWORD" \
  POSTGRES_USER=dolthubadmin \
  docker-compose up -d
}

_main() {
#    check_env
#    create_token_keys
#    create_envoy_config
#    update_images
    start_services
}

_main

