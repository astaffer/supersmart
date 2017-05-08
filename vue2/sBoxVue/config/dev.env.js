var merge = require('webpack-merge')
var prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  resolve: {
        extensions: ['.js'],
        alias: {
            'vue': 'vue/dist/vue.esm.js'
        }
    }
})
