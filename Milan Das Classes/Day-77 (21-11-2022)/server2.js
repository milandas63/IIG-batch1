var fs = require('fs');

fs.appendFileSync("example.txt", "\r\nHello world");
console.log("Successful...");
