class PickMarks.Routers.Bookmarks extends Backbone.Router
  routes:
    '': 'root'



  # initialize: ->


  root:  ->
    @bookmarks = new PickMarks.Collections.Bookmarks()

    @bookmarks.fetch()
    @bookmarkSearch = new PickMarks.Models.BookmarkSearch({bookmarks: @bookmarks})
    @bookmarkSearchView = new PickMarks.Views.BookmarkSearch({model: @bookmarkSearch})

    # @retrieveView = new PickMarks.Views.BookmarksRetrieve({model: @model})

    $('#container').html(@bookmarkSearchView.render().el)
    # $('#container').append(@retrieveView.render().el)

  # new: (user_id) ->
  #   alert "New: User #{user_id}"
  #   @bookmarkNewView = new PickMarks.Views.BookmarkNew()
  #   $('#container').html(@bookmarkNewView.render().el)

