class PickMarks.Views.BookmarkSearch.Name extends Backbone.View
  template: JST['bookmarkSearch/name']

  events:
    'submit #search_bookmark': 'updateQuery'
    'keyup #input_query': 'updateQuery'

  render:  ->
    $(@el).html(@template())
    this

  updateQuery: (e) ->
    e.preventDefault()
    query = $('#input_query').val()
    queries = query.trim().replace(/\s+/g,' ').split(' ')
    @trigger("updateQuery", queries)
