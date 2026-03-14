FROM n8nio/n8n:2.11.4
RUN cd /root/.n8n/ && mkdir -p nodes && cd nodes && npm install @telepilotco/n8n-nodes-telepilot
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
