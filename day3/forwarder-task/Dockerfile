FROM node:10.15.3-alpine
RUN mkdir /app
COPY index.js package.json package-lock.json /app/
WORKDIR /app
RUN npm install --production
ENTRYPOINT ["node", "/app/index.js"]
