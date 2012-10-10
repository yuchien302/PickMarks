class PickMarks.Views.BookmarkPanel extends Backbone.View

  template: JST['bookmarkPanel']

  events:
    'click': 'showNewForms'
    'newBookmark' : 'newBookmark'


  render: ->
    $(@el).html(@template())
    this

  showNewForms: =>
    view = new PickMarks.Views.BookmarkNew()
    view.on("newBookmark", @newBookmark)
    $('#modal').html(view.render().el)

  newBookmark: (attributes) =>
    @trigger("newBookmark", attributes)