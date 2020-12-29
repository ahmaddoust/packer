const express = require('express');
const axios = require('axios');
const port = 3000;
const app = express();


let num = Math.floor(Math.random() * 10000);
const version = 1 //process.env.VERSION;

app.get('/v1', (request, response) => {
  console.log(`From server ${num} Received request for URL: ${request.url} version ${version}`)
  response.writeHead(200);
  response.end(`Hello People!!! from server ${num} version ${version}`);

})

app.get('/health', (request, response) => {
  console.log(`Health check instance ${num} Received request for URL: ${request.url} version ${version}`)
  response.writeHead(200);
  response.end(`I am healthy! from server ${num} version ${version}`);

})


app.get('/readiness', (request, response) => {
  console.log(`Readiness check instance ${num} Received request for URL: ${request.url} version ${version}`)

  try {
    response.writeHead(200);
    response.end(`I am ready! from server ${num} version ${version}`);
  } catch (e) {
    console.log('error on size > 0')
  }
});


app.listen(port, (err) => {
  console.log("started server");
  if (err)
    return console.log(`something happened on startup with text`);
});
