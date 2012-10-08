class PickMarks.Views.BookmarkSearch.Retrieves.Bookmark extends Backbone.View

  template: JST['bookmarkSearch/retrieves/bookmark']
  tagName: 'tr'

  events:
    'click a.url': 'addCount'
    # 'hover ': 'toggleButton'
    'click button.edit': 'showEditForms'
    'click button.destroy': 'destroyBookmark'


  initialize: ->
    @model.on('change', @render, this)


  render: ->
    # $(@el).html(@template(bookmark: @model))
    $(@el).html(@template(@model.toJSON()))
    # this.$('button').hide()
    this

  addCount: (e) ->
    count =  @model.get('count')

    @model.set({count: count+1})
    @model.save()

  showEditForms: (e) =>
    view = new PickMarks.Views.BookmarkEdit({ model: @model })
    $('#modal').html(view.render().el)


  toggleButton: (e) ->
    this.$('button.edit').toggle();
    this.$('button.destroy').toggle();
    
  destroyBookmark: (e) ->
    e.preventDefault()
    this.$el.fadeOut()
    @model.destroy
      wait: true
      # success: ->
      #   alert "123"







