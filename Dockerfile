FROM n8nio/n8n:2.11.4

USER root
RUN apk add --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing telegram-tdlib

USER node
RUN cd ~/.n8n/ && mkdir -p nodes && cd nodes && npm install @telepilotco/n8n-nodes-telepilot

ENV TDLIB_PATH=/usr/lib/libtdjson.so.1.8.51

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
