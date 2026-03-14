FROM node:22-alpine

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache tini tdlib

ENV N8N_USER_FOLDER=/home/node/.n8n

RUN npm install -g n8n@2.11.4 --legacy-peer-deps

RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm install @telepilotco/n8n-nodes-telepilot

RUN chown -R node:node /home/node
USER node
EXPOSE 5678
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
