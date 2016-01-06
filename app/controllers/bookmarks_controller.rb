# REVIEW (A) make sure heroku is working properly
class BookmarksController < ApplicationController
  # TODO fix this, redundant
  before_action :set_bookmark, only: [:edit, :update, :destroy]

  # def index
  #   @bookmarks = Bookmark.all
  #   @topics = Topic.all
  # end

  # def show
  # end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    # @bookmark = @topic.bookmarks.new
    # @topics = Topic.all
    # @topic =
  end

  def edit
    authorize @bookmark

    # if
    #   # REVIEW needed? this wasn't needed in Bloccit
    #   @topic = Topic.find(params[:topic_id])
    # end

    # @bookmark = Bookmark.find(params[:id])
  end

  def create
    # TODO validate parameters
    # @topic = Topic.find[params[:id]]
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(bookmark_params)
    set_log(@bookmark)

    if @bookmark.save
      # redirect_to @bookmark, notice: 'Bookmark was successfully created.'
      flash[:notice] = "Bookmark '#{@log}' created."
      redirect_to topic_url(@topic)
    else
      render :new
    end
  end

  def update
    authorize @bookmark
    # TODO fix this. See bloccit
    # @topic = Topic.find(params[:topic_id])
    # @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)
    set_log(@bookmark)

    # if @bookmark.update(bookmark_params)
    if @bookmark.save
      # TODO fix log message
      flash[:notice] = "Bookmark '#{@log}' updated."
      redirect_to @bookmark.topic
    else
      render :edit
    end
  end

  def destroy
    authorize @bookmark
    set_log(@bookmark)

    @bookmark.destroy
    # TODO fix log message
    flash[:notice] = "Bookmark '#{@log}' destroyed."
    redirect_to root_path
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      # TODO add rules to ensure valid url
      params.require(:bookmark).permit(:url, :topic_id)
    end

# REVIEW better place for this to make it more DRY?
    def set_log(item)
      @log = item.url;
    end
end
