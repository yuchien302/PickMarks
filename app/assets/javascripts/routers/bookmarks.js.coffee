class PickMarks.Routers.Bookmarks extends Backbone.Router
  routes:
    '': 'root'
    'users/:id': 'search'
    'bookmarks/:id': 'show'

  initialize: ->
    @bookmarks = new PickMarks.Collections.Bookmarks()
    @bookmarks.fetch()

  root: ->
    alert "root"

  search: (id) ->
    alert "User #{id}"
    @bookmarkSearch = new PickMarks.Models.BookmarkSearch({collection: @bookmarks})
    @bookmarkSearchView = new PickMarks.Views.BookmarkSearch({model: @bookmarkSearch})

    # @retrieveView = new PickMarks.Views.BookmarksRetrieve({model: @model})

    $('#container').html(@bookmarkSearchView.render().el)
    # $('#container').append(@retrieveView.render().el)

  show: (id) ->
    alert "Entry #{id}"
