class PickMarks.Views.BookmarkSearch extends Backbone.View

  template: JST['bookmarkSearch']

  # events:
  #   'submit #search_bookmark': 'retrieveBookmarks'
  #   'keyup #search_bookmark': 'retrieveBookmarks'

  initialize: ->
    @nameView = new PickMarks.Views.BookmarkSearch.Name()
    @nameView.on("updateQuery", @updateQuery)

    @retrievesView = new PickMarks.Views.BookmarkSearch.Retrieves({collection: @model.bookmarks})



  render:  ->
    $(@el).html(@template(query: @model.get('query')))
    this.$("#bookmarksearch_name").html(@nameView.render().el)
    this.$("#bookmarksearch_retrieves").html(@retrievesView.render().el)
    this

  updateQuery: (query) =>
    @model.set('query': query)
    @retrievesView.retrieve( @model.get('query') )
