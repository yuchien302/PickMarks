class PickMarks.Collections.Bookmarks extends Backbone.Collection

  model: PickMarks.Models.Bookmark
  url: ->
    '/api/users/' + @user_id + '/bookmarks'

    # will then be /bookmarks.json/21, which no route match
    # '/api/users/' + @user_id.toString() + '/bookmarks.json'  

  initialize: (user_id)->
    @user_id = user_id

