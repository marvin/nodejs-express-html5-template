doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    link rel: 'stylesheet', href: '/css/style.css'
    script src: '/js/jquery.min.js'
    script src: '/js/app.js'
    if @title?
    	title "#{@title}"
    else
    	title "default title"
  body ->
      div id: 'container', ->
        @body