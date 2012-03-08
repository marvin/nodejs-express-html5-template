module.exports = (app, express) ->
	app.configure ->
		app.set "views", "./views"
		app.register ".coffee", require("coffeecup")
		app.set "view engine", "coffee"
		app.use express.bodyParser()
		app.use express.methodOverride()
		app.use express.cookieParser()
		app.use express.session secret: "secretword"
		app.use require("stylus").middleware src: "./public"
		app.use app.router
		app.use express.static "./public"
	
	app.configure "development", ->
	  app.use express.errorHandler dumpExceptions: true, showStack: true
	
	app.configure "production", ->
	  app.use express.errorHandler()
