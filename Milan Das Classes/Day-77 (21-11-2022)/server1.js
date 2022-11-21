var http = require('http');

http.createServer(function(req,res) {
    // http status codes
    res.writeHead(200, {'Content-type':'text/html'});
    res.end('<h1>Hello Node</h1>\nI am Milan');
}).listen(3000);

console.log('Server is running on http://127.0.0.1:3000');

