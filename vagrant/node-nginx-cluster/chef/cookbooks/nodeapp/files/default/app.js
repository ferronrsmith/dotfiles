var os   = require('os');
var hostname = os.hostname();
var server = require("./node-router").getServer();

server.get("/", function (request, response) {
    response.simpleText(200, "Hello from " + hostname + "\n")
});

server.get("/time", function (request, response) {
    response.simpleJson(200, {
        hostname : hostname,
        date : new Date(),
        headers : request.headers
    });
});

server.get("/search", function (request, response) {
    response.simpleJson(200, {
        hostname : hostname,
        data : "seems you did a search",
        headers : request.headers,
        rawheaders : request.rawHeaders
    })
});


server.get("/v1/sas", function (request, response) {
    response.simpleJson(200, {
        hostname : hostname,
        data : "seems you did a search",
        headers : request.headers,
        rawheaders : request.rawHeaders
    })
});


var args = process.argv.slice(2);

server.listen(args[0], args[1] === undefined ? "localhost" : args[1]);