var gulp = require('gulp');
var browserify = require('browserify');
var concat = require('gulp-concat');
var transform = require('vinyl-transform');

var streamedBrowserify = function(options) {
	return transform(function(filename) {
		options.entries = filename;

		return browserify(options).bundle();
	});
};

gulp.task('default', ['browserify']);

gulp.task('browserify', function() {
	return gulp.src('js/FZero.js')
		.pipe(streamedBrowserify({ debug: true, basedir: 'js' }))
		.pipe(concat('js/fzero.min.js'))
		.pipe(gulp.dest(''));
});
