# REVIEW (A) make sure heroku is working properly
class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:edit, :update, :destroy]

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
    authorize @bookmark
  end

  def create
    # TODO validate Topic parameters
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark '#{@bookmark.url}' created."
      redirect_to topic_url(@topic)
    else
      render :new
    end
  end

  def update
    authorize @bookmark
    # TODO fix this. See bloccit
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark '#{@bookmark.url}' updated."
      redirect_to @bookmark.topic
    else
      render :edit
    end
  end

  def destroy
    authorize @bookmark

    @bookmark.destroy
    flash[:notice] = "Bookmark '#{@bookmark.url}' destroyed."
    redirect_to root_path
  end

  private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end
end
