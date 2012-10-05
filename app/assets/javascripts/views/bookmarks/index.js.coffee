class PickMarks.Views.BookmarksIndex extends Backbone.View

  template: JST['bookmarks/index']

  events:
    'submit #search_bookmark': 'retrieveBookmarks'
    'keyup #search_bookmark': 'retrieveBookmarks'

  render:  ->
    $(@el).html(@template())
    this

  retrieveBookmarks: (e) ->
    e.preventDefault()
    @model.set({'query': $('#search_bookmark_query').val()})
