'use strict';

const http = require('http');
const express = require('express');
const os = require('os');

// Constants
const PORT = process.env.PORT || 8080;
const HOST = '0.0.0.0';

const hostname = os.hostname();

function blockCpuFor(ms) {
  var startTime = new Date().getTime();
  var result = 0
  while (new Date().getTime() < startTime + ms) {
    result += Math.random() * Math.random();
  }
}

// App
const app = express();
app.enable('trust proxy');
app.get('/', (req, res) => {
  blockCpuFor(10);
  const time = new Date(Date.now());
  res.send(`
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8">
      <meta http-equiv="refresh" content="1">
      <title>Hello world</title>
    </head>
    <body>
      <p>Hello visitor from ${req.ip}!</p>
      <p>This is container ${hostname}.</p>
      <p>Current time: ${time.toString()}</p>
    </body>
  </html>
  `);
  console.log(`Request received from ${req.ip}`);
});

const server = http.createServer(app);

process.on('SIGTERM', () => {
  console.info('SIGTERM signal received.');
  console.log('Closing HTTP server.');
  server.close(() => {
    console.log('HTTP server closed.');
  });
});

process.on('SIGINT', () => {
  console.info('SIGINT signal received.');
  console.log('Closing HTTP server.');
  server.close(() => {
    console.log('HTTP server closed.');
  });
});

server.listen(PORT);
console.log(`Running on http://${HOST}:${PORT}`);
