class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # def index
  #   @bookmarks = Bookmark.all
  #   # REVIEW better way to do this?
  #   @topics = Topic.all
  # end

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    # @bookmark = @topic.bookmarks.new
    # @topics = Topic.all
    # @topic =
  end

  def edit
  end

  def create
    # @topic = Topic.find[params[:id]]
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)

    if @bookmark.save
      # redirect_to @bookmark, notice: 'Bookmark was successfully created.'
      redirect_to topic_url(@topic), notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      # TODO add rules to ensure valid url
      params.require(:bookmark).permit(:url, :topic_id)
    end
end
