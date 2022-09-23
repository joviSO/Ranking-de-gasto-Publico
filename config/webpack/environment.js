const { environment } = require('@rails/webpacker')
const { webpack } = require('webpack')

const webpacker = require('webpack')
environment.plugins.append('Provide', new webpack.ProviderPlugin({
  $: 'jquerry',
  jQuerry: 'jquerry',
  Popper: ['popper/core', 'default']
}))

module.exports = environment
