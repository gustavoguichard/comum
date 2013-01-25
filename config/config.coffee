module.exports =
  development:
    root: require('path').normalize(__dirname + '/..')
    port: process.env.PORT || 3000
    app:
      name: 'Comum'
      pretty_url: 'Comum.cc'
  test: {}
  production:
    root: require('path').normalize(__dirname + '/..')
    port: process.env.PORT
    app:
      name: 'Comum'
      pretty_url: 'Comum.cc'

console.log "App configuration loaded"