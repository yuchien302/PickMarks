window.PickMarks =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new PickMarks.Routers.Bookmarks
    Backbone.history.start()

$(document).ready ->
  PickMarks.init()
