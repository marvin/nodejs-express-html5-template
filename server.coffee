express = require("express")
app 	= module.exports = express.createServer()

require("./config/environment.js") app, express
require("./config/routes.js") app

app.listen 3000
console.log "express server listen on port #{app.address().port}"