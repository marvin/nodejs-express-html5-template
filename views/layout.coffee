doctype 5
ie 'lt IE 7', ->
  html class: "no-js lt-ie9 lt-ie8 lt-ie7", lang: "en"
ie 'IE 7', ->
  html class: "no-js lt-ie9 lt-ie8", lang: "en"
ie 'IE 8', ->
  html class: "no-js lt-ie9", lang: "en"
ie 'gt IE 8', ->
  html class: "no-js", lang: "en"

html ->
  head ->
    meta charset: 'utf-8'
    meta 'http-equiv': "X-UA-Compatible", content: "IE=edge,chrome=1"
    meta name: "description", content: ""
    meta name: "viewport", content: "width=device-width"

    if @title?
      title "#{@title}"
    else
      title "default title"

    link rel: 'stylesheet', href: '/css/style.css'
    
    script src: '/js/modernizr.min.js'

  body ->
    ie 'lt IE 7', ->
      p class: "chromeframe", ->
        "Your browser is #{yield -> em('ancient1')}. #{ yield -> (a href: 'http://browsehappy.com/', 'Upgrade to a different browser')} or #{ yield -> (a href: 'http://www.google.com/chromeframe/?redirect=true', 'install Google Chrome Frame')} to experience this site."

    div id: 'container', ->
      @body

    script src: '/js/jquery.min.js'
    script src: '/js/app.js'

    coffeescript ->
      _gaq = [ [ "_setAccount", "UA-XXXXX-X" ], [ "_trackPageview" ] ]
      ((d, t) ->
          g = d.createElement(t)
          s = d.getElementsByTagName(t)[0]
          g.src = (if "https:" is location.protocol then "//ssl" else "//www") + ".google-analytics.com/ga.js"
          s.parentNode.insertBefore g, s
      ) document, "script"