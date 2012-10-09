class PickMarks.Routers.Bookmarks extends Backbone.Router
  routes:
    '': 'root'
    'users/:user_id/search': 'search'
    'bookmarks/:id': 'show'

  # initialize: ->


  root: ->
    alert "root"

  search: (user_id) ->
    alert "User #{user_id}"
    @bookmarks = new PickMarks.Collections.Bookmarks(user_id)

    @bookmarks.fetch()
    @bookmarkSearch = new PickMarks.Models.BookmarkSearch({collection: @bookmarks})
    @bookmarkSearchView = new PickMarks.Views.BookmarkSearch({model: @bookmarkSearch})

    # @retrieveView = new PickMarks.Views.BookmarksRetrieve({model: @model})

    $('#container').html(@bookmarkSearchView.render().el)
    # $('#container').append(@retrieveView.render().el)

  show: (id) ->
    alert "Entry #{id}"
