var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var path = require('path');

module.exports = {
    entry: ['./app/app.js'],

    output: {
        filename: 'app.js',
        path: path.resolve(__dirname, 'static')
    },

    module: {
        rules: [
            {
                test: /\.scss$/,
                exclude: /node_modules/,
                loader: ExtractTextPlugin.extract('css-loader?sourceMap!sass-loader?sourceMap')
            },
            {
                test: /\.(jpe?g|gif|png|svg)$/i,
                loader: "file-loader?name=/images/[name].[ext]"
            }
            // {
            //     test: /\.otf$/,
            //     loader: "file-loader?name=/fonts/Brown/[name].[ext]"
            // }
        ]
    },

    devtool: 'source-map',

    plugins: [
        new ExtractTextPlugin({ filename: 'styles.css', disable: false, allChunks: true }),
        new webpack.ProvidePlugin({
            blueimp: 'blueimp-gallery/js/blueimp-gallery'
        })
    ]

};
