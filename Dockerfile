FROM n8nio/n8n:2.11.4
USER root
RUN apk add --no-cache tdlib
USER node
RUN mkdir -p /home/node/.n8n/nodes && cd /home/node/.n8n/nodes && npm install @telepilotco/n8n-nodes-telepilot
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
