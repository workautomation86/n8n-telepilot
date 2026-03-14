FROM n8nio/n8n:2.11.4
USER root
RUN apk add --no-cache libc6-compat
USER node
RUN cd /home/node/.n8n && mkdir -p nodes && cd nodes && npm install @telepilotco/n8n-nodes-telepilot
