module.exports = (app, config)->
  application = require '../app/controllers/application_controller'
  app.get '/', application.index