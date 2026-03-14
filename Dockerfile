FROM n8nio/n8n:2.11.4
RUN mkdir -p /root/.n8n/nodes && cd /root/.n8n/nodes && npm install @telepilotco/n8n-nodes-telepilot
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
