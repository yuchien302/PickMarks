class BookmarksController < ApplicationController
  respond_to :json

  def index
    respond_with Bookmark.all
  end

  def show
    respond_with Bookmark.find(params[:id])
  end

  def create
    respond_with Bookmark.create(params[:bookmark])
  end

  def update
    respond_with Bookmark.update(params[:id], params[:bookmark])
  end

  def destroy
    respond_with Bookmark.destroy(params[:id])
  end
end
