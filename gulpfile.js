var gulp   = require('gulp');
var coffee = require('gulp-coffee');

gulp.task('coffee', function() {
  gulp.src('./src/**/*.coffee')
  .pipe(coffee())
  .pipe(gulp.dest('./release'));
});


gulp.task('watch', function() {
  gulp.watch('./src/**/*.coffee', ['coffee']);
});


gulp.task('default', ['coffee'], function() {
  console.log("done");
});
