const { hostname } = require('os'); 

const STACK_NAME = process.env.STACK_NAME || 'unknown env'

const http = require('http'); 
const message = `Hello Cloud from ${hostname()} in ${STACK_NAME}!\n`; 
const port = 8080;
const server = http.createServer((req, res) => { 
  res.statusCode = 200; 
  res.setHeader('Content-Type', 'text/plain'); 
  res.end(message); 
}); 

server.listen(port, hostname, () => { 
  console.log(`Server running at http://${hostname()}:${port}/`);
}); 
