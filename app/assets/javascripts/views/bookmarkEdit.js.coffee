class PickMarks.Views.BookmarkEdit extends Backbone.View

  template: JST['bookmarkEdit']

  # initialize: ->


  events:
    'click .save':   'save'
    'click .cancel': 'hide'
    'keydown':       'keydown'


  


  render:  ->
    $(@el).html(@template(@model.toJSON()))
    # @delegateEvents()
    this.$('#edit_form').modal('show')
    this

  save: (e) =>
    e.preventDefault()
    name = this.$('#name').val()
    @model.set({'name': name})
    @model.save null,
      success: (model, response) ->
        this.$('#edit_form').modal('hide')
        this.$('#edit_form').remove()
      error: ->
        alert "error in: PickMarks.Views.BookmarkEdit"


  hide: (e) =>
    e.preventDefault()
    this.$('#edit_form').modal('hide')
    this.$('#edit_form').remove()

  keydown: (e) =>
    console.log e.which
    console.log (e.which == 13)
    if e.which == 13
      e.preventDefault()
      @save(e)



