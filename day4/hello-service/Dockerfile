FROM node:10.15.3-alpine
RUN mkdir /app
COPY server.js package.json package-lock.json /app/
WORKDIR /app
RUN npm install --production
USER node
ENTRYPOINT ["node", "/app/server.js"]
