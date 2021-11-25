
class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_bookmark, only: %i[destroy]
  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
   # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end
  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
  def set_list
    @list = List.find(params[:list_id])
  end
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
