require 'uri'

class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:edit, :update, :destroy]
  before_action :set_topic, only: [:new, :edit, :create]

  def new
    @bookmark = Bookmark.new
  end

  def edit
    authorize @bookmark
  end

  def create
    # TODO validate Topic parameters
    @bookmark = @topic.bookmarks.new(bookmark_params)

    format_url

    # if valid?(@bookmark.url)
      if @bookmark.save
        flash[:notice] = "Bookmark '#{@bookmark.url}' created."
        redirect_to root_path
        # TODO redirect back two pages http://stackoverflow.com/questions/30655087/how-to-redirect-toback-two-times
      else
        render :new
      end
    # else
    #   flash[:alert] = "Invalid url '#{@bookmark.url}'. Please include 'http://' or 'https://' "
    #   render :new
    # end
  end

  def update
    authorize @bookmark
    @bookmark.assign_attributes(bookmark_params)

    # if @bookmark.save
    if @bookmark.save && valid?(@bookmark.url)
      flash[:notice] = "Bookmark '#{@bookmark.url}' updated."
      redirect_to root_path
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

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def format_url
    unless @bookmark.url.kind_of?(URI::HTTP)
      @bookmark.url = "http://#{@bookmark.url}"
    end

    begin
      !!URI.parse(@bookmark.url)
    rescue
      flash[:alert] = "Invalid url '#{@bookmark.url}'. Please include 'http://' or 'https://' "
      render :new and return
    end
  end

  # def valid?(uri)
  #   !!URI.parse(uri)
  # rescue URI::InvalidURIError
  #   false
  # end
end
