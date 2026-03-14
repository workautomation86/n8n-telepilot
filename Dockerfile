FROM node:22-alpine

RUN apk add --no-cache tini python3 make g++ tdlib

ENV TDLIB_PATH=/usr/lib/libtdjson.so
ENV N8N_USER_FOLDER=/home/node/.n8n

RUN npm install -g n8n@2.11.4 --legacy-peer-deps

RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm install @telepilotco/n8n-nodes-telepilot

RUN addgroup -S node && adduser -S node -G node 2>/dev/null || true
RUN chown -R node:node /home/node

USER node
EXPOSE 5678
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
