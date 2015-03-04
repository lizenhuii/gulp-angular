module.exports = (gulp, $) ->
	config = $.packageJson['gulp-angular-config']?['webkit'] or {}
	# see config options in https://github.com/mllrsohn/node-webkit-builder
	config.appName = $.packageJson.name
	config.apVersion = $.packageJson.version
	config.buildDir ?= 'node-webkit'
	config.cacheDir ?= '.node-webkit-cache'
	config.platforms ?= ['win','osx']
	config.files = 'dist/**/**'

	gulp.task 'webkit:build', ['core:build'], ->
		gulp.start 'webkit:build:copy-dist'

	gulp.task 'webkit:build:copy-dist', ->
		new $.nodeWebkitBuilder config
			.on 'log', console.log
			.build().then ->
				console.log 'node webkit Build done!'
			.catch (error) ->
				console.error error