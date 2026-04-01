#!/usr/bin/env bash

exit 0

__main() {
  if [[ "$(docker compose version 2>/dev/null | grep version -c)" != "1" ]]; then
    docker run --rm --name="install-docker-compose" -v /root/.docker/cli-plugins:/target 1181.s.kuaicdn.cn:11818/ghcr.io/lwmacct/260401-docker-plugins:compose-latest-x86_64 cp /usr/local/bin/docker-compose /target
  fi
}
__main
