fs = require "fs"
vm = require "vm"
_ = require("underscore")._





class File
	constructor: (@path, @name, @stats) ->


context =
	files: (path) -> return _(fs.readdirSync(path)).map (file) -> new File path, file, fs.statSync path+file
	isDirectory: (file) -> file.stats.isDirectory()
	isFile: (file) -> file.stats.isFile()
	hasExtension: (extension) -> (file) -> file.name.match(extension+"$")
	asPath: (file) -> file.path + file.name

vm.runInNewContext 'result = ' + 'files("/Users/jozefdransfield/Desktop/").filter(isFile).filter(hasExtension(".jpg"))', context

console.log context.result.reduce( (memo, file) -> memo + file.path + "\n", "") 