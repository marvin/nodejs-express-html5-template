
module.exports = function(app, express) {
  app.configure(function() {
    app.set("views", "./views");
    app.register(".coffee", require("coffeekup"));
    app.set("view engine", "coffee");
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express.cookieParser());
    app.use(express.session({
      secret: "secretword"
    }));
    app.use(require("stylus").middleware({
      src: "./public"
    }));
    app.use(app.router);
    return app.use(express.static("./public"));
  });
  app.configure("development", function() {
    return app.use(express.errorHandler({
      dumpExceptions: true,
      showStack: true
    }));
  });
  return app.configure("production", function() {
    return app.use(express.errorHandler());
  });
};
