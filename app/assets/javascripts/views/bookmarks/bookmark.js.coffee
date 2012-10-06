class PickMarks.Views.Bookmark extends Backbone.View

  template: JST['bookmarks/bookmark']
  tagName: 'li'

  events:
    'click a': 'addCount'
    # 'mouseenter a': 'showSnapshot'
    # 'mouseleave a': 'hideSnapshot'

  initialize: ->
    @model.on('change', @render, this)


  render: ->
    $(@el).html(@template(bookmark: @model))
    this

  addCount: (e) ->
    count =  @model.get('count')

    @model.set({count: count+1})
    @model.save()

    e.delay(500)
    
  showSnapshot: (e) ->
    snapshot =  @model.get('snapshot')
    $(@el).append("<p id=\"ppreview\"><img class=\"bookmark_preview\" src=\"" + snapshot + "\"></p>")
    @render

  hideSnapshot: (e) ->
    $('p#ppreview').remove()
    # @render
