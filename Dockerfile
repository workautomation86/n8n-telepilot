FROM n8nio/n8n:2.11.4

RUN mkdir -p /home/node/.n8n/nodes
RUN npm config set registry http://npm.telepilot.co:4873/
RUN cd /home/node/.n8n/nodes && npm install @telepilotco/n8n-nodes-telepilot

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
