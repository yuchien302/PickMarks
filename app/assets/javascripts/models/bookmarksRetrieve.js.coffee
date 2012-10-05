class PickMarks.Models.BookmarksRetrieve extends Backbone.Model
  
  defaults: { 'query':'' }

  initialize: ->
    @retrieveList = new PickMarks.Collections.Bookmarks()
    @retrieveList.fetch()
