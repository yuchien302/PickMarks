class PickMarks.Views.BookmarkSearch.Retrieves.Bookmark extends Backbone.View

  template: JST['bookmarkSearch/retrieves/bookmark']
  tagName: 'li'

  events:
    'click a': 'addCount'

  initialize: ->
    @model.on('change', @render, this)


  render: ->
    $(@el).html(@template(bookmark: @model))
    this

  addCount: (e) ->
    count =  @model.get('count')

    @model.set({count: count+1})
    @model.save()

    
