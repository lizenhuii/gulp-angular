module.exports = ({gulp, $, config}) ->
	# Runs the iOS platform project on the currently plugged-in device.
	# Requires 'ios-deploy' node module to be installed globally.
	gulp.task 'cordova:ios:run', ->
		gulp.src('').pipe $.shell [
			'cordova run ios'
		], cwd: config.path

	# Runs the Android platform project on the currently plugged-in device.
	gulp.task 'cordova:android:run', ->
		gulp.src('').pipe $.shell [
			'cordova run android'
		], cwd: config.path
