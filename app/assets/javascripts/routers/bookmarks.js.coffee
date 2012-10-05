class PickMarks.Routers.Bookmarks extends Backbone.Router
  routes:
    '': 'index'
    'bookmarks/:id': 'show'

  initialize: ->


    @model = new PickMarks.Models.BookmarksRetrieve()

    @view = new PickMarks.Views.BookmarksIndex({model: @model})
    @retrieveView = new PickMarks.Views.BookmarksRetrieve({model: @model})

  index: ->

    $('#container').html(@view.render().el)
    $('#container').append(@retrieveView.render().el)

  show: (id) ->
    alert "Entry #{id}"