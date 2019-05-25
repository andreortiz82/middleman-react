var webpack = require('webpack');

module.exports = {
  mode: 'production',
  entry: {
    site: './source/javascripts/site.js',
  },
  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'javascripts/site.bundle.js',
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      }
    ]
  }
};
