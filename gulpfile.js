var gulp = require('gulp');

gulp.src(['./bower.json', './package.json']).pipe(require('gulp-install')());

var eslint = require('gulp-eslint');

gulp.task('files', function() {
  'use strict';

  var lib = require('bower-files')({
    overrides: {
      jquery: { main: ['jquery.js'] }
    }
  });

  gulp.src(lib.ext('css').files)
    .pipe(gulp.dest('./app/assets/stylesheets/vendor'));

  gulp.src(lib.ext('js').files)
    .pipe(gulp.dest('./app/assets/javascripts/vendor'));
});

gulp.task('lint', ['files'], function() {
  'use strict';

  gulp.src(['./app/assets/javascripts/*.js'])
    .pipe(eslint())
    .pipe(eslint.formatEach())
    .pipe(eslint.failOnError());
});

gulp.task('test', ['lint'], function(done) {
  require('karma').server.start({
    configFile: __dirname + '/spec/karma.conf.js'
  }, done);
});

gulp.task('default', ['test'], function() {});
