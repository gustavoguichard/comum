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
    {name: "Matéria Brasil", img: "mb.jpg", url: "http://materiabrasil.com"}
    {name: "Catarse", img: "catarse.jpg", url: "http://catarse.me"}
    {name: "Multidão", img: "multidao.jpg", url: "http://multidao.art.br"}
    {name: "Engage", img: "engage.jpg", url: "http://engage.is"}
    {name: "Nos.vc", img: "nosvc.jpg", url: "http://nos.vc"}
    {name: "Estaleiro Liberdade", img: "estaleiro.jpg", url: "http://estaleiroliberdade.com.br"}
    {name: "1%", img: "umporcento.jpg", url: "http://umporcento.org"}
    {name: "Semente negócios", img: "semente.jpg", url: "http://sementenegocios.com.br"}
    {name: "Shoot the Shit", img: "shoottheshit.jpg", url: "http://shoottheshit.cc"}
    {name: "Imagina na Copa", img: "imaginanacopa.jpg", url: "http://imaginanacopa.com.br"}
    {name: "RUA - Rastro Urbano de Amor", img: "rua.jpg", url: "https://www.facebook.com/RUApoa"}
    {name: "Multitude", img: "multitude.jpg", url: "#"}
    {name: "Estúdio Nômade", img: "estudionomade.jpg", url: "http://www.estudionomade.com.br"}
    {name: "Purpose", img: "purpose.jpg", url: "http://www.purpose.com"}
    {name: "Meu Rio", img: "meurio.jpg", url: "http://meurio.org.br/"}
    {name: "Dekode", img: "dekode.jpg", url: "http://dekode.com.br"}
    {name: "OuiShare", img: "ouishare.jpg", url: "http://ouishare.net/"}
  ]
  res.render 'index', config: @config, brands: brands
