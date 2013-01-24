module.exports =
  development:
    root: require('path').normalize(__dirname + '/..')
    port: process.env.PORT || 3000
    app:
      name: 'Comum'
  test: {}
  production:
    root: require('path').normalize(__dirname + '/..')
    port: process.env.PORT
    app:
      name: 'Comum'

console.log "App configuration loaded"