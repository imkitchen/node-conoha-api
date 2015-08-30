var gulp   = require('gulp');
var coffee = require('gulp-coffee');

// for test environment
var mocha  = require('gulp-mocha');
require('coffee-script/register');

// coffeescript compile
gulp.task('coffee', function() {
  gulp.src('./src/**/*.coffee')
  .pipe(coffee())
  .pipe(gulp.dest('./release'));
});

// watch file change
gulp.task('watch', function() {
  gulp.watch('./src/**/*.coffee', ['coffee']);
});

// run tests
gulp.task('test', function() {
  gulp.src('./tests/**/*.coffee')
  .pipe(mocha())
});

// test and compile
gulp.task('default', ['test', 'coffee']);
