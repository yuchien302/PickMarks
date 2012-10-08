window.PickMarks =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new PickMarks.Routers.Bookmarks
    Backbone.history.start({pushState: true})

$(document).ready ->
  PickMarks.init()
