'use strict';

const http = require('http');
const express = require('express');
const os = require('os');

// Constants
const PORT = process.env.PORT || 8080;
const HOST = '0.0.0.0';

const hostname = os.hostname();

// App
const app = express();
app.get('/', (req, res) => {
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
      <p>This is container host ${hostname}.</p>
      <p>Current time: ${time.toString()}</p>
    </body>
  </html>
  `);
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