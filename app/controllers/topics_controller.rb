class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

# REVIEW to make more dry, could you just have it call show? (similar to pundit?)
  def edit
    @topic = Topic.find[params[:id]]
  end

  def create
    @topic = Topic.new(topic_params)
    set_log(@topic)

    if @topic.save
      flash[:notice] = "Topic \##{@log} was successfully created."
      redirect_to bookmarks_path
    else
      render :new
    end
  end

  def update
    set_log(@topic)

    if @topic.update(topic_params)
      redirect_to @topic
      flash[:notice] = "Topic \##{@log} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    set_log(@topic)

    @topic.destroy
    redirect_to bookmarks_url
    flash[:notice] = "Topic \##{@log} was successfully destroyed."
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :user_id)
    end

    def set_log(item)
      @log = item.title;
    end
end
