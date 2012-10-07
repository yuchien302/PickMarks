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
    console.log $('#input_query').val()
    @trigger("updateQuery", $('#input_query').val())
