class PickMarks.Models.BookmarkSearch extends Backbone.Model
  
  defaults: { 'query':'' }

  initialize: (options) ->
    @bookmarks = options.collection

