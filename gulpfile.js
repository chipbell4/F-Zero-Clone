var gulp = require('gulp');
var coffeeify = require('gulp-coffeeify');
var concat = require('gulp-concat');

gulp.task('default', ['browserify']);

gulp.task('browserify', function() {
	return gulp.src('coffee/FZero.coffee')
		.pipe(coffeeify())
		.pipe(concat('js/fzero.min.js'))
		.pipe(gulp.dest(''));
});

gulp.task('watch', ['default'], function() {
	gulp.watch('coffee/*.coffee', ['default']);
});
