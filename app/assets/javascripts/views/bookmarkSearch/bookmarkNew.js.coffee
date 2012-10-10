class PickMarks.Views.BookmarkNew extends Backbone.View

  template: JST['bookmarkNew']

  events:
    'click .save':   'newBookmark'


  initialize: ->

  render:  ->
    $(@el).html(@template())
    @delegateEvents()
    this.$('#new_form').modal('show')
    this

  newBookmark: (e) ->
    e.preventDefault()
    attributes = 
      name: $('#new_name').val()
      url: $('#new_url').val()
    @trigger("newBookmark", attributes)
