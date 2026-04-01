FROM alpine:latest
RUN set -eux; \
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
  apk add --no-cache tini bash curl jq; \
  echo;

SHELL ["/bin/bash", "-lc"]

RUN set -eux; \
  mkdir -p /app/bin; \
  cd /app/bin && \
  _tag_name=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name') && \
  echo "Latest mihomo tag_name: $_tag_name" && \
  curl -sSL -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/$_tag_name/docker-compose-linux-x86_64 && \
  chmod +x /usr/local/bin/docker-compose; \
  echo;

ENTRYPOINT ["tini", "--"]
CMD ["bash"]

LABEL org.opencontainers.image.source=https://github.com/lwmacct/260401-docker-plugins
LABEL org.opencontainers.image.description="-- IGNORE --"
LABEL org.opencontainers.image.licenses=MIT
