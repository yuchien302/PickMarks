class PickMarks.Models.BookmarkSearch extends Backbone.Model
  
  defaults: { 'queries':'' }

  initialize: (options) ->
    @bookmarks = options.bookmarks

