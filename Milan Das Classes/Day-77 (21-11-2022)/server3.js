const http = require('http');

http.createServer(function(req,res) {
    res.writeHead(200, "'Content-type':'text/html'");
    res.end("<h1>Hello World</h1>This is NodeJS");
}).listen(3000);
