let mix = require('laravel-mix');

mix.sass('src/scss/app.scss', 'web/css').
sass('src/js/app.js', 'web/js/deploy.js');