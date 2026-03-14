FROM n8nio/n8n:latest
RUN cd ~/.n8n/ && mkdir nodes && cd nodes && npm install @telepilotco/n8n-nodes-telepilot
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
