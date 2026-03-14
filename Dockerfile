FROM node:20-alpine

RUN apk add --no-cache tini su-exec

ENV N8N_USER_FOLDER=/home/node/.n8n
ENV NODE_ENV=production

RUN npm install -g n8n@2.11.4

USER root
RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm install @telepilotco/n8n-nodes-telepilot && \
    chown -R node:node /home/node/.n8n

USER node

EXPOSE 5678
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
