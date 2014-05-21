express = require 'express'
fs = require 'fs'
http = require 'http'
app = express()

# Load configurations
env = process.env.NODE_ENV || 'development'
config = require('./config/config')[env]

require('./config/express')(app, config)
# Application controller
require('./app/controllers/application_controller')(app, config)
require('./config/routes')(app, config)

app.listen config.port
console.log "Express server listening on port #{config.port}"

module.exports = app