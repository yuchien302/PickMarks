class PickMarks.Models.Bookmark extends Backbone.Model
  url: ->
    "api/bookmarks/" + this.get('id')


