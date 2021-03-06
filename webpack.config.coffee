webpack            = require("gulp-webpack").webpack
BowerWebpackPlugin = require "bower-webpack-plugin"
path               = require "path"

module.exports = {
  entry:
    main: "./source/js/main.coffee"

  output:
    filename: "[name].js"
  devtool: 'inline-source-map'
  resolve:
    root: [path.join(__dirname, "source/js/components/")]
    moduleDirectories: ["components"]
    extensions: ["", ".js", ".coffee", ".webpack.js", ".web.js"]

  module:
    preLoaders: [
      {
        test: /\.coffee$/,
        loader: "coffee-lint-loader",
        exclude: /node_modules/
      }
    ]
    loaders: [
      {test: /\.coffee$/, loader: "coffee-loader"}
    ]

  plugins: [
    new BowerWebpackPlugin()
    new webpack.ProvidePlugin
      $:      'jquery'
      jQuery: 'jquery'
      jquery: 'jquery'
  ]

}