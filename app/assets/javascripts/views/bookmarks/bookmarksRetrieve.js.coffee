class PickMarks.Views.BookmarksRetrieve extends Backbone.View

  template: JST['bookmarks/retrieve']


  initialize: ->
    @model.retrieveList.on('reset', @render, this)
    # @model.retrieveList.on('reset', @preload, this)
    @model.on('change', @render, this)


  render: ->
    total = @model.retrieveList
    total.sortBy (bookmark) ->
      bookmark.get('count')

    queries = @model.get('query').trim().split(' ')
    

    result = total.filter (bookmark) ->
      find = true
      find = find && ((bookmark.get('name').search(new RegExp(query, "i")) != -1) || (bookmark.get('url').search(new RegExp(query, "i")) != -1)) for query in queries
      find


    $(@el).html(@template(bookmarks: result, query: queries))
    @appendBookmark(bookmark) for bookmark in result

    this

  # preload: ->
  #   img = []
  #   n = 0
  #   @model.retrieveList.each (bookmark) ->
  #     img[n] = new Image()
  #     img[n].src = bookmark.get('snapshot')
  #     n = n + 1

  appendBookmark: (bookmark) ->
    view = new PickMarks.Views.Bookmark(model: bookmark)
    $('#retrieve_list').append(view.render().el)


    
    

