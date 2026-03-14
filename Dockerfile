FROM n8nio/n8n:2.11.4
USER root
RUN apt-get update && apt-get install -y libssl-dev ca-certificates
USER node
RUN cd /home/node/.n8n && mkdir -p nodes && cd nodes && npm install @telepilotco/n8n-nodes-telepilot
