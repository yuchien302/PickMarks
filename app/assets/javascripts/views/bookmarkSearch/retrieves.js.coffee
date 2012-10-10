class PickMarks.Views.BookmarkSearch.Retrieves extends Backbone.View

  template: JST['bookmarkSearch/retrieves']
  tagName: 'table'
  className: 'table table-hover'  

  initialize: ->
    # @model.retrieveList.on('reset', @render, this)
    # @model.retrieveList.on('reset', @preload, this)
    @collection.on('reset', @render, this)
    @collection.on('add', @prependBookmark, this)

  retrieve: (queries) ->
    total = @collection
    # total.sortBy (bookmark) ->
    #   bookmark.get('count')

    result = total.filter (bookmark) ->
      find = true
      find = find && ((bookmark.get('name').search(new RegExp(query, "i")) != -1) || (bookmark.get('url').search(new RegExp(query, "i")) != -1)) for query in queries
      find


    $(@el).html(@template())
    @prependBookmark(bookmark) for bookmark in result

  render: ->

    $(@el).html(@template())
    @collection.each @prependBookmark

    this

  # preload: ->
  #   img = []
  #   n = 0
  #   @model.retrieveList.each (bookmark) ->
  #     img[n] = new Image()
  #     img[n].src = bookmark.get('snapshot')
  #     n = n + 1

  prependBookmark: (bookmark) ->
    view = new PickMarks.Views.BookmarkSearch.Retrieves.Bookmark(model: bookmark)
    $('#bookmarksearch_retrieves_bookmarks').prepend(view.render().el)


    
    

