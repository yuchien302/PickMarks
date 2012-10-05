class PickMarks.Views.Bookmark extends Backbone.View

  template: JST['bookmarks/bookmark']
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

    @model.set({count: count+1}, {silent: true})
    @model.save()

    @$('span').text( parseInt(@$('span').text()) + 1 )

    e.delay(1000)
    
    




# <% for bookmark in @bookmarks: %>
#   <li><img src="http://www.google.com/s2/favicons?domain=<%= bookmark.get('domain_name') %>">   <a href= <%= bookmark.get('url') %> data-bookmark_id= <%= bookmark.get('id') %> ><%= bookmark.get('name') %> <%= bookmark.get('count') %></a></li>
# <% end %>
