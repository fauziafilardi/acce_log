module.exports = {
  configureWebpack: {
    devtool: 'source-map'
  },
  chainWebpack: config => {
    config.module.rules.delete('eslint');
    // config.module
    //   .rule("fonts")
    //   .test(/\.(ttf|otf|eot|woff|woff2)$/)
    //   .use("file-loader")
    //   .loader("file-loader")
    //   .tap(options => {
    //     options = {
    //       // limit: 10000,
    //       name: 'src/assets/fonts/[name].[ext]',
    //     }
    //     return options
    //   })
    //   .end()
  }
}
