class BookmarksController < ApplicationController
  before_filter :authenticate
  respond_to :json




  def index
    respond_with Bookmark.where(user_id: current_user.id)
  end

  def new
  end

  def show
    respond_with Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new()
    @bookmark.name = params[:bookmark][:name]
    @bookmark.url = params[:bookmark][:url]
    
    @bookmark.domain_name = @bookmark.url.split('/')[2]
    @bookmark.snapshot = url2png_v6 @bookmark.url
    
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Successfully created bookmark"
    end
    respond_with @bookmark, location: nil
  end

  def update
    respond_with Bookmark.update(params[:id], params[:bookmark])
  end

  def destroy
    respond_with Bookmark.destroy(params[:id])
  end


end
