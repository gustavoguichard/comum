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
    {name: "Matéria Brasil", img: "mb.png", url: "http://materiabrasil.com"}
    {name: "Catarse", img: "catarse.png", url: "http://catarse.me"}
    {name: "Multidão", img: "multidao.png", url: "http://multidao.art.br"}
    {name: "Engage", img: "engage.png", url: "http://engage.is"}
    {name: "Nos.vc", img: "nosvc.png", url: "http://nos.vc"}
    {name: "Estaleiro Liberdade", img: "estaleiro.png", url: "http://estaleiroliberdade.com.br"}
  ]
  res.render 'index', config: @config, brands: brands