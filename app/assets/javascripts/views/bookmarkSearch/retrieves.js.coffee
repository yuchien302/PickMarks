class PickMarks.Views.BookmarkSearch.Retrieves extends Backbone.View

  template: JST['bookmarkSearch/retrieves']


  initialize: ->
    # @model.retrieveList.on('reset', @render, this)
    # @model.retrieveList.on('reset', @preload, this)
    @collection.on('reset', @render, this)

  retrieve: (queries) ->
    total = @collection
    # total.sortBy (bookmark) ->
    #   bookmark.get('count')

    
    

    result = total.filter (bookmark) ->
      find = true
      find = find && ((bookmark.get('name').search(new RegExp(query, "i")) != -1) || (bookmark.get('url').search(new RegExp(query, "i")) != -1)) for query in queries
      find


    $(@el).html(@template())
    @appendBookmark(bookmark) for bookmark in result

  render: ->

    $(@el).html(@template())
    @collection.each @appendBookmark

    this

  # preload: ->
  #   img = []
  #   n = 0
  #   @model.retrieveList.each (bookmark) ->
  #     img[n] = new Image()
  #     img[n].src = bookmark.get('snapshot')
  #     n = n + 1

  appendBookmark: (bookmark) ->
    view = new PickMarks.Views.BookmarkSearch.Retrieves.Bookmark(model: bookmark)
    $('#bookmarksearch_retrieves_bookmarks').append(view.render().el)


    
    

