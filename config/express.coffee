express = require 'express'

module.exports = (app, config)->
  app.configure ->
    app.set 'port', config.port
    app.set 'view engine', 'jade'
    # app.use express.favicon()
    app.use express.logger('dev')
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.set 'views', 'app/views'
    app.use app.router
    app.use express.compress(
      filter: (req, res) ->
        /json|text|javascript|css/.test res.getHeader("Content-Type")

      level: 9
    )

    app.use express.static 'public'