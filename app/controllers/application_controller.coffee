express = require "express"
# viewHelpers = require("../helpers")

module.exports = (app, configuration)->
  @config = configuration
  # app.use (err, req, res, next) ->
    # treat as 404
    # return next()  if ~err.message.indexOf("not found")
    # log it
    # console.error err.stack
    # error page
    # res.status(500).render "500",
    #   error: err.stack

  # assume 404 since no middleware responded
  app.use (req, res, next) ->
    res.status(404).render "404",
      url: req.originalUrl

  app.configure 'development', ->
    app.use express.errorHandler dumpExceptions: true, showStack: true

  app.configure 'production', ->
      app.use express.errorHandler()

module.exports.index = (req, res)->
  brands = [
    {name: "Engage", img: "engage.png", url: "http://engage.is"}
    {name: "Matéria Brasil", img: "mb.png", url: "http://materiabrasil.com"}
    {name: "Nos.vc", img: "nosvc.png", url: "http://nos.vc"}
  ]
  res.render 'index', config: @config, brands: brands