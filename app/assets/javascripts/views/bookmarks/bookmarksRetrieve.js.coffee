class PickMarks.Views.BookmarksRetrieve extends Backbone.View

  template: JST['bookmarks/retrieve']

  # events:
  #   'click a': 'addCount'

  initialize: ->
    @model.retrieveList.on('reset', @render, this)
    @model.on('change', @render, this)


  render: ->
    total = @model.retrieveList
    queries = @model.get('query').trim().split(' ')
    

    result = total.filter (bookmark) ->
      find = true
      find = find && ((bookmark.get('name').search(new RegExp(query, "i")) != -1) || (bookmark.get('url').search(new RegExp(query, "i")) != -1)) for query in queries
      find


    $(@el).html(@template(bookmarks: result, query: queries))
    @appendBookmark(bookmark) for bookmark in result
    # total.each(@appendBookmark)
    this

  appendBookmark: (bookmark) ->
    view = new PickMarks.Views.Bookmark(model: bookmark)
    $('#retrieve_list').append(view.render().el)

  addCount: (e) ->
    alert @$('a').data('bookmark_id')
    @$('a').addClass('abc')
    
    e.preventDefault()
    
    

